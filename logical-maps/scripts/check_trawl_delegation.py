"""Offline checks for durable delegation and isolated checkpoint handoffs."""
from copy import deepcopy
from pathlib import Path
import sys
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from trawl import core as c, delegation as d, workspaces as w
from check_trawl import TrawlTest


class DelegationTest(unittest.TestCase):
    setUp = TrawlTest.setUp
    commit = TrawlTest.commit

    def parent(self):
        return w.create(self.q, self.settings, self.snapshot, self.origin, self.task,
                        c.plan(self.snapshot, self.settings))

    def spawn(self, folder, manifest, *, index=0, args=None, metadata=None):
        result = d.handle(folder, manifest, "spawn_subagent",
                          args or {"task": "Check an independent omitted implication.",
                                   "context": "Save a proof and identify its assumptions."},
                          metadata or self.metadata, index)
        return next(job for job in d.jobs(folder) if job["id"] == result["subagent_id"])

    def completed(self, folder, manifest, *, index=0):
        job = self.spawn(folder, manifest, index=index)
        child, child_manifest = w.create(
            self.q, self.settings, self.snapshot, self.origin, job["task"],
            c.plan(self.snapshot, self.settings), wid=job["child_workspace"], assignment=job)
        actual = {**self.metadata, "trawl_id": "trawl-child",
                  "actor": {**self.metadata["actor"], "reported_model": "actual-model-version"}}
        w.execute_tool(child, child_manifest, {"name": "write_file", "arguments": {
            "path": "work/notes/progress.md", "content": "A concrete saved proposal.\n"}}, actual, 0)
        w.execute_tool(child, child_manifest, {"name": "delete_file", "arguments": {
            "path": "work/logical-maps/topics/example/background.md"}}, actual, 1)
        state = c.read(child / "state.json")
        state.update(status="complete", last_note="Found one candidate; it needs review.")
        w.state_save(child, state)
        checkpoint = w.checkpoint(self.q, child.name, reason="subagent-complete")
        w.seal_workspace(child)
        return job, child, checkpoint

    def test_spawn_replay_is_durable_scoped_and_does_not_create_child(self):
        folder, manifest = self.parent()
        job = self.spawn(folder, manifest)
        saved_bytes = (folder / "delegations" / job["id"] / "task.json").read_bytes()
        self.assertEqual(self.spawn(folder, manifest), job)
        self.assertEqual((folder / "delegations" / job["id"] / "task.json").read_bytes(), saved_bytes)
        self.assertEqual(len(d.jobs(folder)), 1)
        self.assertTrue(d.outstanding(folder))
        self.assertEqual(job["family_id"], manifest["id"])
        self.assertEqual(job["source"], self.origin)
        self.assertEqual(job["actor"], self.metadata["actor"])
        self.assertFalse((self.q / "workspaces" / job["child_workspace"]).exists())
        with self.assertRaisesRegex(ValueError, "differs"):
            self.spawn(folder, manifest, args={"task": "A different replayed task."})
        with self.assertRaisesRegex(ValueError, "unknown subagent"):
            d.handle(folder, manifest, "subagent_status", {"subagent_id": "workspace-other"}, self.metadata, 1)
        with self.assertRaisesRegex(ValueError, "pinned central"):
            self.spawn(folder, manifest, index=1, args={"task": "Outside scope", "question_id": "unknown"})

    def test_question_selection_family_inheritance_and_finite_declaration_ceiling(self):
        folder, manifest = self.parent()
        ranked = c.read(folder / "reference/queue.json")
        other = next(task for task in ranked if task["id"] != manifest["task"]["id"])
        metadata = {**self.metadata, "requests_per_run": 1}
        job = self.spawn(folder, manifest, args={"task": "Check another central question.",
                         "question_id": other["id"]}, metadata=metadata)
        self.assertEqual(job["task"], other)
        with self.assertRaisesRegex(ValueError, "request ceiling"):
            self.spawn(folder, manifest, index=1, metadata=metadata)
        # A replay remains valid at the declaration ceiling.
        self.spawn(folder, manifest, args={"task": "Check another central question.",
                   "question_id": other["id"]}, metadata=metadata)
        self.spawn(folder, manifest, args={"task": "Check another central question.",
                   "question_id": other["id"]}, metadata={**metadata, "requests_per_run": 5})
        child, child_manifest = w.create(self.q, self.settings, self.snapshot, self.origin,
            other, ranked, wid=job["child_workspace"], assignment=job)
        grandchild = self.spawn(child, child_manifest)
        self.assertEqual(grandchild["family_id"], manifest["id"])
        self.assertNotEqual(grandchild["child_workspace"], job["child_workspace"])
        self.assertEqual(len(d.jobs(folder)), 1)
        self.assertEqual(len(d.jobs(child)), 1)
        self.assertEqual(d.handle(child, child_manifest, "wait_for_subagents", {}, self.metadata, 5)["pending"], 1)

    def test_handoff_copies_frozen_changes_and_provenance_without_merging(self):
        folder, manifest = self.parent()
        before = w.tree(folder / "files")
        job, child, checkpoint = self.completed(folder, manifest)
        result = d.deliver(self.q, folder, job, child, checkpoint)
        destination = folder / result["handoff"]
        self.assertEqual(w.tree(folder / "files"), before)
        self.assertEqual((destination / "files/notes/progress.md").read_text(), "A concrete saved proposal.\n")
        self.assertFalse((destination / "files/logical-maps/topics/example/background.md").exists())
        handed = c.read(destination / "manifest.json")
        self.assertEqual(handed["checkpoint"]["sha256"], checkpoint["candidate_sha256"])
        self.assertEqual(handed["verification"], "unreviewed")
        self.assertEqual(next(change for change in handed["changes"] if change["path"].endswith("background.md"))["operation"], "delete")
        self.assertTrue(any(actor.get("reported_model") == "actual-model-version" for actor in handed["observed_actors"]))
        self.assertIn("Found one candidate", (destination / "summary.md").read_text())
        self.assertEqual(sorted(w.tree(destination)), ["files/notes/progress.md", "manifest.json", "summary.md"])
        self.assertFalse(d.outstanding(folder))
        self.assertEqual(d.deliver(self.q, folder, job, child, checkpoint), result)
        status = d.handle(folder, manifest, "subagent_status", {"subagent_id": job["id"]}, self.metadata, 2)
        self.assertEqual(status["pending"], 0)
        # Existing workspace boundary exposes the deliberate handoff but prevents writes.
        path = result["handoff"] + "files/notes/progress.md"
        reply = w.execute_tool(folder, manifest, {"name": "read_file", "arguments": {"path": path}}, self.metadata, 3)
        self.assertIn("concrete saved proposal", reply["content"])
        reply = w.execute_tool(folder, manifest, {"name": "write_file", "arguments": {"path": path, "content": "overwrite"}}, self.metadata, 4)
        self.assertIn("error", reply)
        self.assertIn("error", w.execute_tool(folder, manifest, {"name": "read_file", "arguments": {
            "path": "reference/../../" + child.name + "/state.json"}}, self.metadata, 5))

    def test_handoff_recovers_after_publish_before_receipt_without_overwriting(self):
        folder, manifest = self.parent()
        job, child, checkpoint = self.completed(folder, manifest)
        original = c.save
        def fail_receipt(path, value):
            if Path(path).name == "result.json":
                raise OSError("simulated crash before durable receipt")
            return original(path, value)
        with patch.object(c, "save", side_effect=fail_receipt):
            with self.assertRaisesRegex(OSError, "simulated crash"):
                d.deliver(self.q, folder, job, child, checkpoint)
        destination = folder / "reference/subagents" / job["id"]
        before = w.tree(destination)
        self.assertTrue(d.outstanding(folder))
        result = d.deliver(self.q, folder, job, child, checkpoint)
        self.assertEqual(w.tree(destination), before)
        self.assertFalse(d.outstanding(folder))
        # Crash replay must also reject a handoff manually changed after publishing.
        (destination / "summary.md").write_text("Changed after publication")
        with self.assertRaisesRegex(ValueError, "differs"):
            d.deliver(self.q, folder, job, child, checkpoint)

    def test_failed_staging_exposes_no_partial_handoff_and_can_retry(self):
        folder, manifest = self.parent()
        job, child, checkpoint = self.completed(folder, manifest)
        original = c.save_text
        def fail_summary(path, value):
            if Path(path).name == "summary.md":
                raise OSError("simulated interrupted handoff write")
            return original(path, value)
        with patch.object(c, "save_text", side_effect=fail_summary):
            with self.assertRaisesRegex(OSError, "interrupted handoff"):
                d.deliver(self.q, folder, job, child, checkpoint)
        self.assertFalse((folder / "reference/subagents" / job["id"]).exists())
        self.assertFalse(list((folder / "delegations" / job["id"]).glob(".handoff-*")))
        self.assertTrue(d.outstanding(folder))
        result = d.deliver(self.q, folder, job, child, checkpoint)
        self.assertTrue((folder / result["handoff"] / "manifest.json").is_file())

    def test_bad_checkpoint_paths_hashes_and_symlinks_never_reach_parent(self):
        folder, manifest = self.parent()
        job, child, checkpoint = self.completed(folder, manifest)
        original = c.read(self.q / "candidates" / (checkpoint["checkpoint"] + ".json"))
        for unsafe in ("../outside.md", "/absolute.md", ".git/config", "notes/../../outside", "./notes/alias.md", "notes\\bad.md"):
            with self.subTest(path=unsafe):
                bad = deepcopy(original)
                bad["id"] = c.uid("checkpoint")
                bad["content"]["changes"][0]["path"] = unsafe
                bad["content_sha256"] = c.digest(bad["content"])
                c.save(self.q / "candidates" / (bad["id"] + ".json"), bad)
                with self.assertRaisesRegex(ValueError, "relative file paths"):
                    d.deliver(self.q, folder, job, child, bad["id"])
        with self.assertRaisesRegex(ValueError, "checkpoint hash"):
            d.deliver(self.q, folder, job, child, {**checkpoint, "candidate_sha256": "0" * 64})
        outside = self.base / "outside"
        outside.mkdir()
        (folder / "reference/subagents").symlink_to(outside, target_is_directory=True)
        with self.assertRaisesRegex(ValueError, "symlink"):
            d.deliver(self.q, folder, job, child, checkpoint)
        self.assertFalse(list(outside.iterdir()))

    def test_closed_parent_cannot_read_jobs_or_receive_new_handoff(self):
        folder, manifest = self.parent()
        job, child, checkpoint = self.completed(folder, manifest)
        w.seal_workspace(folder)
        with self.assertRaisesRegex(ValueError, "sealed"):
            d.handle(folder, manifest, "subagent_status", {}, self.metadata, 3)
        with self.assertRaisesRegex(ValueError, "sealed"):
            d.deliver(self.q, folder, job, child, checkpoint)


if __name__ == "__main__":
    unittest.main(defaultTest="DelegationTest", verbosity=2)
