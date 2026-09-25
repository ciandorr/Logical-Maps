"""Offline integration tests for theorem-trawl trust and repository boundaries."""
from copy import deepcopy
import io
import json
from http.server import BaseHTTPRequestHandler, HTTPServer
import threading
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch
from urllib.error import HTTPError

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from trawl import core as t, inference, providers, workspaces as w


def write_yaml(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(t.yaml.safe_dump(value, sort_keys=False))


class TrawlTest(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix="test-theorem-trawl-")
        self.addCleanup(self.temp.cleanup)
        self.base = Path(self.temp.name)
        self.source = self.base / "main"
        self.source.mkdir()
        t.git(self.source, "init", "-b", "main")
        t.git(self.source, "config", "user.name", "Trawl tests")
        t.git(self.source, "config", "user.email", "test@example.invalid")
        self.topic = self.source / "logical-maps/topics/example"
        write_yaml(self.topic / "topic.yaml", {"id": "example", "title": "Example", "framework": "Toy logic", "background": [],
            "source_catalog": [{"id": "misc", "name": "Misc.", "kind": "misc"}]})
        (self.topic / "background.md").write_text("A toy propositional framework for tests.\n")
        for pid in "abcd":
            write_yaml(self.topic / f"principles/{pid}.yaml", {"id": pid, "name": pid.upper(), "statement": pid})
        write_yaml(self.topic / "models/a-model.yaml", {"id": "a-model", "name": "A model",
            "satisfies": ["a"], "violates": [], "description": "A holds.", "status": "proved",
            "certificate": {"source_id": "misc"}, "sources": ["Test construction"]})
        self.commit()
        self.q = t.init_quarantine(self.base / "quarantine")
        self.settings = t.config(self.q / "config.local.yaml")
        self.settings["source"] = {"repository": str(self.source), "ref": "main"}
        self.settings["topics"] = ["example"]
        self.settings["backgrounds"] = ["base"]
        self.settings["limits"]["requests_per_run"] = 2
        self.snapshot, self.origin = t.source_snapshot(self.q, self.settings)
        self.task = t.plan(self.snapshot, self.settings)[0]
        self.data = t.load_data(self.snapshot, "example")
        self.metadata = {"trawl_id": "trawl-test", "at": t.now(),
            "actor": {"kind": "model", "provider": "test", "model": "cheap-model", "protocol": "chat-completions"},
            "prompt_sha256": "1" * 64, "response_sha256": "2" * 64,
            "usage": {"prompt_tokens": 20, "completion_tokens": 30}, "response_id": "test", "offline": False}
        self.item = {"kind": "result", "record": {"id": "a-implies-b", "premises": ["a"], "conclusion": "b",
            "proof": "A complete toy argument.", "certificate": {"source_id": "misc"},
            "sources": ["Original test argument"], "source_names": ["Test argument"]},
            "writeup": "# Toy argument\n\nHere is the whole test argument.", "evidence": [
                {"kind": "original-argument", "citation": "Original test argument", "locator": "writeup",
                 "role": "proof", "verification": "argument-in-writeup"}]}
        self.report = {"verdict": "accept", "summary": "Toy argument checked.",
            "argument_check": "Checked each step in this synthetic test.", "source_check": "Original argument.", "issues": []}

    def commit(self):
        t.git(self.source, "add", ".")
        t.git(self.source, "commit", "-m", "Fixture update")

    def candidate(self, item=None):
        candidate = t.make_candidate(item or self.item, self.task, self.origin, self.metadata, self.data)
        t.save(self.q / "candidates" / (candidate["id"] + ".json"), candidate)
        return candidate

    def review(self, candidate, report=None):
        return t.record_review(self.q, candidate, report or self.report,
             {"kind": "model", "provider": "test", "model": "review-model"}, self.origin)

    def test_snapshot_is_committed_allowlisted_and_refreshes(self):
        (self.source / "private.txt").write_text("not database content")
        (self.topic / "background.md").write_text("Uncommitted edit")
        snapshot, _ = t.source_snapshot(self.q, self.settings)
        self.assertNotIn("Uncommitted", (snapshot / "logical-maps/topics/example/background.md").read_text())
        self.assertFalse((snapshot / "private.txt").exists())
        self.commit()
        new, origin = t.source_snapshot(self.q, self.settings)
        self.assertNotEqual(origin["commit"], self.origin["commit"])
        self.assertEqual((new / "logical-maps/topics/example/background.md").read_text(), "Uncommitted edit")

    def test_queue_centrality_model_checks_and_full_coverage(self):
        queue = t.plan(self.snapshot, self.settings)
        engine = t.pmap.Lynchpins(self.data)
        expected = engine.rank(top=sys.maxsize)["rows"]
        self.assertEqual(len(queue), len(expected))
        self.assertGreater(len(queue), 20)
        self.assertTrue(any(q["question"]["kind"] == "check" for q in queue))
        scores = [q["question"]["score"] for q in queue]
        self.assertEqual(scores, sorted(scores, reverse=True))
        self.assertEqual(t.plan(self.snapshot, self.settings), queue)

    def test_discovery_request_includes_engine_ranked_question_list(self):
        self.settings["limits"]["requests_per_run"] = 1
        self.settings["limits"]["central_questions"] = 3
        t.run(self.q, self.settings, self.snapshot, self.origin)
        request = t.trawls(self.q)[0]
        packet = json.loads(request["body"]["messages"][0]["content"])
        listing = packet["central_questions"]
        expected = t.pmap.Lynchpins(self.data).rank(top=3)["rows"]
        self.assertEqual([r["rank"] for r in listing["rows"][:3]], [r["rank"] for r in expected])
        for actual, wanted in zip(listing["rows"], expected):
            for key in ("kind", "score", "yes", "no", "premises", "conclusion", "model", "principle"):
                self.assertEqual(actual.get(key), wanted.get(key))
            ids = set(actual.get("premises", [])) | {actual.get("conclusion"), actual.get("principle")}
            for pid in ids - {None, False, t.pmap.FALSE}:
                self.assertTrue((self.q / "workspaces" / request["workspace"] / "files" / f"logical-maps/topics/example/principles/{pid}.yaml").exists())
        self.assertEqual(listing["included"], len(listing["rows"]))
        self.assertEqual(listing["total_open"] - listing["included"], listing["omitted"])
        self.assertGreater(listing["omitted"], 0)
        self.assertIn(packet["question"]["id"], [r["id"] for r in listing["rows"] if r["selected"]])
        # A subsequent scheduled question still sees mathematical centrality order.
        t.run(self.q, self.settings, self.snapshot, self.origin)
        for attempt in t.trawls(self.q):
            central = json.loads(attempt["body"]["messages"][0]["content"])["central_questions"]
            self.assertEqual([r["rank"] for r in central["rows"][:3]], [1, 2, 3])

    def test_central_list_retains_low_ranked_target_and_supports_all(self):
        queue = t.plan(self.snapshot, self.settings)
        target = max(queue, key=lambda q: q["question"]["rank"])
        limits = {**self.settings["limits"], "central_questions": 1}
        listing = t.central_question_list(target, queue, limits)
        self.assertEqual([r["rank"] for r in listing["rows"]], [1, target["question"]["rank"]])
        self.assertTrue(listing["rows"][-1]["selected"])
        self.assertEqual(listing["omitted"], len(queue) - 2)
        full = t.central_question_list(target, queue, {**limits, "central_questions": "all"})
        self.assertEqual(full["included"], len(queue))
        self.assertEqual(full["omitted"], 0)
        self.assertEqual(len({r["id"] for r in full["rows"]}), len(queue))

    def test_central_list_keeps_topics_and_assumptions_separate(self):
        queue = t.plan(self.snapshot, self.settings)
        unrelated = deepcopy(queue)
        for task in unrelated:
            task["topic"] = "another-topic"
        different_background = deepcopy(queue)
        for task in different_background:
            task["assumptions"] = ["a"]
        full = t.central_question_list(self.task, [*unrelated, *different_background, *queue],
                                      {**self.settings["limits"], "central_questions": "all"})
        self.assertEqual(full["total_open"], len(queue))
        self.assertEqual({r["id"] for r in full["rows"]}, {q["id"] for q in queue})

    def test_question_list_configuration_and_trawl_identity(self):
        path = self.q / "config.local.yaml"
        original = t.read(path)
        for invalid in (0, -1, True, "twenty"):
            settings = deepcopy(original)
            settings["limits"]["central_questions"] = invalid
            write_yaml(path, settings)
            with self.assertRaisesRegex(ValueError, "central_questions"):
                t.config(path)
        limits = self.settings["limits"]
        first = t.trawl_key(self.task, self.settings["discovery"], limits)
        second = t.trawl_key(self.task, self.settings["discovery"], {**limits, "central_questions": "all"})
        self.assertNotEqual(first, second)
        settings = deepcopy(original)
        del settings["limits"]["central_questions"]
        write_yaml(path, settings)
        self.assertEqual(t.config(path)["limits"].get("central_questions", 20), 20)

    def test_context_preserves_definitions_and_model_writeup(self):
        model = next(q for q in t.plan(self.snapshot, self.settings) if q["question"]["kind"] == "check")
        files = t.context(self.snapshot, model, self.settings["limits"])["files"]
        self.assertIn("logical-maps/topics/example/models/a-model.yaml", files)
        self.assertIn("logical-maps/topics/example/background.md", files)
        self.assertIn("logical-maps/topics/example/principles/a.yaml", files)

    def live_workspace(self, protocol="chat-completions", budget=1):
        self.settings["live_api"] = True
        self.settings["limits"]["requests_per_run"] = budget
        self.settings["discovery"] = {"protocol": protocol, "provider": "test", "model": "cheap-model",
                                      "endpoint": "https://test.invalid/messages"}

    def tool_response(self, calls=(), *, final="Saved my progress.", protocol="chat-completions"):
        if protocol == "anthropic-messages":
            return {"id": "test", "model": "reported-model", "usage": {"input_tokens": 5},
                    "stop_reason": "tool_use" if calls else "end_turn",
                    "content": [{"type": "tool_use", "id": f"call-{i}", "name": name, "input": args}
                                for i, (name, args) in enumerate(calls)] or [{"type": "text", "text": final}]}
        message = {"role": "assistant", "content": None if calls else final}
        if calls:
            message["tool_calls"] = [{"id": f"call-{i}", "type": "function",
                "function": {"name": name, "arguments": json.dumps(args)}} for i, (name, args) in enumerate(calls)]
        return {"id": "test", "model": "reported-model", "usage": {"completion_tokens": 5},
                "choices": [{"finish_reason": "tool_calls" if calls else "stop", "message": message}]}

    def workspace(self):
        result = t.run(self.q, self.settings, self.snapshot, self.origin, prepare_only=True)
        return w.load(self.q, result["workspaces"][0])

    def proposed_rule(self, folder, rid, premises, conclusion, status="proved"):
        path = folder / f"files/logical-maps/topics/example/results/{rid}.yaml"
        write_yaml(path, {"id": rid, "premises": premises, "conclusion": conclusion,
                         "status": status, "proof": "Synthetic argument, awaiting review.",
                         "certificate": {"source_id": "misc"}, "sources": ["Synthetic test"]})
        return path

    def test_python_query_transitivity_exclusion_and_evidence_are_conditional(self):
        folder, manifest = self.workspace()
        self.proposed_rule(folder, "a-b", ["a"], "b")
        self.proposed_rule(folder, "b-c", ["b"], "c")
        self.proposed_rule(folder, "a-not-d", ["a", "d"], "false")
        args = {"premises": ["a"], "conclusions": ["c", "d"]}
        result = inference.execute(folder, manifest, "logical_query", args)
        self.assertTrue(result["valid"])
        self.assertEqual(result["rows"][0]["status"], "proved")
        self.assertEqual(set(result["rows"][0]["via"]), {"a-b", "b-c"})
        self.assertEqual(result["rows"][1]["status"], "refuted")
        self.assertEqual(result["rows"][1]["models"], ["a-model"])
        self.assertEqual(result["rows"][1]["exclusion"]["via"], ["a-not-d"])
        # No model of d exists in this database: exclusion is not a counterexample.
        reverse = inference.execute(folder, manifest, "logical_query", {"premises": ["d"], "conclusions": ["a"]})
        self.assertEqual(reverse["rows"][0]["status"], "open")
        self.assertEqual(reverse["rows"][0]["exclusion"]["via"], ["a-not-d"])
        self.assertEqual(result["provenance"]["trust"], "conditional-on-workspace-proposals")
        reference = inference.execute(folder, manifest, "logical_query", {**args, "scope": "reference"})
        self.assertTrue(all(r["status"] == "open" for r in reference["rows"]))
        self.assertEqual(reference["provenance"]["trust"], "published-records")
        full = t.read(folder / result["report"])
        self.assertIn("results/a-b.yaml", full["provenance"]["input_files"])
        self.assertEqual(full["provenance"]["source"], self.origin)
        frozen = w.checkpoint(self.q, manifest["id"])
        candidate = t.load_candidate(self.q, frozen["checkpoint"])
        self.assertEqual(len(candidate["content"]["computations"]), 3)
        self.assertFalse((self.topic / "results/a-b.yaml").exists())

    def test_query_countermodels_do_not_inherit_optional_background(self):
        folder, manifest = self.workspace()
        base = folder / "files/logical-maps/topics/example"
        topic = t.read(base / "topic.yaml")
        topic.update(principle_categories=[{"id": "test", "name": "Test"}],
                     background_presets=[{"id": "with-b", "name": "With B", "category": "test", "principles": ["b"]}])
        write_yaml(base / "topic.yaml", topic)
        model = t.read(base / "models/a-model.yaml")
        model["violates"] = ["d"]
        write_yaml(base / "models/a-model.yaml", model)
        query = {"premises": ["a"], "conclusions": ["d"]}
        base_result = inference.execute(folder, manifest, "logical_query", query)
        self.assertEqual(base_result["rows"][0]["models"], ["a-model"])
        self.assertEqual(base_result["rows"][0]["status"], "refuted")
        stronger = inference.execute(folder, manifest, "logical_query", {**query, "background": "with-b"})
        self.assertEqual(stronger["rows"][0]["status"], "open")
        self.assertEqual(stronger["rows"][0]["models"], [])
        self.assertEqual(stronger["premises"], ["a", "b"])

    def test_refresh_uses_existing_ranker_all_rows_and_invalidates_cache(self):
        folder, manifest = self.workspace()
        before = inference.execute(folder, manifest, "recompute_central_questions", {"limit": 1})
        path = self.proposed_rule(folder, "a-b", ["a"], "b", status="conjectured")
        draft = inference.execute(folder, manifest, "logical_query", {"premises": ["a"], "conclusions": ["b"]})
        self.assertEqual(draft["rows"][0]["status"], "open")
        self.proposed_rule(folder, "a-b", ["a"], "b")
        after = inference.execute(folder, manifest, "recompute_central_questions", {"limit": 1})
        self.assertNotEqual(before["report"], after["report"])
        listing = t.read(folder / after["report"])
        data = t.load_data(folder / "files", "example")
        expected = t.pmap.Lynchpins(data).rank(top=sys.maxsize)["rows"]
        self.assertEqual([{k: v for k, v in r.items() if k != "id"} for r in listing["rows"]], expected)
        self.assertGreater(after["total"], 1)
        self.assertEqual(after["rows"], listing["rows"][:1])
        with patch.object(t.pmap.Lynchpins, "rank", side_effect=AssertionError("cache should be reused")):
            page = inference.execute(folder, manifest, "recompute_central_questions", {"offset": 1, "limit": 2})
        self.assertEqual(page["report"], after["report"])
        self.assertEqual(page["rows"], listing["rows"][1:3])
        self.assertEqual(t.read(path)["status"], "proved")  # engine never rewrites records

    def test_invalid_drafts_are_diagnosed_without_losing_files_or_reference_queries(self):
        folder, manifest = self.workspace()
        path = self.proposed_rule(folder, "a-b", ["a"], "b")
        path.write_text("id: a-b\nproof: [unfinished")
        for i, name in enumerate(("validate_workspace", "recompute_central_questions", "logical_query")):
            result = w.execute_tool(folder, manifest, {"name": name, "arguments": {}}, self.metadata, i)
            self.assertFalse(result["valid"])
            self.assertIn("Invalid draft", result["diagnostics"])
        reference = inference.execute(folder, manifest, "logical_query", {"scope": "reference"})
        self.assertTrue(reference["valid"])
        self.assertEqual(path.read_text(), "id: a-b\nproof: [unfinished")

    def test_compute_paths_cannot_reach_history_or_execute_proposed_code(self):
        folder, manifest = self.workspace()
        injected = folder / "files/logical-maps/scripts/pmap.py"
        injected.parent.mkdir()
        injected.write_text("raise AssertionError('must never execute')")
        result = inference.execute(folder, manifest, "logical_query", {})
        self.assertTrue(result["valid"])
        denied = w.execute_tool(folder, manifest, {"name": "write_file", "arguments": {
            "path": result["report"], "content": "forged"}}, self.metadata, 0)
        self.assertIn("error", denied)
        for i, topic in enumerate(("../../trawls", str(self.topic)), 1):
            denied = w.execute_tool(folder, manifest, {"name": "logical_query", "arguments": {"topic": topic}}, self.metadata, i)
            self.assertIn("error", denied)
        link = folder / "files/logical-maps/topics/example/results/escape.yaml"
        link.parent.mkdir(exist_ok=True)
        link.symlink_to(self.topic / "topic.yaml")
        with self.assertRaisesRegex(ValueError, "symlink"):
            inference.execute(folder, manifest, "logical_query", {})
        link.unlink()
        w.seal_workspace(folder)
        with self.assertRaisesRegex(ValueError, "sealed"):
            inference.execute(folder, manifest, "logical_query", {})

    def test_multiple_passes_refresh_after_edits_and_finish_when_no_more_change(self):
        self.live_workspace(budget=3)
        folder, manifest = self.workspace()
        record = {"id": "a-b", "premises": ["a"], "conclusion": "b", "status": "proved", "proof": "Toy argument",
                  "certificate": {"source_id": "misc"}, "sources": ["Synthetic test"]}
        responses = [self.tool_response([("write_file", {
            "path": "work/logical-maps/topics/example/results/a-b.yaml", "content": t.yaml.safe_dump(record)})]),
            self.tool_response(final="First pass saved."), self.tool_response(final="Second sweep found no more.")]
        with patch.object(providers, "complete", side_effect=responses) as api:
            result = t.run(self.q, self.settings, self.snapshot, self.origin, workspace=manifest["id"])
        self.assertFalse(result["errors"])
        self.assertEqual(result["requests"], 3)
        continuation = json.loads(api.call_args.args[1]["messages"][-1]["content"])
        self.assertEqual(continuation["pass"], 2)
        self.assertTrue(continuation["current_ranking"]["valid"])
        self.assertEqual(continuation["current_ranking"]["provenance"]["trust"], "conditional-on-workspace-proposals")
        self.assertTrue((folder / "SEALED.json").exists())
        self.assertEqual(t.read(folder / "state.json")["pass_number"], 2)

    def test_output_budget_spans_passes_and_resumes_pending_second_pass(self):
        self.live_workspace(budget=10)
        self.settings["limits"].update(output_tokens_per_run=10, max_output_tokens=8)
        folder, manifest = self.workspace()
        responses = [self.tool_response([("write_file", {"path": "work/logical-maps/topics/example/background.md",
                       "content": "An expanded toy framework."})]), self.tool_response()]
        with patch.object(providers, "complete", side_effect=responses) as api:
            result = t.run(self.q, self.settings, self.snapshot, self.origin, workspace=manifest["id"])
        self.assertEqual(result["requests"], 2)
        self.assertEqual(result["output_tokens_charged"], 10)
        self.assertEqual([call.args[1]["max_completion_tokens"] for call in api.call_args_list], [8, 5])
        self.assertFalse((folder / "SEALED.json").exists())
        self.assertEqual(t.read(folder / "state.json")["pass_number"], 2)
        with patch.object(providers, "complete", return_value=self.tool_response()) as api:
            resumed = t.run(self.q, self.settings, self.snapshot, self.origin, workspace=manifest["id"])
        self.assertEqual(resumed["requests"], 1)
        self.assertIn('"pass": 2', api.call_args.args[1]["messages"][-1]["content"])
        self.assertTrue((folder / "SEALED.json").exists())

    def test_output_accounting_handles_unknown_usage_and_both_protocols(self):
        for protocol, key in (("chat-completions", "completion_tokens"), ("anthropic-messages", "output_tokens")):
            profile = {"protocol": protocol}
            self.assertEqual(providers.output_tokens(profile, {"usage": {key: 4}}, reserved=10), 4)
            for invalid in ({}, {key: None}, {key: -1}, {key: True}, {key: "4"}):
                self.assertEqual(providers.output_tokens(profile, {"usage": invalid}, reserved=10), 10)
        self.live_workspace(budget=5)
        self.settings["limits"].update(output_tokens_per_run=9, max_output_tokens=9)
        raw = self.tool_response([("write_file", {"path": "work/notes/progress.md", "content": "Saved"})])
        raw["usage"] = {}
        with patch.object(providers, "complete", return_value=raw) as api:
            result = t.run(self.q, self.settings, self.snapshot, self.origin)
        self.assertEqual(api.call_count, 1)
        self.assertEqual(result["output_tokens_charged"], 9)
        self.assertEqual(result["checkpoints"][0]["changed_files"], 1)

    def test_pass_and_token_limits_validate_and_explicit_single_pass_seals(self):
        for key in ("passes_per_workspace", "output_tokens_per_run"):
            for invalid in (0, -1, True, "forever"):
                settings = deepcopy(self.settings)
                settings["limits"][key] = invalid
                write_yaml(self.q / "config.local.yaml", settings)
                with self.assertRaisesRegex(ValueError, key):
                    t.config(self.q / "config.local.yaml")
        self.live_workspace(budget=2)
        self.settings["limits"]["passes_per_workspace"] = 1
        folder, manifest = self.workspace()
        with patch.object(providers, "complete", side_effect=[self.tool_response([("write_file", {
                "path": "work/logical-maps/topics/example/background.md", "content": "Updated framework"})]), self.tool_response()]):
            result = t.run(self.q, self.settings, self.snapshot, self.origin, workspace=manifest["id"])
        self.assertFalse(result["errors"])
        self.assertTrue((folder / "SEALED.json").exists())

    def test_offline_runs_are_bounded_and_do_not_touch_main(self):
        before = t.git(self.source, "status", "--porcelain")
        first = t.run(self.q, self.settings, self.snapshot, self.origin)
        second = t.run(self.q, self.settings, self.snapshot, self.origin)
        self.assertEqual((first["requests"], second["requests"]), (2, 2))
        keys = [t.read(p)["trawl_key"] for p in (self.q / "workspaces").glob("*/workspace.json")]
        self.assertEqual(len(keys), len(set(keys)))
        self.assertTrue(all(c["changed_files"] == 0 for c in first["checkpoints"]))
        self.assertEqual(before, t.git(self.source, "status", "--porcelain"))

    def test_copies_are_editable_with_no_write_access_to_reference_or_main(self):
        folder, manifest = self.workspace()
        copied = "work/logical-maps/topics/example/models/a-model.yaml"
        result = w.execute_tool(folder, manifest, {"name": "edit_file", "arguments": {
            "path": copied, "old_text": "A holds.", "new_text": "A holds. Proposed new property pending proof."}}, self.metadata, 0)
        self.assertIn("saved", result)
        self.assertNotIn("Proposed", (self.topic / "models/a-model.yaml").read_text())
        self.assertNotIn("Proposed", (folder / "reference/source/logical-maps/topics/example/models/a-model.yaml").read_text())
        for i, path in enumerate(("reference/source/logical-maps/topics/example/models/a-model.yaml",
                                  "work/../../workspace.json", "work/.git/config", str(self.topic / "models/a-model.yaml")), 1):
            denied = w.execute_tool(folder, manifest, {"name": "write_file", "arguments": {"path": path, "content": "no"}}, self.metadata, i)
            self.assertIn("error", denied)
        (folder / "files/link").symlink_to(self.source, target_is_directory=True)
        denied = w.execute_tool(folder, manifest, {"name": "write_file", "arguments": {"path": "work/link/no", "content": "no"}}, self.metadata, 6)
        self.assertIn("error", denied)
        self.assertFalse((self.source / "no").exists())

    def test_full_question_list_is_available_beyond_initial_prompt(self):
        self.settings["limits"]["central_questions"] = 1
        folder, manifest = self.workspace()
        all_questions = t.read(folder / "reference/central-questions.json")
        self.assertEqual(all_questions["omitted"], 0)
        self.assertGreater(len(all_questions["rows"]), 20)
        result = w.execute_tool(folder, manifest, {"name": "central_questions", "arguments": {"offset": 20, "limit": 5}}, self.metadata, 0)
        self.assertEqual(result["rows"], all_questions["rows"][20:25])

    def test_budget_stop_preserves_partial_yaml_notes_and_resumes_same_files(self):
        self.live_workspace()
        response = self.tool_response([("write_file", {"path": "work/logical-maps/topics/example/results/draft.yaml", "content": "id: draft\nproof: [unfinished"}),
                                      ("write_file", {"path": "work/notes/progress.md", "content": "Try the remaining implication."})])
        with patch.object(providers, "complete", return_value=response):
            first = t.run(self.q, self.settings, self.snapshot, self.origin)
        wid = first["workspaces"][0]
        folder, _ = w.load(self.q, wid)
        self.assertEqual(first["requests"], 1)
        self.assertEqual(first["checkpoints"][0]["changed_files"], 2)
        self.assertEqual(t.read(folder / "state.json")["status"], "active")
        with patch.object(providers, "complete", return_value=self.tool_response()) as api:
            second = t.run(self.q, self.settings, self.snapshot, self.origin)
        self.assertEqual(second["workspaces"], [wid])
        self.assertEqual((folder / "files/notes/progress.md").read_text(), "Try the remaining implication.")
        self.assertTrue(any(m["role"] == "tool" for m in api.call_args.args[1]["messages"]))
        event = t.read(next((folder / "turns").glob("*/*-edit.json")))
        self.assertEqual(event["discovery"]["actor"]["reported_model"], "reported-model")
        self.assertEqual(event["source"]["commit"], self.origin["commit"])

    def test_hundreds_of_file_writes_survive_one_bad_call(self):
        self.live_workspace()
        calls = [("write_file", {"path": f"work/notes/result-{i}.yaml", "content": f"id: result-{i}\nnotes: synthetic"}) for i in range(250)]
        calls.insert(125, ("write_file", {"path": "work/../escape", "content": "bad"}))
        with patch.object(providers, "complete", return_value=self.tool_response(calls)):
            result = t.run(self.q, self.settings, self.snapshot, self.origin)
        self.assertEqual(result["checkpoints"][0]["changed_files"], 250)
        self.assertEqual(len(result["errors"]), 1)

    def test_later_truncated_response_and_transport_failure_keep_saved_files(self):
        for failure in (self.tool_response(), providers.ProviderError("connection lost")):
            self.live_workspace(budget=2)
            if isinstance(failure, dict):
                failure["choices"][0]["finish_reason"] = "length"
            with patch.object(providers, "complete", side_effect=[self.tool_response([
                    ("write_file", {"path": "work/notes/progress.md", "content": "Useful saved partial proof."})]), failure]):
                result = t.run(self.q, self.settings, self.snapshot, self.origin)
            self.assertEqual(bool(result["errors"]), isinstance(failure, providers.ProviderError))
            self.assertEqual(result["checkpoints"][0]["changed_files"], 1)
            self.assertEqual(result["requests"], 2)

    def test_output_limit_continues_both_protocols_without_executing_partial_tools(self):
        for protocol in ("chat-completions", "anthropic-messages"):
            with self.subTest(protocol=protocol):
                self.live_workspace(protocol, budget=3)
                self.settings["limits"].update(max_output_tokens=64, output_tokens_per_run=200)
                folder, manifest = self.workspace()
                read = self.tool_response([("read_file", {"path": "work/logical-maps/topics/example/background.md"})], protocol=protocol)
                limited = self.tool_response([
                    ("write_file", {"path": "work/notes/do-not-apply.md", "content": "Unfinished claim"}),
                    ("write_file", {"path": "work/notes/partial.md", "content": "Incomplete"})], protocol=protocol)
                saved = self.tool_response([("write_file", {"path": "work/notes/progress.md",
                    "content": "Deferred the hard question; saved a different easy observation."})], protocol=protocol)
                for raw, amount in ((read, 5), (limited, 64), (saved, 5)):
                    raw["usage"] = {"completion_tokens": amount, "output_tokens": amount}
                long_reasoning = "UNFINISHED-REASONING-MUST-NOT-BE-REPLAYED — partial lemma.\n" * 2500 + "LAST LINE PRESERVED"
                if protocol == "chat-completions":
                    limited["choices"][0]["finish_reason"] = "length"
                    message = limited["choices"][0]["message"]
                    message["reasoning_content"] = long_reasoning
                    message["content"] = "An incomplete candidate answer."
                    message["tool_calls"][1]["function"]["arguments"] = '{"path": "work/notes/partial.md", "content":'
                else:
                    limited["stop_reason"] = "max_tokens"
                    limited["content"].insert(0, {"type": "thinking", "thinking": long_reasoning})
                    limited["content"].insert(1, {"type": "text", "text": "An incomplete candidate answer."})
                    limited["content"][-1]["input"] = {"path": "work/notes/partial.md"}
                with patch.object(providers, "complete", side_effect=[read, limited, saved]) as api:
                    result = t.run(self.q, self.settings, self.snapshot, self.origin, workspace=manifest["id"])
                self.assertFalse(result["errors"])
                self.assertEqual(result["requests"], 3)
                self.assertEqual(result["output_tokens_charged"], 74)
                next_body = json.dumps(api.call_args.args[1])
                self.assertIn("toy propositional framework", next_body)
                self.assertIn("Defer that line of investigation", next_body)
                self.assertIn("different tractable question", next_body)
                self.assertNotIn("UNFINISHED-REASONING-MUST-NOT-BE-REPLAYED", next_body)
                self.assertNotIn("do-not-apply.md", next_body)
                self.assertTrue((folder / "files/notes/progress.md").exists())
                self.assertFalse((folder / "files/notes/do-not-apply.md").exists())
                self.assertFalse((folder / "files/notes/partial.md").exists())
                state = t.read(folder / "state.json")
                self.assertEqual(state["status"], "active")
                self.assertEqual(state["pass_number"], 1)
                self.assertEqual(state["output_limit_hits"], 1)
                outcomes = [t.read(p) for p in (self.q / "trawls").glob("*/outcome.json")]
                outcome = next(o for o in outcomes if o["outcome"] == "output-limit" and o["workspace"] == manifest["id"])
                audit = self.q / "trawls" / outcome["metadata"]["trawl_id"]
                self.assertEqual(t.read(audit / "response.json"), limited)
                self.assertEqual(t.read(audit / "budget.json")["charged"], 64)
                self.assertTrue((audit / "SEALED.json").exists())
                archived = outcome["unfinished_response"]
                document = self.q / archived["path"]
                markdown = document.read_text()
                self.assertIn(long_reasoning, markdown)
                self.assertIn("An incomplete candidate answer.", markdown)
                self.assertIn("do-not-apply.md", markdown)
                self.assertIn("Incomplete and unverified", markdown)
                self.assertIn(self.origin["commit"], markdown)
                self.assertIn('"reported_model": "reported-model"', markdown)
                self.assertEqual(w.file_hash(markdown), archived["sha256"])
                checkpoint = t.read(self.q / "candidates" / (result["checkpoints"][0]["checkpoint"] + ".json"))
                self.assertEqual(checkpoint["content"]["unfinished_responses"], [archived])
                denied = w.execute_tool(folder, manifest, {"name": "read_file", "arguments": {
                    "path": archived["path"]}}, self.metadata, 100)
                self.assertIn("error", denied)
                with self.assertRaises(FileExistsError):
                    t.save_text(document, "Overwrite should fail")
                w.seal_workspace(folder)

    def test_thinking_only_limits_consume_finite_budget_and_resume_with_steering(self):
        self.live_workspace(budget=10)
        self.settings["limits"].update(max_output_tokens=64, output_tokens_per_run=100)
        limited = self.tool_response()
        limited["choices"][0].update(finish_reason="length", message={"role": "assistant", "content": None,
            "reasoning_content": "A long unfinished internal proof"})
        limited["usage"] = {}  # charge the full reservation when usage is absent
        folder, manifest = self.workspace()
        with patch.object(providers, "complete", return_value=limited) as api:
            result = t.run(self.q, self.settings, self.snapshot, self.origin, workspace=manifest["id"])
        self.assertFalse(result["errors"])
        self.assertEqual(result["requests"], 2)
        self.assertEqual(result["output_tokens_charged"], 100)
        self.assertEqual([call.args[1]["max_completion_tokens"] for call in api.call_args_list], [64, 36])
        state = t.read(folder / "state.json")
        self.assertEqual(state["output_limit_hits"], 2)
        self.assertEqual(state["status"], "active")
        self.assertIsNone(state["pending"])
        self.assertIn("different tractable question", state["messages"][-1]["content"])
        with patch.object(providers, "complete", return_value=self.tool_response()) as api:
            resumed = t.run(self.q, self.settings, self.snapshot, self.origin, workspace=manifest["id"])
        self.assertEqual(resumed["requests"], 1)
        self.assertIn("different tractable question", json.dumps(api.call_args.args[1]))
        self.assertTrue((folder / "SEALED.json").exists())

    def test_output_limit_recovery_does_not_rebill_or_duplicate_steering(self):
        self.live_workspace(budget=1)
        limited = self.tool_response()
        limited["choices"][0]["finish_reason"] = "length"
        folder, manifest = self.workspace()
        original = w.state_save
        def interrupt_final_state(path, state):
            if state.get("output_limit_hits") and state.get("pending") is None:
                raise KeyboardInterrupt
            return original(path, state)
        with patch.object(providers, "complete", return_value=limited), patch.object(w, "state_save", side_effect=interrupt_final_state):
            with self.assertRaises(KeyboardInterrupt):
                t.run(self.q, self.settings, self.snapshot, self.origin, workspace=manifest["id"])
        aid = t.read(folder / "state.json")["pending"]
        audit = self.q / "trawls" / aid
        old = {p.name: p.read_bytes() for p in audit.iterdir() if p.is_file()}
        archive_path = self.q / "unfinished" / (aid + ".md")
        archive_before = archive_path.read_bytes()
        with patch.object(providers, "complete", return_value=self.tool_response([("write_file", {
            "path": "work/notes/progress.md", "content": "Deferred hard work."})])) as api:
            result = t.run(self.q, self.settings, self.snapshot, self.origin, workspace=manifest["id"])
        self.assertFalse(result["errors"])
        self.assertEqual(api.call_count, 1)
        self.assertEqual(result["output_tokens_charged"], 5)
        self.assertEqual(json.dumps(api.call_args.args[1]).count("Your previous response reached a length limit"), 1)
        self.assertEqual(t.read(folder / "state.json")["output_limit_hits"], 1)
        self.assertEqual(len(t.read(folder / "state.json")["unfinished_responses"]), 1)
        self.assertEqual(archive_path.read_bytes(), archive_before)
        self.assertEqual({p.name: p.read_bytes() for p in audit.iterdir() if p.is_file()}, old)

    def test_output_limit_steering_survives_context_compaction(self):
        self.live_workspace()
        self.settings["limits"]["central_questions"] = 1
        folder, manifest = self.workspace()
        initial = {"role": "user", "content": w.initial_prompt(folder, manifest, self.settings)}
        notice = t.prompts.OUTPUT_LIMIT.format(output_limit=65536)
        state = {"messages": [initial, {"role": "assistant", "content": "Old context " * 10000},
                              {"role": "user", "content": notice}], "output_limit_notice": notice}
        compacted = w.compact_messages(folder, state, self.settings["discovery"], initial, 4096, 24000)
        self.assertIn("Defer that line of investigation", json.dumps(compacted))
        self.assertNotIn("Old context " * 100, json.dumps(compacted))

    def test_output_limit_does_not_mask_refusals_or_validate_partial_reviews(self):
        self.live_workspace(budget=10)
        folder, manifest = self.workspace()
        for reason, refusal in (("length", "Cannot comply"), ("content_filter", None), ("unknown", None)):
            response = self.tool_response()
            response["choices"][0]["finish_reason"] = reason
            response["choices"][0]["message"]["refusal"] = refusal
            with patch.object(providers, "complete", return_value=response) as api:
                result = t.run(self.q, self.settings, self.snapshot, self.origin, workspace=manifest["id"])
            self.assertEqual(api.call_count, 1)
            self.assertTrue(result["errors"])
        for protocol in ("chat-completions", "anthropic-messages"):
            response = self.tool_response(final=json.dumps(self.report), protocol=protocol)
            if protocol == "chat-completions":
                response["choices"][0]["finish_reason"] = "length"
            else:
                response["stop_reason"] = "max_tokens"
            with self.assertRaises(providers.ProviderError):
                providers.unpack({"protocol": protocol}, response)

    def test_interruption_between_edits_replays_saved_response_without_api_rebilling(self):
        self.live_workspace()
        original = w.execute_tool
        def interrupt_second(folder, manifest, call, metadata, index):
            if index == 1:
                raise KeyboardInterrupt
            return original(folder, manifest, call, metadata, index)
        response = self.tool_response([("write_file", {"path": "work/notes/one.md", "content": "First result"}),
                                      ("write_file", {"path": "work/notes/two.md", "content": "Second result"})])
        with patch.object(providers, "complete", return_value=response), patch.object(w, "execute_tool", side_effect=interrupt_second):
            with self.assertRaises(KeyboardInterrupt):
                t.run(self.q, self.settings, self.snapshot, self.origin)
        manifest = t.read(next((self.q / "workspaces").glob("*/workspace.json")))
        folder, _ = w.load(self.q, manifest["id"])
        self.assertTrue((folder / "files/notes/one.md").exists())
        self.assertFalse((folder / "files/notes/two.md").exists())
        with patch.object(providers, "complete", return_value=self.tool_response()) as api:
            result = t.run(self.q, self.settings, self.snapshot, self.origin)
        self.assertEqual(api.call_count, 1)  # only the next turn, not the interrupted one
        self.assertTrue((folder / "files/notes/two.md").exists())
        self.assertEqual(len(list((folder / "turns").glob("*/*-edit.json"))), 2)
        self.assertFalse(result["errors"])

    def test_interruption_during_write_recovers_from_durable_intent(self):
        folder, manifest = self.workspace()
        call = {"name": "write_file", "arguments": {"path": "work/notes/progress.md", "content": "Keep this result"}}
        with patch.object(w, "atomic_text", side_effect=KeyboardInterrupt):
            with self.assertRaises(KeyboardInterrupt):
                w.execute_tool(folder, manifest, call, self.metadata, 0)
        self.assertFalse((folder / "files/notes/progress.md").exists())
        result = w.execute_tool(folder, manifest, call, self.metadata, 0)
        self.assertIn("saved", result)
        self.assertEqual((folder / "files/notes/progress.md").read_text(), "Keep this result")

    def test_checkpoint_reviews_bind_to_frozen_edits_and_later_edits_do_not_change_them(self):
        folder, manifest = self.workspace()
        path = folder / "files/notes/progress.md"
        path.parent.mkdir()
        path.write_text("A partial argument")
        first = w.checkpoint(self.q, manifest["id"])
        candidate = t.load_candidate(self.q, first["checkpoint"])
        packet = t.review_packet(self.q, self.settings, self.snapshot, self.origin, candidate)
        report = t.record_review(self.q, candidate, self.report, {"kind": "human", "name": "Reviewer"}, self.origin)
        path.write_text("A later different argument")
        second = w.checkpoint(self.q, manifest["id"])
        self.assertEqual(t.digest(t.load_candidate(self.q, first["checkpoint"])), packet["candidate_sha256"])
        self.assertEqual(report["candidate_sha256"], first["candidate_sha256"])
        self.assertNotEqual(second["candidate_sha256"], first["candidate_sha256"])
        with self.assertRaisesRegex(ValueError, "curator/PR"):
            t.admit(self.q, candidate, self.source, report["id"], "Curator")

    def test_existing_workspace_remains_pinned_when_source_advances(self):
        self.live_workspace()
        folder, manifest = self.workspace()
        (self.topic / "background.md").write_text("A newer published framework")
        self.commit()
        snapshot, source = t.source_snapshot(self.q, self.settings)
        with patch.object(providers, "complete", return_value=self.tool_response()):
            result = t.run(self.q, self.settings, snapshot, source)
        self.assertEqual(result["workspaces"], [manifest["id"]])
        self.assertEqual(t.trawls(self.q)[0]["source"]["commit"], self.origin["commit"])
        self.assertNotIn("newer", (folder / "files/logical-maps/topics/example/background.md").read_text())

    def test_anthropic_tool_loop_preserves_blocks_and_returns_tool_results(self):
        self.live_workspace("anthropic-messages", budget=2)
        calls = [("write_file", {"path": "work/notes/progress.md", "content": "Saved"})]
        with patch.object(providers, "complete", side_effect=[self.tool_response(calls, protocol="anthropic-messages"),
                   self.tool_response(protocol="anthropic-messages")]) as api:
            result = t.run(self.q, self.settings, self.snapshot, self.origin)
        self.assertFalse(result["errors"])
        body = api.call_args.args[1]
        self.assertIn("input_schema", body["tools"][0])
        self.assertEqual(body["messages"][-1]["content"][0]["type"], "tool_result")
        self.assertEqual(result["checkpoints"][0]["changed_files"], 1)

    def test_context_compaction_retains_files_and_original_transcript(self):
        self.live_workspace(budget=3)
        self.settings["limits"]["central_questions"] = 1
        self.settings["limits"]["max_prompt_chars"] = 18000
        responses = [self.tool_response([("write_file", {"path": "work/notes/progress.md", "content": "Resume from lemma B."})]),
                     self.tool_response([("write_file", {"path": "work/notes/long.md", "content": "argument " * 4000})]),
                     self.tool_response()]
        with patch.object(providers, "complete", side_effect=responses) as api:
            result = t.run(self.q, self.settings, self.snapshot, self.origin)
        self.assertFalse(result["errors"])
        self.assertEqual(result["checkpoints"][0]["changed_files"], 2)
        body = api.call_args.args[1]
        self.assertLess(len(json.dumps(body)), 18000)
        self.assertIn("compacted", json.dumps(body["messages"]))
        raw = [t.read(p) for p in (self.q / "trawls").glob("*/response.json")]
        self.assertTrue(any("argument " * 1000 in json.dumps(r) for r in raw))

    def test_model_context_mode_validates_and_allows_large_history(self):
        self.live_workspace()
        self.settings["limits"].update(max_prompt_chars="model", max_output_tokens=65536)
        self.settings["discovery"].update(token_parameter="max_tokens",
            parameters={"thinking": {"type": "enabled"}, "reasoning_effort": "high"})
        write_yaml(self.q / "config.local.yaml", self.settings)
        self.settings = t.config(self.q / "config.local.yaml")
        folder, manifest = self.workspace()
        state = t.read(folder / "state.json")
        retained = "Large retained mathematical context. " * 10000
        state["messages"] = [{"role": "user", "content": retained}]
        w.state_save(folder, state)
        with patch.object(providers, "complete", return_value=self.tool_response()) as api:
            result = t.run(self.q, self.settings, self.snapshot, self.origin, workspace=manifest["id"])
        self.assertFalse(result["errors"])
        body = api.call_args.args[1]
        self.assertIn(retained, json.dumps(body))
        self.assertEqual(body["max_tokens"], 20000)  # remaining run allowance still wins
        self.assertEqual(body["thinking"], {"type": "enabled"})
        self.assertEqual(body["reasoning_effort"], "high")
        self.assertEqual(t.read(folder / "state.json").get("context_compactions", 0), 0)
        # Review packet construction also accepts this limit without truncation.
        self.assertTrue(t.review_packet(self.q, self.settings, self.snapshot, self.origin, self.candidate()))
        for invalid in (0, -1, True, "unlimited", None):
            self.settings["limits"]["max_prompt_chars"] = invalid
            write_yaml(self.q / "config.local.yaml", self.settings)
            with self.assertRaisesRegex(ValueError, "max_prompt_chars"):
                t.config(self.q / "config.local.yaml")

    def test_model_context_rejection_compacts_and_saves_with_budgets_and_audit(self):
        for protocol in ("chat-completions", "anthropic-messages"):
            with self.subTest(protocol=protocol):
                self.live_workspace(protocol, budget=2)
                self.settings["limits"].update(max_prompt_chars="model", central_questions=1,
                                                output_tokens_per_run=10, max_output_tokens=10)
                folder, manifest = self.workspace()
                state = t.read(folder / "state.json")
                assistant, calls = providers.agent_turn(self.settings["discovery"], self.tool_response(
                    [("read_file", {"path": "work/logical-maps/topics/example/background.md"})], protocol=protocol))
                state["messages"] = [{"role": "user", "content": w.initial_prompt(folder, manifest, self.settings)},
                    {"role": "assistant", "content": "Old working context. " * 10000}, assistant,
                    *providers.tool_messages(self.settings["discovery"], [(calls[0]["id"], {"content": "Definition A remains available."})])]
                w.state_save(folder, state)
                response = self.tool_response([("write_file", {"path": "work/notes/progress.md",
                    "content": "Useful argument saved after context compaction."})], protocol=protocol)
                response["usage"] = {"completion_tokens": 5, "output_tokens": 5}
                with patch.object(providers, "complete", side_effect=[providers.ContextLengthError("context full"), response]) as api:
                    result = t.run(self.q, self.settings, self.snapshot, self.origin, workspace=manifest["id"])
                self.assertFalse(result["errors"])
                self.assertEqual(result["requests"], 2)
                self.assertEqual(result["output_tokens_charged"], 5)
                before, after = [json.dumps(call.args[1], ensure_ascii=False) for call in api.call_args_list]
                self.assertLess(len(after), len(before) * .75)
                self.assertIn("Definition A remains available.", after)
                self.assertTrue((folder / "files/notes/progress.md").exists())
                trawls = [p.parent for p in (self.q / "trawls").glob("*/outcome.json")
                          if t.read(p).get("outcome") == "context-rejected"
                          and t.read(p.parent / "request.json")["workspace"] == manifest["id"]]
                self.assertEqual(len(trawls), 1)
                self.assertTrue((trawls[0] / "SEALED.json").exists())
                self.assertEqual(t.read(trawls[0] / "budget.json")["charged"], 0)
                self.assertIn("Old working context. " * 100, json.dumps(t.read(trawls[0] / "request.json")))
                w.seal_workspace(folder)  # next protocol gets its own unfinished workspace

    def test_model_context_rejection_cannot_loop_past_request_budget(self):
        self.live_workspace(budget=1)
        self.settings["limits"]["max_prompt_chars"] = "model"
        folder, manifest = self.workspace()
        state = t.read(folder / "state.json")
        state["messages"] = [{"role": "user", "content": "Working evidence. " * 10000}]
        w.state_save(folder, state)
        with patch.object(providers, "complete", side_effect=providers.ContextLengthError("context full")) as api:
            result = t.run(self.q, self.settings, self.snapshot, self.origin, workspace=manifest["id"])
        self.assertEqual(api.call_count, 1)
        self.assertEqual(result["output_tokens_charged"], 0)
        self.assertFalse(result["errors"])
        self.assertIsNone(t.read(folder / "state.json")["pending"])

    def test_model_context_repeated_rejection_pauses(self):
        self.live_workspace(budget=20)
        self.settings["limits"].update(max_prompt_chars="model", central_questions=1)
        folder, manifest = self.workspace()
        state = t.read(folder / "state.json")
        assistant, calls = providers.agent_turn(self.settings["discovery"], self.tool_response(
            [("read_file", {"path": "work/notes/long.md"})]))
        state["messages"] = [{"role": "user", "content": w.initial_prompt(folder, manifest, self.settings)},
            assistant, *providers.tool_messages(self.settings["discovery"], [(calls[0]["id"], {"content": "Long result. " * 10000})])]
        w.state_save(folder, state)
        with patch.object(providers, "complete", side_effect=providers.ContextLengthError("context full")) as api:
            result = t.run(self.q, self.settings, self.snapshot, self.origin, workspace=manifest["id"])
        self.assertEqual(api.call_count, 3)
        self.assertIn("three rejections", result["errors"][0]["error"])
        self.assertEqual(result["output_tokens_charged"], 0)

    def test_model_context_does_not_retry_transport_errors(self):
        self.live_workspace(budget=10)
        self.settings["limits"].update(max_prompt_chars="model", max_output_tokens=100)
        folder, manifest = self.workspace()
        with patch.object(providers, "complete", side_effect=providers.ProviderError("connection lost")) as api:
            result = t.run(self.q, self.settings, self.snapshot, self.origin, workspace=manifest["id"])
        self.assertEqual(api.call_count, 1)
        self.assertEqual(result["output_tokens_charged"], 100)

    def test_context_error_detection_is_narrow_and_does_not_expose_error_body(self):
        profile = {"protocol": "chat-completions", "provider": "test", "model": "model",
                   "endpoint": "https://example.invalid/api"}
        for status, detail, recognized in (
                (400, {"code": "context_length_exceeded"}, True),
                (400, {"message": "This model's maximum context length is 100 tokens."}, True),
                (400, {"message": "prompt is too long: 200 tokens > 100 maximum"}, True),
                (400, {"message": "Input token count exceeds the maximum allowed token count."}, True),
                (400, {"message": "invalid max_tokens"}, False),
                (400, {"message": {"unexpected": "object"}}, False),
                (401, {"code": "context_length_exceeded"}, False),
                (402, {"message": "Insufficient balance"}, False),
                (429, {"message": "Rate limited"}, False),
                (500, {"code": "context_length_exceeded"}, False)):
            with self.subTest(status=status, detail=detail):
                raw = json.dumps({"error": {**detail, "private": "SYNTHETIC-SECRET"}}).encode()
                error = HTTPError(profile["endpoint"], status, "Rejected", {}, io.BytesIO(raw))
                with patch.object(providers, "build_opener") as opener:
                    opener.return_value.open.side_effect = error
                    with self.assertRaises(providers.ProviderError) as raised:
                        providers.complete(profile, {}, enabled=True)
                self.assertEqual(isinstance(raised.exception, providers.ContextLengthError), recognized)
                self.assertNotIn("SYNTHETIC-SECRET", str(raised.exception))

    def test_start_paths_and_shallow_listing_avoid_full_repository_discovery(self):
        folder, manifest = self.workspace()
        initial = json.loads(w.initial_prompt(folder, manifest, self.settings))
        self.assertEqual(initial["topic_directory"], "work/logical-maps/topics/example")
        self.assertIn("work/logical-maps/topics/example/topic.yaml", initial["start_here"])
        self.assertFalse(initial["progress_note_exists"])
        self.assertNotIn("Read work/notes/progress.md", w.resume_note(folder))
        result = w.execute_tool(folder, manifest, {"name": "list_files", "arguments": {"path": "work"}}, self.metadata, 0)
        self.assertIn("work/logical-maps/", result["paths"])
        self.assertFalse(any("principles/" in path for path in result["paths"]))
        full = w.execute_tool(folder, manifest, {"name": "list_files", "arguments": {
            "path": "work/logical-maps/topics/example", "recursive": True}}, self.metadata, 1)
        self.assertIn("work/logical-maps/topics/example/principles/a.yaml", full["paths"])

    def test_oversized_reads_survive_compaction_and_allow_next_turn_to_write(self):
        for protocol in ("chat-completions", "anthropic-messages"):
            self.live_workspace(protocol, budget=2)
            self.settings["limits"].update(central_questions=1, max_prompt_chars=24000)
            folder, manifest = self.workspace()
            path = folder / "files/logical-maps/topics/example/background.md"
            path.write_text("KEY FACT: the relevant definition is A.\n" + "Supporting detail. " * 2000)
            responses = [self.tool_response([("read_file", {"path": "work/logical-maps/topics/example/background.md", "limit": 48000})], protocol=protocol)]
            def reply(profile, body, **kwargs):
                if responses:
                    return responses.pop()
                encoded = json.dumps(body, ensure_ascii=False)
                self.assertLessEqual(len(encoded), 24000)
                self.assertIn("KEY FACT: the relevant definition is A.", encoded)
                self.assertIn("context_excerpt", encoded)
                self.assertNotIn("Read work/notes/progress.md and resume", encoded)
                return self.tool_response([("write_file", {"path": "work/notes/progress.md",
                    "content": "Definition A inspected; next derive the connection to B."})], protocol=protocol)
            with patch.object(providers, "complete", side_effect=reply):
                result = t.run(self.q, self.settings, self.snapshot, self.origin, workspace=manifest["id"])
            self.assertFalse(result["errors"])
            self.assertTrue((folder / "files/notes/progress.md").exists())
            # Avoid selecting this unfinished workspace for the next protocol fixture.
            w.seal_workspace(folder)

    def test_compaction_keeps_recent_complete_tool_exchange_and_reasoning(self):
        folder, manifest = self.workspace()
        self.live_workspace()
        self.settings["limits"]["central_questions"] = 1
        initial = {"role": "user", "content": w.initial_prompt(folder, manifest, self.settings)}
        raw = self.tool_response([("read_file", {"path": "work/logical-maps/topics/example/principles/a.yaml"})])
        raw["choices"][0]["message"]["reasoning_content"] = "Continue the pending tool sequence."
        assistant, calls = providers.agent_turn(self.settings["discovery"], raw)
        results = providers.tool_messages(self.settings["discovery"], [(calls[0]["id"], {"content": "A is the important definition.", "sha256": "hash"})])
        state = {"messages": [initial, {"role": "assistant", "content": "old context " * 10000}, assistant, *results]}
        compacted = w.compact_messages(folder, state, self.settings["discovery"], initial, 4096, 24000)
        self.assertEqual(compacted[-2:], [assistant, *results])
        self.assertEqual(compacted[-2]["reasoning_content"], "Continue the pending tool sequence.")
        self.assertNotIn("old context " * 100, json.dumps(compacted))

    def test_identical_repeated_compaction_pauses_instead_of_billing_a_loop(self):
        folder, manifest = self.workspace()
        self.live_workspace()
        self.settings["limits"]["central_questions"] = 1
        initial = {"role": "user", "content": w.initial_prompt(folder, manifest, self.settings)}
        raw = self.tool_response([("read_file", {"path": "work/notes/missing.md"})])
        assistant, calls = providers.agent_turn(self.settings["discovery"], raw)
        results = providers.tool_messages(self.settings["discovery"], [(calls[0]["id"], {"error": "Missing file"})])
        state = {"messages": [initial, assistant, *results]}
        for _ in range(2):
            w.compact_messages(folder, state, self.settings["discovery"], initial, 4096, 24000)
        with self.assertRaisesRegex(ValueError, "identical tool results"):
            w.compact_messages(folder, state, self.settings["discovery"], initial, 4096, 24000)

    def test_resuming_older_workspace_upgrades_bootstrap_and_keeps_read_evidence(self):
        self.live_workspace(budget=1)
        folder, manifest = self.workspace()
        state = t.read(folder / "state.json")
        raw = self.tool_response([("read_file", {"path": "work/logical-maps/topics/example/background.md"})])
        assistant, calls = providers.agent_turn(self.settings["discovery"], raw)
        state.update(prompt_version="older-version", messages=[
            {"role": "user", "content": "Obsolete bootstrap: rediscover the whole repository"},
            assistant, *providers.tool_messages(self.settings["discovery"], [(calls[0]["id"], {"content": "Already inspected: definition A."})])])
        w.state_save(folder, state)
        with patch.object(providers, "complete", return_value=self.tool_response([("write_file", {
            "path": "work/notes/progress.md", "content": "Continue from definition A."})])) as api:
            result = t.run(self.q, self.settings, self.snapshot, self.origin, workspace=manifest["id"])
        self.assertFalse(result["errors"])
        body = json.dumps(api.call_args.args[1])
        self.assertIn("start_here", body)
        self.assertIn("Already inspected: definition A.", body)
        self.assertNotIn("Obsolete bootstrap", body)

    def test_lost_request_is_logged_and_resume_uses_new_turn(self):
        self.live_workspace()
        with patch.object(providers, "complete", side_effect=KeyboardInterrupt):
            with self.assertRaises(KeyboardInterrupt):
                t.run(self.q, self.settings, self.snapshot, self.origin)
        old = t.trawls(self.q)[0]
        with patch.object(providers, "complete", return_value=self.tool_response()) as api:
            result = t.run(self.q, self.settings, self.snapshot, self.origin)
        self.assertFalse(result["errors"])
        outcome = t.read(self.q / "trawls" / old["id"] / "outcome.json")
        self.assertEqual(outcome["outcome"], "interrupted")
        self.assertIn("interrupted", api.call_args.args[1]["messages"][-1]["content"])
        self.assertEqual(result["workspaces"], [old["workspace"]])
        self.assertEqual(len(t.trawls(self.q)), 2)

    def test_checkpoint_diff_captures_deletions_newlines_and_selection(self):
        folder, manifest = self.workspace()
        for index, call in enumerate([
            {"name": "write_file", "arguments": {"path": "work/notes/one.md", "content": "No final newline"}},
            {"name": "write_file", "arguments": {"path": "work/notes/two.md", "content": "Also no final newline"}},
            {"name": "delete_file", "arguments": {"path": "work/logical-maps/topics/example/models/a-model.yaml"}},
        ]):
            self.assertNotIn("error", w.execute_tool(folder, manifest, call, self.metadata, index))
        full = w.checkpoint(self.q, manifest["id"])
        self.assertEqual(full["changed_files"], 3)
        diff = self.q / "candidates" / (full["checkpoint"] + ".diff")
        t.git(self.source, "apply", "--check", str(diff))
        selected = w.checkpoint(self.q, manifest["id"], paths=["notes/one.md"])
        candidate = t.load_candidate(self.q, selected["checkpoint"])
        self.assertEqual([v["path"] for v in candidate["content"]["changes"]], ["notes/one.md"])
        self.assertEqual(len(candidate["content"]["edit_history"]), 1)
        with self.assertRaises(ValueError):
            w.checkpoint(self.q, manifest["id"], paths=["not-a-change"])
        self.assertTrue((self.topic / "models/a-model.yaml").exists())

    def test_switching_provider_keeps_files_and_starts_compatible_conversation(self):
        self.live_workspace()
        with patch.object(providers, "complete", return_value=self.tool_response([
                ("write_file", {"path": "work/notes/progress.md", "content": "Resume this proof"})])):
            first = t.run(self.q, self.settings, self.snapshot, self.origin)
        self.live_workspace("anthropic-messages")
        with patch.object(providers, "complete", return_value=self.tool_response(protocol="anthropic-messages")) as api:
            second = t.run(self.q, self.settings, self.snapshot, self.origin)
        self.assertEqual(first["workspaces"], second["workspaces"])
        self.assertEqual(second["checkpoints"][0]["changed_files"], 1)
        self.assertTrue(all(m["role"] == "user" for m in api.call_args.args[1]["messages"]))

    def test_trawl_logs_are_renamed_and_sealed_against_later_writes(self):
        result = t.run(self.q, self.settings, self.snapshot, self.origin)
        records = t.trawls(self.q)
        self.assertEqual(len(records), 2)
        self.assertFalse((self.q / "attempts").exists())
        for record in records:
            self.assertTrue(record["id"].startswith("trawl-"))
            folder = self.q / "trawls" / record["id"]
            self.assertTrue((folder / "SEALED.json").exists())
            before = {p.name: p.read_bytes() for p in folder.iterdir()}
            with self.assertRaisesRegex(ValueError, "sealed"):
                t.save(folder / "response.json", {"changed": True})
            with self.assertRaisesRegex(ValueError, "sealed"):
                t.save(folder / "extra.json", {"new": True})
            with self.assertRaisesRegex(ValueError, "sealed"):
                t.save(folder / "nested/extra.json", {"new": True})
            self.assertEqual(before, {p.name: p.read_bytes() for p in folder.iterdir()})
        self.assertFalse(result["errors"])

    def test_discovery_cannot_read_or_list_old_trawls_or_other_workspaces(self):
        old = t.run(self.q, self.settings, self.snapshot, self.origin)
        folder, manifest = self.workspace()
        history = t.trawls(self.q)[0]["id"]
        old_workspace = old["workspaces"][0]
        for index, path in enumerate((
            "trawls/" + history + "/response.json",
            "work/../../../trawls/" + history + "/response.json",
            "reference/../../" + old_workspace + "/state.json",
            "work/../../" + old_workspace + "/files/notes/progress.md",
            "work/.git/objects",
            str(self.q / "trawls" / history / "response.json"),
        )):
            for operation in ("read_file", "list_files", "write_file"):
                arguments = {"path": path}
                if operation == "write_file":
                    arguments["content"] = "forbidden"
                value = w.execute_tool(folder, manifest, {"name": operation, "arguments": arguments},
                                       self.metadata, index * 3 + ("read_file", "list_files", "write_file").index(operation))
                self.assertIn("error", value)
        with self.assertRaisesRegex(ValueError, "sealed"):
            w.initial_prompt(*w.load(self.q, old_workspace), self.settings)

    def test_completed_workspace_cannot_be_reopened_or_accessed_by_discovery(self):
        result = t.run(self.q, self.settings, self.snapshot, self.origin)
        wid = result["workspaces"][0]
        folder, manifest = w.load(self.q, wid)
        before = {p.relative_to(folder).as_posix(): p.read_bytes() for p in folder.rglob("*") if p.is_file()}
        for prepare in (True, False):
            with patch.object(providers, "complete") as api:
                with self.assertRaisesRegex(ValueError, "sealed"):
                    t.run(self.q, self.settings, self.snapshot, self.origin, workspace=wid, prepare_only=prepare)
            api.assert_not_called()
        for index, (name, args) in enumerate((
            ("read_file", {"path": "work/logical-maps/topics/example/background.md"}),
            ("list_files", {"path": "reference/"}),
            ("central_questions", {}),
            ("write_file", {"path": "work/notes/new.md", "content": "forbidden"}),
        )):
            value = w.execute_tool(folder, manifest, {"name": name, "arguments": args}, self.metadata, index)
            self.assertIn("sealed", value["error"])
        with self.assertRaisesRegex(ValueError, "sealed"):
            w.state_save(folder, {"status": "active"})
        after = {p.relative_to(folder).as_posix(): p.read_bytes() for p in folder.rglob("*") if p.is_file()}
        self.assertEqual(before, after)
        # Explicit curator review remains possible without reopening discovery.
        frozen = w.checkpoint(self.q, wid)
        candidate = t.load_candidate(self.q, frozen["checkpoint"])
        t.review_packet(self.q, self.settings, self.snapshot, self.origin, candidate)

    def test_legacy_configuration_and_evidence_remain_readable_without_rewriting(self):
        path = self.q / "config.local.yaml"
        settings = deepcopy(self.settings)
        settings["limits"]["attempts_per_question"] = settings["limits"].pop("trawls_per_question")
        write_yaml(path, settings)
        before = path.read_bytes()
        self.assertEqual(t.config(path)["limits"]["trawls_per_question"], 1)
        self.assertEqual(path.read_bytes(), before)
        candidate = self.candidate()
        candidate["discovery"]["attempt_id"] = candidate["discovery"].pop("trawl_id")
        review = self.review(candidate)
        result = t.admit(self.q, candidate, self.source, review["id"], "Test curator")
        record = t.read(self.source / "logical-maps" / result["record"])
        self.assertIn("attempt_id", record["certificate"]["trawl"]["discovery"])

    def test_history_rules_are_installed_outside_the_historical_logs(self):
        self.assertIn("Do not open", (self.q / "AGENTS.md").read_text())
        self.assertIn("no discovery access", (self.q / "trawls/AGENTS.md").read_text())
        self.assertIn("trawls/", (self.q / ".ignore").read_text())
        folder, _ = self.workspace()
        self.assertIn("Historical trawls are sealed", (folder / "INSTRUCTIONS.md").read_text())
        self.assertIn("SEALED.json", (folder / "AGENTS.md").read_text())

    def test_rejects_fabricated_checks_lean_tiers_and_paths(self):
        for key, value in (("tier", "gold"), ("checks", ["evil.py"]), ("id", "../../escape")):
            item = deepcopy(self.item)
            item["record"][key] = value
            with self.assertRaises((ValueError, t.jsonschema.ValidationError)):
                self.candidate(item)
        item = deepcopy(self.item)
        item["record"]["certificate"]["lean"] = "verified"
        with self.assertRaises(ValueError):
            self.candidate(item)

    def test_admission_preserves_provenance_and_runs_current_validation(self):
        candidate = self.candidate()
        review = self.review(candidate)
        result = t.admit(self.q, candidate, self.source, review["id"], "Test curator")
        record = t.read(result["record"])
        t.jsonschema.validate(record, t.pmap._schema("result"))
        cert = record["certificate"]
        self.assertEqual(cert["lean"], "none")
        self.assertEqual(cert["produced_by"], "test/cheap-model")
        self.assertEqual(cert["trawl"]["reviews"][0]["actor"]["model"], "review-model")
        self.assertEqual(cert["trawl"]["admission"]["by"], "Test curator")
        self.assertEqual(record["status"], "proved")
        self.assertIn("Informally checked", Path(result["writeup"]).read_text())
        self.assertEqual(t.git(self.source, "rev-parse", "HEAD"), self.origin["commit"])

    def test_model_schema_supports_same_evidence_history(self):
        item = deepcopy(self.item)
        item["kind"] = "model"
        item["record"] = {"id": "new-model", "name": "New model", "satisfies": ["b"], "violates": ["c"],
            "description": "Complete construction", "certificate": {"source_id": "misc"},
            "sources": ["Test"], "source_names": ["Test"]}
        candidate = self.candidate(item)
        review = self.review(candidate)
        result = t.admit(self.q, candidate, self.source, review["id"], "Test curator")
        t.jsonschema.validate(t.read(result["record"]), t.pmap._schema("model"))

    def test_conflict_does_not_write_destination(self):
        write_yaml(self.topic / "models/not-b.yaml", {"id": "not-b", "name": "Not B", "satisfies": ["a"],
            "violates": ["b"], "description": "Countermodel", "status": "proved",
            "certificate": {"source_id": "misc"}, "sources": ["Toy witness"]})
        self.commit()
        self.snapshot, self.origin = t.source_snapshot(self.q, self.settings)
        candidate = self.candidate()
        review = self.review(candidate)
        with self.assertRaisesRegex(ValueError, "conflicts"):
            t.admit(self.q, candidate, self.source, review["id"], "Curator")
        self.assertEqual(t.git(self.source, "status", "--porcelain"), "")

    def test_rejects_stale_review_and_changed_candidate(self):
        candidate = self.candidate()
        review = self.review(candidate)
        edited = deepcopy(candidate)
        edited["content"]["record"]["proof"] = "Different proof"
        with self.assertRaisesRegex(ValueError, "exact candidate"):
            t.admit(self.q, edited, self.source, review["id"], "Curator")
        (self.source / "new.txt").write_text("new commit")
        self.commit()
        with self.assertRaisesRegex(ValueError, "changed since review"):
            t.admit(self.q, candidate, self.source, review["id"], "Curator")

    def test_rejection_cannot_be_bypassed_by_selecting_older_acceptance(self):
        candidate = self.candidate()
        review = self.review(candidate)
        self.review(candidate, {**self.report, "verdict": "reject", "issues": ["Gap"]})
        with self.assertRaisesRegex(ValueError, "adverse review"):
            t.admit(self.q, candidate, self.source, review["id"], "Curator")

    def test_offline_candidate_cannot_be_admitted(self):
        self.metadata["offline"] = True
        candidate = self.candidate()
        review = self.review(candidate)
        with self.assertRaisesRegex(ValueError, "offline"):
            t.admit(self.q, candidate, self.source, review["id"], "Curator")

    def test_locks_atomic_artifacts_and_existing_records(self):
        with t.locked(self.q):
            with self.assertRaisesRegex(ValueError, "another trawler"):
                with t.locked(self.q):
                    pass
        path = self.q / "immutable.json"
        t.save(path, {"original": True})
        with self.assertRaises(FileExistsError):
            t.save(path, {"original": False})
        self.assertTrue(t.read(path)["original"])
        item = deepcopy(self.item)
        item["record"]["id"] = "a-model"
        with self.assertRaisesRegex(ValueError, "new record id"):
            self.candidate(item)

    def test_api_review_binds_returned_model_usage_and_exact_candidate(self):
        candidate = self.candidate()
        settings = deepcopy(self.settings)
        settings["review"] = {"protocol": "chat-completions", "provider": "test", "model": "review-alias",
                              "endpoint": "https://example.invalid/api"}
        response = {"id": "response-review", "model": "resolved-review-model", "usage": {"completion_tokens": 99},
                    "choices": [{"finish_reason": "stop", "message": {"content": json.dumps(self.report)}}]}
        with patch.object(providers, "complete", return_value=response):
            review = t.review_api(self.q, settings, self.snapshot, self.origin, candidate)
        self.assertEqual(review["candidate_sha256"], t.digest(candidate))
        self.assertEqual(review["actor"]["model"], "review-alias")
        self.assertEqual(review["actor"]["reported_model"], "resolved-review-model")
        self.assertEqual(review["trawl"]["usage"]["completion_tokens"], 99)

    def test_actual_http_transport_for_both_protocols(self):
        received = []
        class Handler(BaseHTTPRequestHandler):
            def log_message(self, *args):
                pass
            def do_POST(self):
                body = json.loads(self.rfile.read(int(self.headers["Content-Length"])))
                received.append((dict(self.headers), body))
                if "system" in body:
                    value = {"model": "resolved", "stop_reason": "end_turn", "content": [{"type": "text", "text": "{}"}]}
                else:
                    value = {"model": "resolved", "choices": [{"finish_reason": "stop", "message": {"content": "{}"}}]}
                self.send_response(200)
                self.end_headers()
                self.wfile.write(json.dumps(value).encode())
        server = HTTPServer(("127.0.0.1", 0), Handler)
        worker = threading.Thread(target=server.serve_forever, daemon=True)
        worker.start()
        try:
            for protocol in ("chat-completions", "anthropic-messages"):
                profile = {"protocol": protocol, "provider": "test", "model": "alias",
                    "endpoint": f"http://127.0.0.1:{server.server_port}/api", "api_key_env": "TRAWL_TEST_KEY"}
                with patch.dict(t.os.environ, {"TRAWL_TEST_KEY": "synthetic-test-value"}):
                    body = providers.prepare(profile, "instructions", "prompt", 111)
                    raw = providers.complete(profile, body, enabled=True)
                self.assertEqual(providers.unpack(profile, raw), {})
                self.assertNotIn("synthetic-test-value", json.dumps(body))
                self.assertEqual(raw["model"], "resolved")
            self.assertEqual(received[0][0]["Authorization"], "Bearer synthetic-test-value")
            self.assertEqual(received[1][0]["X-Api-Key"], "synthetic-test-value")
        finally:
            server.shutdown()
            server.server_close()
            worker.join()

    def test_publication_receipt_checks_actual_committed_bytes(self):
        candidate = self.candidate()
        review = self.review(candidate)
        result = t.admit(self.q, candidate, self.source, review["id"], "Curator")
        with self.assertRaises(ValueError):
            t.publication(self.q, result["admission"], self.source, "main", "Curator")
        self.commit()
        receipt = t.publication(self.q, result["admission"], self.source, "main", "Curator")
        self.assertEqual(receipt["commit"], t.git(self.source, "rev-parse", "HEAD"))
        Path(result["record"]).write_text(Path(result["record"]).read_text() + "# changed\n")
        self.commit()
        with self.assertRaisesRegex(ValueError, "differs"):
            t.publication(self.q, result["admission"], self.source, "main", "Curator")

    def test_larger_recorded_questions_and_draft_exclusion(self):
        write_yaml(self.topic / "results/large-question.yaml", {"id": "large-question",
            "premises": ["a", "b", "c"], "conclusion": "d", "status": "conjectured",
            "certificate": {"source_id": "misc"}, "sources": ["Test question"]})
        self.commit()
        snapshot, _ = t.source_snapshot(self.q, self.settings)
        queue = t.plan(snapshot, self.settings)
        self.assertTrue(any(q["question"].get("status") == "outside" for q in queue))
        topic = t.read(self.topic / "topic.yaml")
        topic["draft"] = True
        write_yaml(self.topic / "topic.yaml", topic)
        self.commit()
        snapshot, _ = t.source_snapshot(self.q, self.settings)
        self.assertEqual(t.plan(snapshot, self.settings), [])
        self.assertEqual(t.plan(snapshot, self.settings), [])

    def test_prompt_cap_prevents_network_and_checkpoints_without_a_request(self):
        settings = deepcopy(self.settings)
        settings["limits"]["max_prompt_chars"] = 10
        with patch.object(providers, "complete") as api:
            result = t.run(self.q, settings, self.snapshot, self.origin)
        api.assert_not_called()
        self.assertEqual(len(result["errors"]), 1)
        self.assertEqual(len(t.trawls(self.q)), 0)
        self.assertEqual(len(result["checkpoints"]), 1)

    def test_manual_review_packet_and_timestamp(self):
        candidate = self.candidate()
        packet = t.review_packet(self.q, self.settings, self.snapshot, self.origin, candidate)
        self.assertEqual(packet["candidate_sha256"], t.digest(candidate))
        self.assertEqual(packet["source"], self.origin)
        self.assertNotIn("response_budget", packet["context"])
        self.assertNotIn("continuation", packet["context"])
        with self.assertRaisesRegex(ValueError, "timestamp"):
            t.record_review(self.q, candidate, self.report, {"kind": "human", "name": "Curator"},
                            self.origin, reviewed_at="2999-01-01T00:00:00+00:00")

    def test_provider_adapters_limits_and_fail_closed(self):
        profile = {"protocol": "chat-completions", "provider": "test", "model": "model", "endpoint": "https://example.invalid/api"}
        body = providers.prepare(profile, "system", "prompt", 123)
        self.assertEqual(body["max_completion_tokens"], 123)
        self.assertEqual(body["n"], 1)
        with self.assertRaisesRegex(providers.ProviderError, "disabled"):
            providers.complete(profile, body)
        for name in ("max_tokens", "model", "n", "tools", "messages"):
            with self.assertRaises(providers.ProviderError):
                providers.prepare({**profile, "parameters": {name: 10}}, "s", "p", 1)
        with self.assertRaises(providers.ProviderError):
            providers.unpack(profile, {"choices": [{"finish_reason": "length", "message": {"content": "{}"}}]})
        other = {**profile, "protocol": "anthropic-messages"}
        request = providers.prepare(other, "s", "p", 321)
        self.assertEqual(request["max_tokens"], 321)
        self.assertEqual(request["system"], "s")
        self.assertEqual(providers.unpack(other, {"stop_reason": "end_turn", "content": [{"type": "text", "text": "{}"}]}), {})
        with self.assertRaises(providers.ProviderError):
            providers.validate_profile({**profile, "endpoint": "https://example.invalid/api?secret=value"})


if __name__ == "__main__":
    unittest.main(verbosity=2)
