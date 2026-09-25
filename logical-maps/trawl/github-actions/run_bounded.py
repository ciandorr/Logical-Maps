"""Bound one cloud invocation, leaving time to drain and back up quarantine."""
from __future__ import annotations

import argparse
from datetime import datetime, timezone
import json
import os
from pathlib import Path
import signal
import subprocess
import sys


def stamp():
    return datetime.now(timezone.utc).isoformat()


def supervise(command, *, cwd, seconds, grace_seconds=900):
    """First stop drains replies; a stuck process cannot consume the backup window."""
    child = subprocess.Popen(command, cwd=cwd, start_new_session=True)
    reason = "finished"
    forced = False
    try:
        returncode = child.wait(timeout=seconds)
    except (subprocess.TimeoutExpired, KeyboardInterrupt) as error:
        reason = "deadline" if isinstance(error, subprocess.TimeoutExpired) else "operator-stop"
        print("Stopping discovery; saving outstanding replies before backup.", flush=True)
        try:
            os.killpg(child.pid, signal.SIGINT)
        except ProcessLookupError:
            pass
        try:
            returncode = child.wait(timeout=grace_seconds)
        except (subprocess.TimeoutExpired, KeyboardInterrupt):
            forced = True
            print("Drain time exhausted; retaining saved files and pending request journals.", flush=True)
            try:
                os.killpg(child.pid, signal.SIGKILL)
            except ProcessLookupError:
                pass
            returncode = child.wait()
    return {"returncode": returncode, "stop_reason": reason, "forced_stop": forced}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--quarantine", type=Path, required=True)
    parser.add_argument("--runner", type=Path, required=True)
    parser.add_argument("--config", type=Path, required=True)
    parser.add_argument("--minutes", type=int, required=True)
    args = parser.parse_args()
    if not 1 <= args.minutes <= 300:
        parser.error("minutes must be between 1 and 300")
    if not os.environ.get("DEEPSEEK_API_KEY"):
        parser.error("set the quarantine repository's DEEPSEEK_API_KEY Actions secret")
    quarantine = args.quarantine.resolve()
    runner = args.runner.resolve()
    if not (quarantine / "quarantine.json").is_file():
        parser.error("destination must be an initialized quarantine repository")
    # The tracked config contains only an environment variable name, never its value.
    config = args.config.resolve()
    sys.path.insert(0, str(runner))
    from trawl import core
    settings = core.config(config)
    if settings["discovery"].get("api_key_env") != "DEEPSEEK_API_KEY":
        parser.error("cloud config must name the DEEPSEEK_API_KEY environment variable")
    local_config = quarantine / "config.local.yaml"
    local_config.write_bytes(config.read_bytes())
    run_id = os.environ.get("GITHUB_RUN_ID", "local")
    attempt = os.environ.get("GITHUB_RUN_ATTEMPT", "1")
    if not (run_id == "local" or run_id.isdecimal()) or not attempt.isdecimal():
        parser.error("invalid Actions run identity")
    record = {"started_at": stamp(), "workflow_run_id": run_id,
              "workflow_run_attempt": attempt, "minutes": args.minutes,
              "runner_commit": subprocess.check_output(
                  ["git", "rev-parse", "HEAD"], cwd=runner, text=True).strip(),
              "config_sha256": core.digest(settings)}
    directory = quarantine / "cloud-runs"
    directory.mkdir(exist_ok=True)
    path = directory / f"github-{run_id}-{attempt}.json"
    if path.exists():
        parser.error("cloud run identity already exists; historical metadata is immutable")
    core.save(path, record)
    outcome = supervise([sys.executable, "scripts/trawl.py", "--quarantine", str(quarantine), "run"],
                        cwd=runner, seconds=args.minutes * 60)
    core.save(path.with_name(path.stem + "-outcome.json"), {**outcome, "finished_at": stamp()})
    summary = os.environ.get("GITHUB_STEP_SUMMARY")
    if summary:
        with open(summary, "a", encoding="utf-8") as stream:
            stream.write(f"Theorem trawl stopped: {outcome['stop_reason']}. "
                         f"Runner exit: {outcome['returncode']}. "
                         f"Forced stop: {outcome['forced_stop']}. "
                         "Saved work is backed up in the following steps.\n")
    if outcome["forced_stop"]:
        return 1
    # A deliberate deadline is successful when the runner acknowledged SIGINT.
    if outcome["stop_reason"] != "finished" and outcome["returncode"] in (0, 130, -signal.SIGINT):
        return 0
    return 0 if outcome["returncode"] == 0 else 1


if __name__ == "__main__":
    raise SystemExit(main())
