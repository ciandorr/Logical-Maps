"""Offline integration checks for model-directed concurrent theorem trawls."""
from collections import Counter
import json
from pathlib import Path
import sys
import threading
import unittest
from unittest.mock import patch

import check_trawl as fixtures

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from trawl import core as t, delegation, parallel, providers, workspaces as w


class ParallelTrawlTest(unittest.TestCase):
    # Reuse setup/helpers without inheriting the sequential integration suite.
    setUp = fixtures.TrawlTest.setUp
    commit = fixtures.TrawlTest.commit
    live_workspace = fixtures.TrawlTest.live_workspace
    tool_response = fixtures.TrawlTest.tool_response
    workspace = fixtures.TrawlTest.workspace

    def prepare(self, *, requests=30, tokens=1000, maximum=2, output=64):
        self.live_workspace(budget=requests)
        self.settings["limits"].update(output_tokens_per_run=tokens,
            max_output_tokens=output, max_concurrent_agents=maximum)
        return self.workspace()

    def run_lead(self, manifest):
        return t.run(self.q, self.settings, self.snapshot, self.origin, workspace=manifest["id"])

    def identify(self, body):
        initial = json.loads(body["messages"][1]["content"])
        assignment = initial.get("subagent_assignment")
        return (assignment["brief"]["task"] if assignment else "lead"), initial

    def response(self, calls=(), *, final="Complete", tokens=5):
        raw = self.tool_response(calls, final=final)
        raw["usage"]["completion_tokens"] = tokens
        return raw

    def spawn(self, *names, tokens=5):
        return self.response([*(('spawn_subagent', {"task": name}) for name in names),
                              ("wait_for_subagents", {})], tokens=tokens)

    def test_model_requested_children_overlap_and_handoffs_remain_isolated(self):
        folder, manifest = self.prepare()
        barrier = threading.Barrier(2, timeout=5)
        counts = Counter()
        lock = threading.Lock()
        observed = {"active": 0, "peak": 0}
        coordinator = threading.get_ident()
        real_tool = w.execute_tool

        def tool(*args, **kwargs):
            self.assertEqual(threading.get_ident(), coordinator)
            return real_tool(*args, **kwargs)

        def complete(profile, body, **_):
            self.assertNotEqual(threading.get_ident(), coordinator)
            name, initial = self.identify(body)
            with lock:
                counts[name] += 1
                turn = counts[name]
            if name == "lead":
                if turn == 1:
                    return self.spawn("alpha", "beta")
                self.assertEqual(delegation._status(folder)["pending"], 0)
                self.assertIn("Your requested subagents have finished", json.dumps(body))
                return self.response()
            if turn == 1:
                with lock:
                    observed["active"] += 1
                    observed["peak"] = max(observed["peak"], observed["active"])
                barrier.wait()
                with lock:
                    observed["active"] -= 1
                return self.response([
                    ("write_file", {"path": "work/notes/shared.md", "content": name}),
                    ("logical_query", {"premises": ["a"], "conclusions": ["a"]}),
                    ("read_file", {"path": "work/../workspaces/forbidden/state.json"}),
                ])
            return self.response(final=f"Completed {name}")

        with patch.object(providers, "complete", side_effect=complete), patch.object(w, "execute_tool", side_effect=tool):
            result = self.run_lead(manifest)
        self.assertEqual(observed["peak"], 2)
        self.assertEqual(result["peak_concurrent_requests"], 2)
        self.assertEqual(result["requests"], 6)
        self.assertEqual(counts, {"lead": 2, "alpha": 2, "beta": 2})
        # Each intentional cross-workspace read was denied; ordinary tools worked.
        self.assertEqual(len(result["errors"]), 2)
        self.assertTrue(all("outside" in error["error"] for error in result["errors"]))
        self.assertFalse((folder / "files/notes/shared.md").exists())
        for job in delegation.jobs(folder):
            name = job["brief"]["task"]
            child = self.q / "workspaces" / job["child_workspace"]
            self.assertEqual((child / "files/notes/shared.md").read_text(), name)
            self.assertTrue((child / "SEALED.json").exists())
            handoff = folder / "reference/subagents" / job["id"]
            self.assertEqual((handoff / "files/notes/shared.md").read_text(), name)
            audit = t.read(handoff / "manifest.json")
            self.assertEqual(audit["verification"], "unreviewed")
            self.assertEqual(audit["source"]["commit"], self.origin["commit"])
            self.assertEqual(audit["observed_actors"][0]["reported_model"], "reported-model")
            self.assertEqual(audit["edit_provenance"][0]["discovery"]["actor"]["reported_model"], "reported-model")
            reports = [t.read(path) for path in (child / "derived").glob("*.json")]
            self.assertEqual(len(reports), 1)
            self.assertTrue(reports[0]["valid"])
        self.assertFalse((self.topic / "notes/shared.md").exists())

    def test_shared_request_cap_does_not_multiply_with_requested_children(self):
        folder, manifest = self.prepare(requests=2, maximum=4)
        calls = []

        def complete(profile, body, **_):
            name, _ = self.identify(body)
            calls.append(name)
            if name == "lead":
                return self.spawn("alpha", "beta")
            return self.response([("write_file", {"path": "work/notes/partial.md", "content": name})])

        with patch.object(providers, "complete", side_effect=complete):
            result = self.run_lead(manifest)
        self.assertEqual(result["requests"], 2)
        self.assertEqual(len(calls), 2)
        self.assertEqual(calls[0], "lead")
        self.assertIn(calls[1], ("alpha", "beta"))
        self.assertEqual(len(result["workspaces"]), 2)
        self.assertEqual(len(delegation.jobs(folder)), 2)
        self.assertTrue(t.read(folder / "state.json")["waiting_for_subagents"])
        child = self.q / "workspaces" / delegation.jobs(folder)[0]["child_workspace"]
        self.assertEqual((child / "files/notes/partial.md").read_text(), calls[1])
        # The unscheduled declaration survives, alongside the child's partial work.
        self.settings["limits"]["requests_per_run"] = 10
        with patch.object(providers, "complete", return_value=self.response()) as api:
            resumed = self.run_lead(manifest)
        self.assertFalse(resumed["errors"])
        self.assertEqual(api.call_count, 3)
        self.assertEqual(delegation._status(folder)["pending"], 0)
        self.assertEqual(len(list((self.q / "workspaces").glob("*/workspace.json"))), 3)

    def test_requested_fanout_respects_concurrent_request_ceiling(self):
        folder, manifest = self.prepare(maximum=2)
        barrier = threading.Barrier(2, timeout=5)
        lock = threading.Lock()
        observed = {"active": 0, "peak": 0, "children": 0, "lead": 0}

        def complete(profile, body, **_):
            name, _ = self.identify(body)
            if name == "lead":
                observed["lead"] += 1
                return self.spawn("one", "two", "three", "four", "five") if observed["lead"] == 1 else self.response()
            with lock:
                observed["children"] += 1
                number = observed["children"]
                observed["active"] += 1
                observed["peak"] = max(observed["peak"], observed["active"])
            if number <= 4:
                barrier.wait()
            with lock:
                observed["active"] -= 1
            return self.response()

        with patch.object(providers, "complete", side_effect=complete):
            result = self.run_lead(manifest)
        self.assertFalse(result["errors"])
        self.assertEqual(observed["children"], 5)
        self.assertEqual(observed["peak"], 2)
        self.assertEqual(result["peak_concurrent_requests"], 2)
        self.assertEqual(result["requests"], 7)
        self.assertEqual(delegation._status(folder)["pending"], 0)

    def test_output_reservations_wait_for_refunds_without_dropping_children(self):
        folder, manifest = self.prepare(requests=20, tokens=10, output=8)
        barrier = threading.Barrier(2, timeout=5)
        counts = Counter()
        first_caps = []
        lock = threading.Lock()

        def complete(profile, body, **_):
            name, _ = self.identify(body)
            with lock:
                counts[name] += 1
                turn = counts[name]
            if name == "lead":
                return self.spawn("alpha", "beta", tokens=1) if turn == 1 else self.response(tokens=1)
            if turn == 1:
                with lock:
                    first_caps.append(body["max_completion_tokens"])
                barrier.wait()
                return self.response([("write_file", {"path": "work/notes/saved.md", "content": name})], tokens=1)
            return self.response(tokens=1)

        with patch.object(providers, "complete", side_effect=complete):
            result = self.run_lead(manifest)
        self.assertFalse(result["errors"])
        self.assertEqual(sorted(first_caps), [1, 8])
        self.assertEqual(result["requests"], 6)
        self.assertEqual(result["output_tokens_charged"], 6)
        self.assertEqual(delegation._status(folder)["pending"], 0)
        for path in (self.q / "trawls").glob("*/budget.json"):
            self.assertLessEqual(t.read(path)["invocation_output_tokens_charged"], 10)

    def test_transport_retry_survives_temporary_reservation_exhaustion(self):
        folder, manifest = self.prepare(requests=20, tokens=10, output=8)
        other_started, failure_recorded = threading.Event(), threading.Event()
        counts = Counter()
        cap_log = []
        failure_name = None
        real_record = w.record_transport_failure

        def record(*args, **kwargs):
            outcome = real_record(*args, **kwargs)
            self.assertTrue(outcome["retry"])
            failure_recorded.set()
            return outcome

        def complete(profile, body, **_):
            nonlocal failure_name
            name, _ = self.identify(body)
            counts[name] += 1
            cap = body["max_completion_tokens"]
            cap_log.append((name, cap))
            if name == "lead":
                return self.spawn("alpha", "beta", tokens=1)
            if counts[name] == 1 and cap == 8:
                failure_name = name
                self.assertTrue(other_started.wait(5))
                raise providers.TransportError("IncompleteRead", partial=b"unfinished")
            if counts[name] == 1:
                other_started.set()
                self.assertTrue(failure_recorded.wait(5))
                return self.response(tokens=0)
            return self.response(tokens=1)

        with patch.object(providers, "complete", side_effect=complete), \
             patch.object(w, "record_transport_failure", side_effect=record), \
             patch.object(w.time, "sleep", return_value=None):
            result = self.run_lead(manifest)
        self.assertFalse(result["errors"])
        self.assertEqual(result["requests"], 4)
        self.assertEqual(result["output_tokens_charged"], 10)
        self.assertEqual([cap for name, cap in cap_log if name == failure_name], [8, 1])
        self.assertEqual(len(result["transport_failures"]), 1)
        failure = result["transport_failures"][0]
        self.assertTrue(failure["retry"])
        self.assertTrue((self.q / "trawls" / failure["trawl"] / "partial-response.json").exists())

    def test_fatal_provider_error_stops_dispatch_and_saves_sibling_response(self):
        folder, manifest = self.prepare()
        good_started, release_good = threading.Event(), threading.Event()
        calls = []
        real_save = w.state_save

        def save(path, state):
            real_save(path, state)
            if path != folder and state["status"] == "paused":
                release_good.set()

        def complete(profile, body, **_):
            name, _ = self.identify(body)
            calls.append(name)
            if name == "lead":
                return self.spawn("bad", "good")
            if name == "bad":
                self.assertTrue(good_started.wait(5))
                raise providers.ProviderError("API HTTP 402; request was not retried")
            good_started.set()
            self.assertTrue(release_good.wait(5))
            return self.response([("write_file", {"path": "work/notes/paid-reply.md", "content": "Saved despite sibling failure"})])

        with patch.object(providers, "complete", side_effect=complete), patch.object(w, "state_save", side_effect=save):
            result = self.run_lead(manifest)
        self.assertEqual(result["requests"], 3)
        self.assertCountEqual(calls, ["lead", "bad", "good"])
        self.assertEqual(len(result["errors"]), 1)
        self.assertIn("402", result["errors"][0]["error"])
        job = next(job for job in delegation.jobs(folder) if job["brief"]["task"] == "good")
        child = self.q / "workspaces" / job["child_workspace"]
        self.assertEqual((child / "files/notes/paid-reply.md").read_text(), "Saved despite sibling failure")
        self.assertIsNone(t.read(child / "state.json")["pending"])
        self.assertTrue(any(checkpoint["workspace"] == child.name and checkpoint["changed_files"] == 1
                            for checkpoint in result["checkpoints"]))

    def test_ctrl_c_drains_both_replies_and_resume_does_not_replay_writes(self):
        folder, manifest = self.prepare()
        release = threading.Event()
        started = {name: threading.Event() for name in ("alpha", "beta")}
        interrupted = False
        real_wait = parallel.wait

        def complete(profile, body, **_):
            name, _ = self.identify(body)
            if name == "lead":
                return self.spawn("alpha", "beta")
            started[name].set()
            self.assertTrue(release.wait(5))
            return self.response([("write_file", {"path": "work/notes/saved.md", "content": name})])

        def interrupt_once(futures, **kwargs):
            nonlocal interrupted
            if len(futures) == 2 and not interrupted:
                self.assertTrue(all(event.wait(5) for event in started.values()))
                interrupted = True
                release.set()
                raise KeyboardInterrupt
            return real_wait(futures, **kwargs)

        with patch.object(providers, "complete", side_effect=complete) as api, patch.object(parallel, "wait", side_effect=interrupt_once):
            with self.assertRaises(KeyboardInterrupt):
                self.run_lead(manifest)
        self.assertTrue(interrupted)
        self.assertEqual(api.call_count, 3)
        jobs = delegation.jobs(folder)
        child_ids = {job["child_workspace"] for job in jobs}
        for job in jobs:
            child = self.q / "workspaces" / job["child_workspace"]
            self.assertEqual((child / "files/notes/saved.md").read_text(), job["brief"]["task"])
            self.assertIsNone(t.read(child / "state.json")["pending"])
        edits_before = {path.relative_to(self.q): path.read_bytes()
                        for path in (self.q / "workspaces").glob("*/turns/*/*-edit.json")}
        logs_before = {path.relative_to(self.q): path.read_bytes()
                       for path in (self.q / "trawls").glob("*/*.json")}
        with patch.object(providers, "complete", return_value=self.response()) as api:
            resumed = self.run_lead(manifest)
        self.assertFalse(resumed["errors"])
        self.assertEqual(api.call_count, 3)
        self.assertEqual(set(resumed["workspaces"]), {manifest["id"], *child_ids})
        self.assertEqual({path.relative_to(self.q): path.read_bytes()
                          for path in (self.q / "workspaces").glob("*/turns/*/*-edit.json")}, edits_before)
        for path, content in logs_before.items():
            self.assertEqual((self.q / path).read_bytes(), content)
        self.assertEqual(delegation._status(folder)["pending"], 0)

    def test_repeated_handoff_failures_still_save_every_paid_response(self):
        folder, manifest = self.prepare(maximum=3)
        barrier = threading.Barrier(3, timeout=5)
        first_failed, second_failed = threading.Event(), threading.Event()
        real_deliver = delegation.deliver

        def complete(profile, body, **_):
            name, _ = self.identify(body)
            if name == "lead":
                return self.spawn("first", "second", "third")
            barrier.wait()
            if name == "second":
                self.assertTrue(first_failed.wait(5))
            elif name == "third":
                self.assertTrue(second_failed.wait(5))
            return self.response(final=f"Saved completion from {name}")

        def deliver(quarantine, parent, job, child, checkpoint):
            name = job["brief"]["task"]
            if name == "first":
                first_failed.set()
                raise OSError("Synthetic first handoff failure")
            if name == "second":
                second_failed.set()
                raise OSError("Synthetic second handoff failure")
            return real_deliver(quarantine, parent, job, child, checkpoint)

        with patch.object(providers, "complete", side_effect=complete), \
             patch.object(delegation, "deliver", side_effect=deliver):
            result = self.run_lead(manifest)
        self.assertEqual(result["requests"], 4)
        self.assertEqual(len(result["errors"]), 2)
        self.assertTrue(t.read(folder / "state.json")["waiting_for_subagents"])
        requests = [t.read(path) for path in (self.q / "trawls").glob("*/request.json")]
        for job in delegation.jobs(folder):
            request = next(row for row in requests if row["workspace"] == job["child_workspace"])
            audit = self.q / "trawls" / request["id"]
            self.assertTrue((audit / "response.json").exists())
            self.assertTrue((audit / "SEALED.json").exists())
            delivered = folder / "delegations" / job["id"] / "result.json"
            self.assertEqual(delivered.exists(), job["brief"]["task"] == "third")

    def test_nested_delegation_resumes_parents_without_paid_polling(self):
        folder, manifest = self.prepare(maximum=2)
        counts = Counter()

        def complete(profile, body, **_):
            name, _ = self.identify(body)
            counts[name] += 1
            if name == "lead" and counts[name] == 1:
                return self.spawn("child")
            if name == "child" and counts[name] == 1:
                return self.spawn("grandchild")
            if name == "grandchild" and counts[name] == 1:
                return self.response([("write_file", {"path": "work/notes/leaf.md", "content": "Leaf finding"})])
            return self.response()

        with patch.object(providers, "complete", side_effect=complete):
            result = self.run_lead(manifest)
        self.assertFalse(result["errors"])
        self.assertEqual(result["requests"], 6)
        self.assertEqual(counts, {"lead": 2, "child": 2, "grandchild": 2})
        first = delegation.jobs(folder)[0]
        child = self.q / "workspaces" / first["child_workspace"]
        second = delegation.jobs(child)[0]
        self.assertEqual(second["parent_workspace"], child.name)
        self.assertEqual(second["family_id"], manifest["id"])
        self.assertEqual(first["family_id"], second["family_id"])
        self.assertTrue((folder / "reference/subagents" / first["id"] / "manifest.json").exists())
        self.assertEqual((child / "reference/subagents" / second["id"] / "files/notes/leaf.md").read_text(), "Leaf finding")


if __name__ == "__main__":
    unittest.main()
