# Working in Logical Maps

## Start with the mathematical question

This is a curated database of principles, implications, and countermodels.
For a mathematical question, find the relevant definitions and evidence before
trying a new proof. A question about the mathematics is not by itself a request
to edit records or rebuild the website.

Mathematical brainstorming and Lean formalization are separate tasks. Default
to ordinary mathematical reasoning: definitions, examples, proofs, and
countermodels. Start Lean work only when the user explicitly requests it or
it is already part of the agreed task. “Prove this”, “check this argument”,
and “is this consistent?” do not by themselves request Lean. Do not turn a
mathematical discussion into a formalization project or routinely ask to do so.

The two live topics are **Classicism** and **Unbounded Utility**. Route by the
mathematics, even when the user gives only an abbreviation or a construction:

| The question concerns | Read first |
| --- | --- |
| C/C5, higher-order modal logic, BF/ND, Boolean completeness, rigidity, choice, pure/signature schemata, action models | [Classicism guide](logical-maps/topics/classicism/AGENTS.md) |
| DU/DTU, gambles, expectation, symmetry, mixtures, background risk, copulas, clipping, stochastic dominance | [Unbounded Utility guide](logical-maps/topics/unbounded-utility/AGENTS.md) |

Then use [the shared mathematical workflow](logical-maps/AGENTS.md), including
its small query recipe when a derived implication or countermodel is needed.
Read the chosen topic guide explicitly; do not rely on an agent automatically
loading nested `AGENTS.md` files during read-only research.

## Keep discovery narrow

- Paths in the topic guides are relative to that topic. Run project commands
  from `logical-maps/`.
- Start with the chosen topic's `topic.yaml`, the relevant part of
  `background.md`, and the few matching `principles/<id>.yaml` files. Follow
  their IDs into `results/`, `models/`, and `writeups/`.
- Search within that topic. Prefer file names and `rg -l` to dumping every
  match; read only the matching records or sections. Expand the search when
  the local evidence gives a reason to do so.
- For mathematical questions, `build/`, download ZIPs, generated `MAP.md`,
  `viewer/`, vendored libraries, and Lean caches are not discovery entry
  points. They duplicate data or implement presentation. Consult Lean sources
  when the user's question specifically concerns the formalization; ordinary
  mathematical proof dependencies should be followed through the records and
  write-ups.
- Use `extraction.md` for source coverage, translation decisions, and deferred
  work, searching its headings first. It is history, not the current verdict
  table. Do not read whole papers or the whole database to locate one claim.
- Leave other topics out unless the user names them. Do not scan `.private/`
  by default; use a relevant private draft when the task actually calls for it.
- Once the statement and its local evidence are identified, do the mathematics.
  Do not spend the rest of the turn exploring unrelated repository structure.

## Editing and publication

Read `README.md` and `logical-maps/CLAUDE.md` before editing the project.

- Keep private drafts and research notes in the root `.private/` directory. It
  is ignored and may contain a separate private repository. Never force-add it,
  make it a submodule, or publish its content without explicit authorization.
- Check the repository root and remote before committing or pushing. Private
  and public work have separate histories and remotes.
- Edit source files, then rebuild `logical-maps/build/`; do not hand-edit exports.
- Before a public commit, run validation and `scripts/check_public.py` after the
  build. That check scans files and nested download archives for private material.
- Preserve user-written text, mathematical claims, citations, and verification
  status unless the requested change concerns them.
