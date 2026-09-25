"""Offline checks for the cloud deadline and quarantine preservation helpers."""
import importlib.util
import json
from pathlib import Path
import subprocess
import sys
import tarfile
import tempfile
import unittest


def module(name):
    spec = importlib.util.spec_from_file_location(name, Path(__file__).with_name(name + ".py"))
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


bounded = module("run_bounded")
backup = module("backup")


class CloudChecks(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix="trawl-cloud-check-")
        self.addCleanup(self.temp.cleanup)
        self.base = Path(self.temp.name)

    def supervise(self, script, **options):
        return bounded.supervise([sys.executable, "-c", script], cwd=self.base, **options)

    def test_normal_exit_is_preserved(self):
        result = self.supervise("raise SystemExit(7)", seconds=3)
        self.assertEqual(result, {"returncode": 7, "stop_reason": "finished", "forced_stop": False})

    def test_deadline_sends_sigint_and_waits_for_saved_reply(self):
        script = """
import signal, time
from pathlib import Path
def drain(*_):
    time.sleep(0.1)
    Path('saved.json').write_text('{"saved": true}')
    raise SystemExit(130)
signal.signal(signal.SIGINT, drain)
while True:
    time.sleep(1)
"""
        result = self.supervise(script, seconds=0.5, grace_seconds=3)
        self.assertEqual(result["returncode"], 130)
        self.assertEqual(result["stop_reason"], "deadline")
        self.assertFalse(result["forced_stop"])
        self.assertTrue(json.loads((self.base / "saved.json").read_text())["saved"])

    def test_stuck_process_is_killed_after_grace_window(self):
        script = "import signal, time; signal.signal(signal.SIGINT, signal.SIG_IGN); time.sleep(60)"
        result = self.supervise(script, seconds=0.5, grace_seconds=0.1)
        self.assertTrue(result["forced_stop"])
        self.assertEqual(result["returncode"], -9)

    def populate(self):
        quarantine = self.base / "quarantine"
        quarantine.mkdir()
        for name, content in {"quarantine.json": "{}", "workspaces/one/state.json": "{}",
                              "workspaces/one/delegations/child.json": "{}", "trawls/one/response.json": "{}",
                              "unfinished/one.md": "saved reasoning", "cloud-runs/one.json": "{}",
                              "cache/snapshot": "not durable", "config.local.yaml": "secret fixture",
                              ".env": "secret fixture", ".git/credential-fixture": "secret fixture"}.items():
            path = quarantine / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content)
        return quarantine

    def test_archive_preserves_delegations_and_excludes_root_secrets(self):
        quarantine = self.populate()
        output = self.base / "backup.tar.gz"
        backup.archive(quarantine, output)
        with tarfile.open(output) as archive:
            names = archive.getnames()
            self.assertIn("workspaces/one/delegations/child.json", names)
            self.assertIn("trawls/one/response.json", names)
            self.assertIn("unfinished/one.md", names)
            self.assertIn("cloud-runs/one.json", names)
            for name in names:
                self.assertIn(name.split("/")[0], backup.DURABLE)
                item = archive.extractfile(name) if archive.getmember(name).isfile() else None
                if item:
                    self.assertNotIn(b"secret fixture", item.read())

    def git(self, root, *args):
        return subprocess.check_output(["git", "-C", str(root), *args], stderr=subprocess.DEVNULL, text=True).strip()

    def test_git_backup_pushes_only_artifacts_to_local_remote(self):
        quarantine = self.populate()
        remote = self.base / "remote.git"
        self.git(self.base, "init", "--bare", str(remote))
        self.git(quarantine, "init", "-b", "main")
        self.git(quarantine, "remote", "add", "origin", str(remote))
        backup.push(quarantine, "main")
        names = self.git(remote, "ls-tree", "-r", "--name-only", "main").splitlines()
        self.assertIn("workspaces/one/state.json", names)
        self.assertIn("cloud-runs/one.json", names)
        self.assertTrue(all(name.split("/")[0] in backup.DURABLE for name in names))
        head = self.git(remote, "rev-parse", "main")
        backup.push(quarantine, "main")
        self.assertEqual(self.git(remote, "rev-parse", "main"), head)

    def test_preexisting_staged_secret_is_never_committed(self):
        quarantine = self.populate()
        self.git(quarantine, "init", "-b", "main")
        self.git(quarantine, "add", ".env")
        with self.assertRaisesRegex(ValueError, "outside"):
            backup.push(quarantine, "main")
        self.assertEqual(self.git(quarantine, "rev-list", "--all"), "")


if __name__ == "__main__":
    unittest.main()
