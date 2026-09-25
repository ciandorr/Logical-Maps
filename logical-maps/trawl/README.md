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

`init` creates an independent local Git repository with an ignored `config.local.yaml`. Configure the source repository/ref, topics, limits, and provider profiles there. A local Git checkout is also a valid source: only **committed** files at the selected ref are copied. The terminal command runs the controller on your machine and sends model requests to the API provider. Connecting a GitHub remote stores files there; cloud execution requires the optional [GitHub Actions setup](github-actions/README.md). The core runner never pushes or commits; the cloud wrapper backs up and pushes only quarantine artifacts.

`prepare-workspace` creates or returns an unfinished workspace without an API call. It prints the files directory and instructions. `run` automatically resumes unfinished workspaces before scheduling fresh questions. `run --workspace workspace-ID` resumes a specific unfinished workspace. Completed workspaces are sealed and cannot be reopened for discovery, even with an explicit workspace ID. A workspace keeps its original source revision even when the upstream branch advances; new workspaces use the newly fetched revision. Source changes therefore cannot overwrite unfinished work.

`plan`, `prepare-workspace`, `run`, `review-packet`, and `review` fetch the source ref by default. `--cached` reuses the last fetched revision. The installed map engine computes questions from a pinned allowlist of YAML and Markdown files. Fetched code is never executed. Private files, generated exports, source PDFs, Lean files and executables are excluded from the initial copy. Use Git's credential helper for private repositories.

The offline provider exercises scheduling and persistence without mathematical discovery or API charges. Empty smoke-test checkpoints are not evidence. Run `python3 scripts/check_trawl.py`, `python3 scripts/check_trawl_delegation.py` and `python3 scripts/check_trawl_parallel.py` for synthetic integration tests.

## Model-directed parallel agents

The model decides how to divide the work using `spawn_subagent`, supplying a focused task, optional context and optionally a question ID from its topic's queue. It can request a batch of independent tasks, continue working, and delegate further from children. No worker-count setup is required. The controller starts one lead workspace and launches only the child agents requested by models. Child agents focus on their assigned task and finish after one pass; the lead can integrate proposals and run further passes.

All agents share **one** `requests_per_run` and `output_tokens_per_run` allowance. Each API call reserves its maximum output before dispatch; active reservations count against the allowance, and actual usage refunds unused output after completion. Temporary exhaustion waits for outstanding responses to settle. Unknown usage consumes the full reservation. A queued child does not receive a fresh budget. The internal default is at most 32 simultaneous API calls (advanced override `limits.max_concurrent_agents`, 1–256); this is a ceiling, not a requested number of agents. Provider limits may constrain achievable parallelism.

`wait_for_subagents` suspends the parent's API requests until its children finish, without paid polling or occupying a network slot. `subagent_status` lists only that parent's assignments and completed handoffs. A normal final answer also waits if the parent still has outstanding children. Assignments are durable before acknowledgement; interrupted runs resume the same parent/child workspaces without spawning duplicates.

Each child starts with separate writable copies of the parent's pinned **published** source and the explicitly supplied brief. The parent's edits and conversation are not implicitly shared. The trusted controller copies a finished child's frozen changed files, summary and provenance into the parent's read-only `reference/subagents/` directory. The parent can inspect those proposals and integrate useful changes into its own files. Nested checkpoint/model attribution is retained; disagreements and unreviewed status are preserved. No raw child conversation or historical trawl archive is exposed.

Only HTTP calls run in threads. Scheduling, request accounting, file tools, checkpoints and the Python map engine execute on one coordinator, avoiding shared-engine-state and file races. The quarantine lock still excludes a second controller on the same filesystem. A fatal API error stops new calls throughout the agent family; successful replies already in flight are still saved. Ctrl-C likewise stops dispatch and drains outstanding replies before checkpointing and exiting (up to the configured API timeout for a stalled reply). A hard kill can lose in-flight replies, but completed writes and request journals remain resumable.

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
  reference/subagents/<id>/       frozen child outputs and provenance, read-only
  delegations/<id>/task.json      durable scoped subagent assignment
  delegations/<id>/result.json    immutable completed handoff receipt
  derived/<hash>.json             immutable inference/ranking/validation reports
  workspace.json                 source revision, initial model, baseline hashes
  INSTRUCTIONS.md                discovery instructions for an external agent
  state.json                     conversation and resumable request state
  SEALED.json                    closes completed work to all discovery tools
  turns/<trawl>/*-edit.json       dated edit intents, content, before/after hashes
  turns/<trawl>/*-result.json     individual tool receipts, including failures
```

The agent can add, edit or delete copied records, proofs, notes, principle definitions and other text files. It can save unfinished or temporarily invalid YAML and repair it later. There is no count quota and no final JSON deliverable. A normal final message ends a pass; the substantive output is already on disk. If mathematical files changed, the runner can begin another pass in the same workspace.

The built-in API loop supplies `list_files`, `read_file`, `write_file`, `edit_file`, `delete_file`, `central_questions`, the three subagent tools above, and the Python tools described below. Tool paths use `work/` for `files/`, `reference/` for the original context, and `derived/` for computation reports. Writes are constrained to `work/`; absolute paths, traversal, symlinks and `.git` edits are rejected. Discovery cannot reach the published checkout or overwrite runner-owned provenance through these tools. Each write has a durable journal entry before an atomic replacement, and an individual receipt afterwards. An interrupted write can be recovered without repeating a paid API call. Earlier successful writes survive later malformed tool calls.

The initial packet gives the exact topic directory and starting guide, framework and record paths. `list_files` lists immediate children by default; `recursive: true` explicitly lists a subtree. A fresh workspace has no progress note, and the agent is told to create one as it learns useful facts.

An external tool-enabled agent can also edit `files/` directly and use `INSTRUCTIONS.md`. Give its host write access to that directory and read-only access to `reference/` and `derived/`; enforce these permissions in its sandbox/container. Merely setting its working directory is not an OS sandbox. External edits appear in checkpoint diffs, but do **not** acquire invented per-edit model identity or timestamps; retain that agent's actual session evidence separately. The prompts allow other tools available in the execution environment. The bundled loop executes file tools and the installed Python map engine; it does not include shell, browser or Lean tool adapters.

Commit `workspaces/`, `trawls/`, `candidates/`, `packets/`, `reviews/`, `admissions/`, and `publications/` when connecting quarantine to GitHub. Working files and their pinned references are not disposable cache. No discovery file is copied into the published database automatically.

## Historical trawls are off limits to discovery

Raw request/response logs live in `trawls/trawl-ID/`, with `trawl_id` in new provenance and `trawls_per_question` in configuration. Each completed log gets `SEALED.json`: the runner refuses to overwrite its files or append new ones. Older certificate field names and configuration are accepted for compatibility; historical evidence is not rewritten merely to rename a field.

There is one log folder per API request, not per mathematical finding. An active workspace can therefore generate many folders while exploring. Actual proposals are its changed files, frozen into review checkpoints; log counts alone do not demonstrate useful progress.

Discovery tools expose **only the assigned unfinished workspace's files, published reference, explicitly delegated child handoffs and computation reports**. They cannot list, read, search or edit `trawls/`, sibling workspaces, candidate/review archives, or `.git`. Completed workspaces also reject every discovery tool call, including reads, computation commands and replays of previous tool receipts. New searches start from the published database. Scheduling reads minimal workspace metadata, not old proofs or transcripts into a model prompt.

A budget stop leaves an unfinished workspace resumable with its own files, notes and active conversation. This is continuation of the current search, not permission to inspect another trawl. Completed work remains available to explicitly assigned curator review through frozen checkpoints; approval does not authorize reopening historical work for discovery.

Quarantine `AGENTS.md`, `trawls/AGENTS.md`, workspace instructions and the discovery system prompt all state this rule. `.ignore` keeps historical artifacts out of ordinary recursive searches without excluding them from Git backups. This search exclusion and the seal markers are not OS permissions. The built-in tool boundary enforces discovery access; an external agent must receive only its assigned `files/`, `reference/` and `derived/` mounts, without the quarantine root, Git history, or credentials that could fetch that history. Extra tools must respect the same boundary. Its host can expose the Python tools through a trusted adapter without exposing the quarantine root.

Setup and handoff instructions live outside the historical logs. Old trawls must not be opened as examples for the next AI. Corrections and further mathematical work require new artifacts. Removing unwanted trawls from the working tree does not rewrite earlier Git commits.

## Questions and resource limits

Scheduling uses the existing `pmap.Lynchpins` engine and includes open implication/consistency questions in its universe, model-property checks, and larger recorded questions. Draft topics are skipped. Centrality prioritizes starting points; discovery is asked to sweep for all readily obtainable results across the list.

The **full central-question list** for the workspace's topic and expanded background is always available through the paginated `central_questions` tool and `reference/central-questions.json`. `limits.central_questions` controls how much of it appears in the initial prompt (20 by default, or `all`), not how many questions can be explored. A scheduled target below that initial range is included as well. Definitions, existing evidence, instructions and write-ups are available as files, read on demand. `reference/queue.json` retains the complete scheduling queue across selected topics/backgrounds.

### Python inference tools

The following calls execute the **installed** `scripts/pmap.py` functions on the current YAML copies. They do not call a model, execute downloaded or model-written Python, or change records.

| Tool | Computation |
| --- | --- |
| `logical_query` | `pmap.Engine`: transitive closure, proof record IDs, exclusions and actual countermodel witnesses. Supply `premises` and optional `conclusions`; omit conclusions to query every principle. |
| `recompute_central_questions` | `pmap.Lynchpins`: recalculate and rank all remaining questions after saved edits, including transitive consequences. |
| `validate_workspace` | `pmap.validate_topic`: existing schema, reference and logical-consistency checks, with diagnostics. |

Tools default to `scope: work` and the scheduled topic/background. Set `scope: reference` for the original published data. Choose another copied `topic` or `background` preset explicitly; `background: base` means the topic's standing framework. Optional background assumptions remain explicit and are never granted to models that do not establish them. An exclusion is reported separately from non-implication; only an actual countermodel establishes the latter.

Only records marked `proved` enter the engine, just as in the existing map. **In the working copy these are proposed facts, not verified additions.** Reports flag any difference from the published topic and label the computation conditional on workspace proposals. New conjectures are not rules. Invalid or inconsistent YAML produces diagnostics rather than a misleading ranking; the drafts stay saved and the reference remains queryable. The engine implements the map's propositional rules, not unrecorded mathematical substitutions or new proof steps.

Full reports are saved as immutable `derived/<hash>.json` files, with computation time, source revision, input file hashes, changed file paths and installed engine/adapter hashes. Query results include proof record IDs. Tool responses are paginated (`offset`, `limit`) so the agent need not spend context on a whole report. Unchanged inputs reuse a report; edits invalidate it. Checkpoints bind these report files by hash alongside the file-edit provenance. Cite a report as computation evidence, not as independent mathematical or Lean verification.

An operator can invoke the same tools without credentials, network access or an API request:

```sh
python3 scripts/trawl.py --quarantine /path/to/quarantine compute workspace-ID logical_query --premise PRINCIPLE --conclusion PRINCIPLE
python3 scripts/trawl.py --quarantine /path/to/quarantine compute workspace-ID recompute_central_questions --limit 20
python3 scripts/trawl.py --quarantine /path/to/quarantine compute workspace-ID validate_workspace
```

### Passes and budgets

`limits.passes_per_workspace: budget` is the default. When the agent ends a pass after changing mathematical files, the runner recomputes priorities for the scheduled topic/background and starts another pass in that same unfinished workspace. A pass with no further mathematical changes completes and seals it. Notes and reports alone do not trigger another sweep. Set a positive integer instead of `budget` to cap passes explicitly. The agent can also query and rerank as often as useful within a pass; there is no finding-count limit.

Discovery prioritizes broad coverage of easy contributions. Centrality is a starting order, not a reason to spend an entire run on a difficult theorem. The agent is instructed to defer a question well before it would require 64K tokens of reasoning, save supported partial findings and the blocker, and move on. Later passes should not revisit deferred hard work without materially new evidence. Already-derived consequences belong to the Python engine; copying them into redundant records is not a productive sweep.

Each invocation is bounded by:

- `requests_per_run`: total API turns, including failures and resumed work;
- `max_output_tokens`: generation limit per turn;
- `output_tokens_per_run`: generation budget across all turns, workspaces and passes in this invocation;
- `max_prompt_chars`: complete serialized request limit, including tool definitions and conversation, or `model` to use the API's context limit;
- `timeout_seconds`: transport timeout per request.

`trawls_per_question` limits fresh workspaces for a question/profile/context; it does not limit continuation turns or passes. A budget stop leaves the current workspace active for the next run, including a queued next pass. Each explicit `run` supplies a new invocation budget. Conversation history is compacted when necessary; files and progress notes remain available to the active search; immutable API transcripts remain in the audit archive, outside discovery file access. With a numeric character cap, an oversized initial prompt fails before a network call.

`max_prompt_chars: model` removes the character cutoff without estimating tokens from characters. The API enforces its own context capacity; input and generation can share that capacity. If discovery receives an explicit HTTP 400 context-length rejection, it seals that request, compacts the conversation to at most three quarters of its serialized size, and continues with a new request. Rejections count toward the finite request budget and consume no generation allowance. Three consecutive context rejections pause the run. Unrecognized errors still pause immediately. Single-response API reviews report context errors without trimming the evidence or retrying.

Compaction retains recent complete tool exchanges, including provider reasoning blocks, and carries a small activity summary forward. If one exchange is too large, an explicit excerpt of its results is retained with continuation offsets; the agent is not silently reset to empty context. If even a useful excerpt cannot fit, or the same tool evidence is repeatedly compacted without progress, the runner pauses before another paid call. Increase an undersized context limit or inspect the active workspace before resuming. These checks do not limit contributions or ordinary exploration of new evidence.

A discovery response ending with Chat Completions `finish_reason: length` or Messages `stop_reason: max_tokens` is recoverable. The runner records an `output-limit` outcome, charges the reported generation (or the full reservation if usage is missing), and keeps earlier conversation and saved files. It never executes any tool call from the truncated response or feeds its unfinished reasoning back to the agent. The next budgeted turn tells the agent to save a brief blocker note and select a different tractable question. Limits are not increased, and the run's request/output budgets still apply, including after repeated truncations. A saved truncated response can be recovered after interruption without another API call. API review continues to reject truncated answers.

Long thoughts are preserved in full. Every raw API response remains in its immutable trawl record. A length-limited response also gets a readable `unfinished/<trawl-id>.md` containing all exposed reasoning, partial answer and unexecuted tool calls, with actual model identity, timestamps, source revision, usage and a hash/link to the raw response. It is labeled **incomplete and unverified**, never treated as a proof. Workspace checkpoints reference these supplemental artifacts by path and hash. The archive is for explicitly assigned curator review; discovery tools cannot read it, and it is not replayed into later trawls. Keep `unfinished/` when backing up the quarantine repository. Providers that hide or redact thinking cannot supply that hidden text; their raw response is still retained.

The output budget reduces the next request's generation cap to the remaining allowance. Reported generation is charged after each response; missing/invalid usage or a lost response consumes the full reservation. If omitted in an older configuration, the budget defaults to `requests_per_run * max_output_tokens`. This counts provider-reported generation, including reasoning where the provider includes it ([OpenAI token accounting](https://developers.openai.com/api/docs/guides/token-counting), [Messages usage](https://platform.claude.com/docs/en/api/messages/create)). **Input tokens cost extra; this is not a total-token or currency cap.** Provider-reported usage is retained; pricing is not guessed. Requests are reserved before transport. A single-process lock protects quarantine from concurrent runners.

Discovery retries a classified connection failure, including an incomplete HTTP response, at most twice, waiting one then two seconds. Three consecutive transport failures pause the run; a successful response resets that counter. Every retry is a new recorded request within the same request and output budgets. An unknown-usage failure consumes its full output reservation, so retrying cannot replenish the budget; the provider may also charge for a lost reply. HTTP rejections (including authentication, insufficient balance, rate limits and server errors), invalid JSON and other unclassified errors still pause without retry. The separate, explicit context-rejection recovery above is unchanged. API review does not automatically retry a transport failure.

When Python exposes incomplete response bytes, discovery saves them exactly as base64 in the sealed trawl's `partial-response.json`, with model/source/request provenance, byte count and hashes. Checkpoints reference this unverified artifact for curator inspection. Partial responses are never parsed as tool calls, executed, or fed into discovery context; even valid-looking JSON from an incomplete HTTP transfer is rejected. The response-size bound still applies. Bytes already lost inside the transport cannot be reconstructed, and older crashes cannot retroactively recover an unsaved body.

Connection retries retain the previous completed conversation and saved files. On resumption, complete saved responses finish their file edits using receipts without another API call. An interrupted request with no saved response is recorded as having an unknown outcome, and a new turn continues from the previous completed tool results and saved files. Ctrl-C while waiting records an operator interruption, pauses and exits without retrying; resumption remains explicit.

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

For DeepSeek Flash, use `token_parameter: max_tokens` and `parameters: {thinking: {type: enabled}, reasoning_effort: high}`. A generous per-response allowance is `limits.max_output_tokens: 65536`: this includes thinking and the answer/tool calls, so 8K can be exhausted before any file write. `limits.max_prompt_chars: model` lets its advertised 1M-token context fill without a smaller local character cutoff. Context capacity, reasoning effort and generation allowance are separate controls; a larger allowance does not force the model to consume it. Keep finite `requests_per_run` and `output_tokens_per_run` limits. Check the current [DeepSeek model limits](https://api-docs.deepseek.com/quick_start/pricing/) and [request parameters](https://api-docs.deepseek.com/api/create-chat-completion/) when choosing a different model.

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
