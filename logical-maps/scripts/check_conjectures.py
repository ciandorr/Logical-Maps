"""Conjecture resolution, historical metadata, and Python/browser agreement.

Run with the project Python and Node installed. No browser packages needed.
The fixtures check answers against explicit semantic expectations before
comparing the Python and browser implementations.
"""
from copy import deepcopy
import json
import subprocess
from unittest.mock import patch

import pmap


IDS = list("abcdef")


def result(rid, premises, conclusion, *, status="proved", source="paper", **extra):
    return {
        "id": rid, "premises": premises, "conclusion": conclusion, "status": status,
        "certificate": {"source_id": source, "lean": "none"},
        "proof": "Fixture proof." if status == "proved" else "",
        "sources": [f"Original source for {rid}"],
        "source_names": [f"Source {rid}"],
        "_file": f"topics/fixture/results/{rid}.yaml",
        **extra,
    }


def model(mid, satisfies, violates, *, status="proved", source="models", **extra):
    return {
        "id": mid, "name": mid, "satisfies": satisfies, "violates": violates,
        "status": status, "certificate": {"source_id": source, "lean": "none"},
        "description": "Fixture construction." if status == "proved" else "",
        "sources": [f"Original source for {mid}"],
        "source_names": [f"Source {mid}"],
        "_file": f"topics/fixture/models/{mid}.yaml",
        **extra,
    }


def engine_fixture(name, rules, models, questions, background=(), allowed=None):
    def included(item):
        return item["status"] == "proved" and (
            allowed is None or item["certificate"]["source_id"] in allowed
        )
    return {
        "name": name, "ids": IDS, "rules": [r for r in rules if included(r)],
        "models": [m for m in models if included(m)], "questions": questions,
        "background": list(background),
    }


def resolve(fixture):
    engine = pmap.Engine(
        fixture["ids"], fixture["rules"], fixture["models"], fixture["background"]
    )
    return {q["id"]: engine.resolve_conjecture(q) for q in fixture["questions"]}


def expect_answers(fixture, expected):
    answers = resolve(fixture)
    assert set(answers) == set(expected), fixture["name"]
    for qid, status in expected.items():
        answer = answers[qid]
        assert answer["status"] == status, (fixture["name"], qid, answer)
        assert set(answer) == {"status", "via", "models"}
        assert all(rid in {r["id"] for r in fixture["rules"]} for rid in answer["via"])
        assert all(mid in {m["id"] for m in fixture["models"]} for mid in answer["models"])
    return answers


def main():
    rules = [
        result("ab", ["a"], "b"),
        result("bc", ["b"], "c", source="bridge"),
        result("cd-false", ["c", "d"], pmap.FALSE),
    ]
    models = [
        model("ma", ["a"], []),
        model("maf", ["a"], ["f"]),
        model("md", ["d"], []),
    ]
    questions = [
        result("proved-chain", ["a"], "c", status="conjectured"),
        result("proved-empty-chain", ["a"], "a", status="conjectured"),
        result("refuted-positive", ["a"], "d", status="conjectured"),
        result("proved-false", ["c", "d"], pmap.FALSE, status="conjectured"),
        result("proved-boolean-false", ["c", "d"], False, status="conjectured"),
        result("refuted-false", ["b"], pmap.FALSE, status="conjectured"),
        result("refuted-empty-false", [], False, status="conjectured"),
        result("open-false", ["e"], pmap.FALSE, status="conjectured"),
        result("incompatible-result", ["c", "d"], "e", status="conjectured"),
        result("open-positive", ["a"], "e", status="conjectured"),
        model("proved-model", ["b", "c"], ["d", "f"], status="conjectured"),
        model("refuted-model-false", ["a", "d"], [], status="conjectured"),
        model("refuted-model-forbidden", ["a"], ["c"], status="conjectured"),
        model("open-model-positive", ["e"], [], status="conjectured"),
        model("open-model-negative", ["b"], ["d", "e"], status="conjectured"),
        model("proved-empty-model", [], [], status="conjectured"),
    ]
    expected = {
        "proved-chain": "proved", "proved-empty-chain": "proved",
        "refuted-positive": "refuted", "proved-false": "proved",
        "proved-boolean-false": "proved", "refuted-false": "refuted",
        "refuted-empty-false": "refuted", "open-false": "open",
        "incompatible-result": "incompatible", "open-positive": "open",
        "proved-model": "proved", "refuted-model-false": "refuted",
        "refuted-model-forbidden": "refuted", "open-model-positive": "open",
        "open-model-negative": "open", "proved-empty-model": "proved",
    }
    fixtures = [engine_fixture("core", rules, models, questions)]
    core = expect_answers(fixtures[0], expected)
    assert core["proved-chain"]["via"] == ["ab", "bc"]
    assert core["proved-empty-chain"] == {"status": "proved", "via": [], "models": []}
    assert core["refuted-positive"]["models"] == ["ma", "maf"]
    assert core["refuted-positive"]["via"] == ["ab", "bc", "cd-false"]
    assert core["refuted-false"]["via"] == ["ab"]
    assert core["proved-model"]["models"] == ["maf"]
    assert core["proved-model"]["via"] == ["ab", "bc", "cd-false"]
    assert core["refuted-model-forbidden"]["via"] == ["ab", "bc"]

    # A negative implication is not a counterexample without a model.
    no_witness_questions = [
        result("excluded-without-witness", ["c"], "d", status="conjectured"),
        result("consistent-without-witness", ["c"], False, status="conjectured"),
        model("possible-without-witness", ["c"], ["d"], status="conjectured"),
    ]
    no_witness = engine_fixture("no-existence-assumption", rules, [], no_witness_questions)
    fixtures.append(no_witness)
    expect_answers(no_witness, {q["id"]: "open" for q in no_witness_questions})

    # A contradictory model cannot settle any existence or non-implication question.
    invalid = engine_fixture(
        "invalid-model-is-not-evidence", rules,
        [model("bad-model", ["c", "d"], [])], no_witness_questions
    )
    fixtures.append(invalid)
    expect_answers(invalid, {q["id"]: "open" for q in no_witness_questions})

    # Inconsistent background takes precedence even over an implication to False.
    bad_background = engine_fixture(
        "inconsistent-background", rules, models, questions, background=["c", "d"]
    )
    fixtures.append(bad_background)
    bad_answers = expect_answers(
        bad_background, {q["id"]: "inconsistent-background" for q in questions}
    )
    assert all(a["via"] == ["cd-false"] and not a["models"] for a in bad_answers.values())
    fixed_questions = [
        result("background-fact", [], "a", status="conjectured"),
        result("background-derived", [], "c", status="conjectured"),
    ]
    fixed = engine_fixture("fixed-background-facts", rules, models[:2], fixed_questions, ["a"])
    fixtures.append(fixed)
    fixed_answers = expect_answers(fixed, {q["id"]: "proved" for q in fixed_questions})
    assert fixed_answers["background-fact"]["via"] == []
    assert fixed_answers["background-derived"]["via"] == ["ab", "bc"]

    # Source filtering can remove a proof or its model while the question survives.
    no_bridge = engine_fixture(
        "source-filtered-proof", rules, models, [questions[0]],
        allowed={"paper", "models"}
    )
    fixtures.append(no_bridge)
    expect_answers(no_bridge, {"proved-chain": "open"})
    no_models = engine_fixture(
        "source-filtered-models", rules, models, [questions[2]],
        allowed={"paper", "bridge"}
    )
    fixtures.append(no_models)
    expect_answers(no_models, {"refuted-positive": "open"})

    # History records can use their actual proofs; their marker is not itself evidence.
    historical_rule = result(
        "past-result", ["e"], "f", source="history", was_conjectured=True
    )
    historical_model = model(
        "past-model", ["e"], ["d"], source="history", was_conjectured=True
    )
    proposed_rule = result("hypothetical-ae", ["a"], "e", status="conjectured")
    proposed_model = model("hypothetical-ea", ["e"], ["a"], status="conjectured")
    probe = result("no-conjectural-chain", ["a"], "f", status="conjectured")
    history_questions = [historical_rule, historical_model, proposed_rule, proposed_model, probe]
    history_rules = [*rules, historical_rule, proposed_rule]
    history_models = [*models, historical_model, proposed_model]
    history = engine_fixture("history-with-proof", history_rules, history_models, history_questions)
    fixtures.append(history)
    history_answers = expect_answers(history, {
        "past-result": "proved", "past-model": "proved", "hypothetical-ae": "refuted",
        "hypothetical-ea": "open", "no-conjectural-chain": "refuted",
    })
    assert history_answers["past-result"]["via"] == ["past-result"]
    assert history_answers["past-model"]["models"] == ["past-model"]
    filtered_history = engine_fixture(
        "history-with-source-excluded", history_rules, history_models,
        [historical_rule, historical_model], allowed={"paper", "bridge", "models"}
    )
    fixtures.append(filtered_history)
    expect_answers(filtered_history, {"past-result": "open", "past-model": "open"})

    # Export answers use fixed framework assumptions, not the default viewer preset.
    records = [*rules, historical_rule, proposed_rule, *questions, probe,
               result("preset-is-not-background", [], "a", status="conjectured")]
    model_records = [*models, historical_model, proposed_model]
    data = {
        "topic": {
            "id": "fixture", "title": "Fixture", "background": [],
            "background_presets": [{"id": "example", "name": "Example", "principles": ["a"], "default": True}],
        },
        "principles": [
            {"id": p, "name": p.upper(), "statement": f"Principle {p}",
             "_file": f"topics/fixture/principles/{p}.yaml"} for p in IDS
        ],
        "results": [r for r in records if "premises" in r],
        "models": [*model_records, *[q for q in questions if "satisfies" in q]],
    }
    before = deepcopy(data)
    analysis = pmap.analyse(data)
    assert data == before, "Resolution must not rewrite original status, sources, or metadata"
    assert analysis["conjectures"]["preset-is-not-background"]["status"] == "refuted"
    assert "past-result" in analysis["conjectures"] and "past-model" in analysis["conjectures"]
    assert "ab" not in analysis["conjectures"] and "ma" not in analysis["conjectures"]
    # Even analysis used to preview hypothetical edges must resolve from proved records.
    hypothetical_analysis = pmap.analyse(data, include_conjectures=True)
    assert hypothetical_analysis["conjectures"] == analysis["conjectures"]
    with patch.object(pmap, "load_topic", return_value=data):
        payload = pmap.export_json("fixture")
    assert payload["server_analysis"]["conjectures"] == analysis["conjectures"]
    assert next(r for r in payload["results"] if r["id"] == "past-result")["was_conjectured"] is True

    document = pmap.bundle_open_md("fixture", data, analysis)
    unresolved = document.split("### 1.1 Unresolved", 1)[1].split("### 1.2 Resolved", 1)[0]
    resolved = document.split("### 1.2 Resolved", 1)[1].split("### 1.3 Incompatible", 1)[0]
    incompatible = document.split("### 1.3 Incompatible", 1)[1].split("## 2.", 1)[0]
    assert "hypothetical-ea" in unresolved and "proved-chain" not in unresolved
    assert "proved-chain" in resolved and "past-result" in resolved and "past-model" in resolved
    assert "incompatible-result" in incompatible and "incompatible-result" not in resolved
    assert "Original source for proved-chain" in resolved
    assert "Original source for past-model" in resolved
    assert "Supporting result ids:" in resolved and "Model witness ids:" in resolved

    # The optional field accepts booleans, and cannot alter ordinary proof validation.
    for schema_name, item in (("result", historical_rule), ("model", historical_model)):
        validator = pmap.jsonschema.Draft202012Validator(pmap._schema(schema_name))
        clean = {k: v for k, v in item.items() if not k.startswith("_")}
        assert validator.is_valid(clean)
        assert validator.is_valid({**clean, "was_conjectured": False})
        assert not validator.is_valid({**clean, "was_conjectured": "true"})
        assert not validator.is_valid({**clean, "was_conjectured": 1})

    # Include real current/history questions from every topic in cross-engine checks.
    for topic in pmap.list_topics():
        actual_data = pmap.load_topic(topic)
        actual_questions = [
            q for q in [*actual_data["results"], *actual_data["models"]]
            if q["status"] == "conjectured" or q.get("was_conjectured", False)
        ]
        fixtures.append({
            "name": topic, "ids": [p["id"] for p in actual_data["principles"]],
            "rules": [r for r in actual_data["results"] if r["status"] == "proved"],
            "models": [m for m in actual_data["models"] if m["status"] == "proved"],
            "background": actual_data["topic"].get("background", []),
            "questions": actual_questions,
        })
    template = pmap.TEMPLATE.read_text()
    js = template[template.index("function closure("):template.index("// ---------------------------------------------------------------- state")]
    harness = """
const vm=require('node:vm'),fs=require('node:fs');
const input=JSON.parse(fs.readFileSync(0,'utf8'));
const context=vm.createContext({});
vm.runInContext('const FALSE="false";'+input.code+';globalThis.Engine=Engine;',context);
const output=input.fixtures.map(f=>{
 const e=new context.Engine(f.ids,f.rules,f.models,f.background);
 return Object.fromEntries(f.questions.map(q=>[q.id,e.resolveConjecture(q)]));
});
process.stdout.write(JSON.stringify(output));
"""
    output = subprocess.run(
        ["node", "-e", harness], input=json.dumps({"code": js, "fixtures": fixtures}),
        capture_output=True, text=True, check=True,
    )
    browser = json.loads(output.stdout)
    python = [resolve(f) for f in fixtures]
    for fixture, actual, wanted in zip(fixtures, browser, python):
        assert actual == wanted, (fixture["name"], actual, wanted)
    print(
        "PASS: conjecture proofs/refutations, False and incompatible backgrounds, "
        "all model flags, source-filtered history, schemas/export/bundle, and "
        f"Python/browser parity across {len(fixtures)} fixtures."
    )


if __name__ == "__main__":
    main()
