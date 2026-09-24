# Theorem trawl

A model-neutral worker for **Git snapshot → ranked questions → editable quarantine workspace → frozen diff → review**. Discovery works on YAML files and Markdown write-ups throughout the search. Saved work survives request limits, interruptions and later API failures. Live calls are disabled in the example configuration.

The implementation uses the project's Python requirements and standard library, without a vendor SDK. Commands run from `logical-maps/`; Python 3.10+ on macOS/Linux is supported.

## Quick start

```sh
python3 scripts/trawl.py --quarantine /path/to/Logical-Maps-Quarantine init
python3 scripts/trawl.py --quarantine /path/to/Logical-Maps-Quarantine plan --top 10
python3 scripts/trawl.py --quarantine /path/to/Logical-Maps-Quarantine prepare-workspace
python3 scripts/trawl.py --quarantine /path/to/Logical-Maps-Quarantine run
python3 scripts/trawl.py --quarantine /path/to/Logical-Maps-Quarantine status
```

`init` creates an independent local Git repository with an ignored `config.local.yaml`. Configure the source repository/ref, topics, limits, and provider profiles there. A local Git checkout is also a valid source: only **committed** files at the selected ref are copied. GitHub can be connected later with ordinary Git commands in quarantine. The runner never pushes, schedules jobs, or commits either repository.

`prepare-workspace` creates or returns an unfinished workspace without an API call. It prints the files directory and instructions. `run` automatically resumes unfinished workspaces before scheduling fresh questions. `run --workspace workspace-ID` resumes a specific workspace, including a previously completed search. A workspace keeps its original source revision even when the upstream branch advances; new workspaces use the newly fetched revision. Source changes therefore cannot overwrite unfinished work.

`plan`, `prepare-workspace`, `run`, `review-packet`, and `review` fetch the source ref by default. `--cached` reuses the last fetched revision. The installed map engine computes questions from a pinned allowlist of YAML and Markdown files. Fetched code is never executed. Private files, generated exports, source PDFs, Lean files and executables are excluded from the initial copy. Use Git's credential helper for private repositories.

The offline provider exercises scheduling and persistence without mathematical discovery or API charges. Empty smoke-test checkpoints are not evidence. Run `python3 scripts/check_trawl.py` for synthetic integration tests.

## The working repository

Each workspace is an ordinary directory **inside the quarantine Git repository**, not a nested Git repository or a branch of the published repository:

```text
workspaces/workspace-ID/
  files/logical-maps/topics/...  writable copies of the database and write-ups
  files/notes/                   partial arguments, failed attempts, resume notes
  files/evidence/                 source/access evidence accompanying proposals
  reference/source/              pinned original YAML and Markdown
  reference/schema/              database schemas from the installed runner
  reference/central-questions.json  complete ranked list for the chosen background
  reference/queue.json            all scheduled topics/backgrounds
  workspace.json                 source revision, initial model, baseline hashes
  INSTRUCTIONS.md                discovery instructions for an external agent
  state.json                     conversation and resumable request state
  turns/<attempt>/*-edit.json     dated edit intents, content, before/after hashes
  turns/<attempt>/*-result.json   individual tool receipts, including failures
```

The agent can add, edit or delete copied records, proofs, notes, principle definitions and other text files. It can save unfinished or temporarily invalid YAML and repair it later. There is no count quota and no final JSON deliverable. A normal final message ends the current search; the substantive output is already on disk.

The built-in API loop supplies `list_files`, `read_file`, `write_file`, `edit_file`, `delete_file`, and `central_questions`. Tool paths use `work/` for `files/` and `reference/` for the original context. Writes are constrained to `work/`; absolute paths, traversal, symlinks and `.git` edits are rejected. Discovery cannot reach the published checkout or overwrite runner-owned provenance through these tools. Each write has a durable journal entry before an atomic replacement, and an individual receipt afterwards. An interrupted write can be recovered without repeating a paid API call. Earlier successful writes survive later malformed tool calls.

An external tool-enabled agent can also edit `files/` directly and use `INSTRUCTIONS.md`. Give its host write access to that directory and read-only access to `reference/`; enforce these permissions in its sandbox/container. Merely setting its working directory is not an OS sandbox. External edits appear in checkpoint diffs, but do **not** acquire invented per-edit model identity or timestamps; retain that agent's actual session evidence separately. The prompts allow other tools available in the execution environment. The bundled loop currently executes the listed file tools; it does not include shell, browser or Lean tool adapters.

Commit `workspaces/`, `attempts/`, `candidates/`, `packets/`, `reviews/`, `admissions/`, and `publications/` when connecting quarantine to GitHub. Working files and their pinned references are not disposable cache. No discovery file is copied into the published database automatically.

## Questions and resource limits

Scheduling uses the existing `pmap.Lynchpins` engine and includes open implication/consistency questions in its universe, model-property checks, and larger recorded questions. Draft topics are skipped. Centrality prioritizes starting points; discovery is asked to sweep for all readily obtainable results across the list.

The **full central-question list** for the workspace's topic and expanded background is always available through the paginated `central_questions` tool and `reference/central-questions.json`. `limits.central_questions` controls how much of it appears in the initial prompt (20 by default, or `all`), not how many questions can be explored. A scheduled target below that initial range is included as well. Definitions, existing evidence, instructions and write-ups are available as files, read on demand. `reference/queue.json` retains the complete scheduling queue across selected topics/backgrounds.

Each invocation is bounded by:

- `requests_per_run`: total API turns, including failures and resumed work;
- `max_output_tokens`: generation limit per turn;
- `max_prompt_chars`: complete serialized request limit, including tool definitions and conversation;
- `timeout_seconds`: transport timeout per request.

`attempts_per_question` limits fresh workspaces for a question/profile/context; it does not limit continuation turns. A budget stop leaves the current workspace active for the next run. Conversation history is compacted when necessary; files, progress notes and immutable API transcripts remain available. An oversized initial prompt fails before a network call.

These are request/size limits, not a currency budget. Provider-reported usage is retained; pricing is not guessed. Network calls are never automatically retried. Requests are reserved before transport. On resumption, saved responses finish their file edits using receipts; an interrupted request with no saved response is recorded as having an unknown outcome, and the next turn starts from saved files rather than silently replaying it. A single-process lock protects quarantine from concurrent runners.

## Providers

Replace `offline` in `config.local.yaml`, then set `live_api: true`. The selected discovery endpoint/model must support function calls. Review may use a different provider and model.

```yaml
discovery:
  protocol: chat-completions
  provider: your-provider
  endpoint: https://your-provider.example/v1/chat/completions
  api_key_env: TRAWL_API_KEY
  model: exact-api-model-id
  token_parameter: max_completion_tokens
  parameters: {}
```

Use `token_parameter: max_tokens` for compatible servers requiring that field. Native Messages APIs use `protocol: anthropic-messages`, `endpoint: https://api.anthropic.com/v1/messages`, and an appropriate key environment variable. Provider-specific reasoning options belong in `parameters`; they cannot override runner-controlled prompts, tools or limits. Keep credentials out of the profile and endpoint URL. Credentials are read only for transport and never saved in request bodies. HTTP is allowed only on loopback; redirects are rejected.

Adapters implement [Chat Completions function calling](https://developers.openai.com/api/docs/guides/function-calling) and [Messages tool use](https://platform.claude.com/docs/en/agents-and-tools/tool-use/define-tools). Provider-specific message/tool schemas live in `providers.py`; workspace and provenance logic is vendor-neutral. No model name or pricing is hardcoded.

## Evidence and review

The runner records the actual requested/reported model, source commit, dates, prompts, raw responses, usage and individual edit history. Discovery instructions ask for citations and locators alongside each argument, plus `files/evidence/<topic>/<record-id>.yaml` entries with `kind`, `citation`, `locator`, `role`, and `verification`. See [prompts.py](prompts.py). A proposer's assertion about source access is distinct from an independent review. Uninspected citations stay unverified; finite experiments alone do not prove a general theorem.

A workspace is mutable. A **checkpoint** is immutable and binds the exact before/after files, hashes and edit history. Runs checkpoint on exit, including budget exhaustion and interruption. Additional checkpoints can be made at any time:

```sh
python3 scripts/trawl.py --quarantine /path/to/quarantine checkpoint workspace-ID
python3 scripts/trawl.py --quarantine /path/to/quarantine review-packet checkpoint-ID
python3 scripts/trawl.py --quarantine /path/to/quarantine review checkpoint-ID
```

The checkpoint JSON and a readable `.diff` are stored under `candidates/`. Use repeated `checkpoint --path logical-maps/topics/TOPIC/results/ID.yaml --path logical-maps/topics/TOPIC/writeups/ID.md --path evidence/TOPIC/ID.yaml` options to freeze a smaller set of changed files for review; include its supporting evidence and dependencies. This limits the review packet, not discovery output. Partial/invalid drafts are retained for inspection. Validation and mathematical review happen before admission; saving a file does not certify it. The copied YAML's `proved`, reviewer or Lean fields are proposals/historical claims, not trusted new verification metadata.

API review uses the configured review model, the immutable checkpoint and current source context. It records `accept`, `revise`, `reject`, or `inconclusive`, with argument checks, source checks and issues. An acceptance with unresolved issues is invalid. Large checkpoints may exceed the review prompt budget; use external review rather than silently omitting files. An offline profile cannot review mathematics.

For an actual external review, generate a packet, inspect the checkpoint and supporting files, then supply a report:

```yaml
candidate_sha256: HASH_FROM_PACKET
source_commit: COMMIT_FROM_PACKET
reviewed_at: 'ACTUAL_ISO_TIMESTAMP_WITH_TIMEZONE'
report:
  verdict: inconclusive
  summary: Explain the verdict.
  argument_check: Describe the steps actually checked.
  source_check: Identify evidence actually inspected and attribution checked.
  issues:
    - State the remaining gap.
```

```sh
python3 scripts/trawl.py --quarantine /path/to/quarantine review checkpoint-ID \
  --report /path/to/report.yaml --reviewer 'Actual reviewer' --reviewer-kind human
```

For an external model review, use `--reviewer-kind model --provider PROVIDER --reviewer EXACT-MODEL-ID`. Review time and recording time are separate. Later workspace edits create a new checkpoint and do not inherit acceptance of an earlier hash. If the source advances, review against the updated source packet.

## Admission

Arbitrary workspace additions, modifications, deletions and notes use the ordinary **curator/PR workflow** after review. Their checkpoints and diffs make that work inspectable; the `admit` command does not yet automatically apply arbitrary workspace patches. Curate the accepted files, validate the database, rebuild exports and run the public-content checks. Preserve mathematical authorship and existing certificates, append dated change history for actual edits, and retain the checkpoint/review identities and actual discovery/review/admission dates. Quarantine provenance is not permission to copy self-assigned verification fields into the published database. An informal model review never creates a Lean certificate.

Previously generated single-record `candidate-ID` artifacts remain reviewable and compatible with the existing explicit admission path:

```sh
python3 scripts/trawl.py --quarantine /path/to/quarantine admit candidate-ID \
  --review review-ID --destination /path/to/Logical-Maps --by 'Actual curator'
python3 scripts/trawl.py --quarantine /path/to/quarantine record-publication admission-ID \
  --destination /path/to/Logical-Maps --ref main --by 'Actual curator'
```

That path requires a clean checkout at the reviewed commit, accepting review, fresh destination paths and passing schema/reference/consistency checks. It writes `certificate.trawl` with discovery/evidence/review/admission history and keeps Lean status independent. Publication recording checks the actual committed YAML bytes against the receipt; neither command pushes. Single-record JSON candidate generation is no longer the discovery interface.
