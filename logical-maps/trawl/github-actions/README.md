# Run the trawler on GitHub Actions

The terminal command runs the coordinator, files and Python inference tools on
your machine. DeepSeek runs the model remotely. Pushing the quarantine repository
to GitHub stores its files; it does not start cloud computation.

This manual workflow runs the same coordinator on a GitHub-hosted Linux machine.
The discovery agent decides when to delegate through `spawn_subagent`. Each child
gets its own quarantine workspace, and all agents share the invocation's request
and output budgets. There is no worker-count input to set.

## One-time setup

1. Commit and push the new runner, including this directory and its delegation
   implementation, to `zwlgzwlg/Logical-Maps`. The workflow downloads the
   **published** runner revision; uncommitted local fixes cannot run in the cloud.
2. Stop the local trawler with one Ctrl-C and let its outstanding responses save.
   Commit and push its saved quarantine work. The local lock cannot coordinate
   separate machines, so use one location for discovery at a time.
3. Copy these two files into the separate quarantine repository. From
   `Logical-Maps/logical-maps/`:

   ```sh
   mkdir -p ../../Logical-Maps-Quarantine/.github/workflows
   mkdir -p ../../Logical-Maps-Quarantine/trawl
   cp trawl/github-actions/quarantine-trawl.yml ../../Logical-Maps-Quarantine/.github/workflows/trawl.yml
   cp trawl/github-actions/deepseek.yaml ../../Logical-Maps-Quarantine/trawl/deepseek.yaml
   ```

   Commit and push those files in **Logical-Maps-Quarantine**, on its default
   branch. The tracked YAML selects Classicism, DeepSeek Flash, high thinking
   effort, full model context, 1,000 requests and 8 million output tokens across
   the entire invocation. The runner enforces its internal concurrency ceiling;
   the agent chooses how much to delegate. These are output/request limits, not
   dollar limits, and inputs also consume your DeepSeek balance.
4. In the quarantine repository on GitHub, open **Settings → Secrets and
   variables → Actions → New repository secret**. Name it `DEEPSEEK_API_KEY`
   and paste the key as its value, without quotes. The workflow passes it only
   to discovery through an environment variable. Do not put it in the YAML.
   GitHub documents this [repository-secret setup](https://docs.github.com/en/actions/how-tos/write-workflows/choose-what-workflows-do/use-secrets).
5. The workflow requests `contents: write` for its repository's `GITHUB_TOKEN`.
   Repository or organization policy and branch protection must allow the
   workflow to push quarantine results. This token is scoped to the quarantine
   repository; it does not grant write access to Logical Maps. See GitHub's
   [workflow permissions](https://docs.github.com/en/actions/reference/workflows-and-actions/workflow-syntax#permissions).

The workflow must be on the default branch before GitHub offers its manual Run
workflow button. Open **Actions → Theorem trawl → Run workflow**. Leave the branch
at the default branch. `runner_ref` is the published Logical-Maps branch, tag or
commit to execute; use an exact commit when you want a fixed implementation.
GitHub documents [manual workflows](https://docs.github.com/en/actions/how-tos/manage-workflow-runs/manually-run-a-workflow).

Once the run has started on GitHub, your laptop and VS Code can disconnect.
The workflow has no schedule or automatic restart; another manual run resumes
the unfinished work from the latest pushed quarantine files with a fresh budget.

## Runtime and saved work

`minutes` defaults to 300 and accepts 1–300. The wrapper sends SIGINT when that
time expires, stops further discovery dispatch, and allows up to 15 minutes for
outstanding API responses to be saved. A stuck process is then killed so backup
steps can run. GitHub-hosted jobs have a [six-hour limit](https://docs.github.com/en/actions/reference/limits);
the workflow reserves the remaining time for setup and preservation. Earlier
request/output limits, API failures or completion can end discovery sooner.

The workflow serializes cloud runs using one
[concurrency group](https://docs.github.com/en/actions/how-tos/write-workflows/choose-when-workflows-run/control-workflow-concurrency)
with `cancel-in-progress: false`. This covers cloud invocations only. Do not
simultaneously resume the same quarantine files from a local machine.

After discovery, including a failed run, the workflow:

1. Creates and uploads a `theorem-trawl-RUNID-ATTEMPT` recovery artifact.
2. Commits the saved work and pushes to the quarantine branch used for the run.

Both preservation paths include `quarantine.json`, `workspaces/`, `trawls/`,
`unfinished/`, `candidates/`, `packets/`, `reviews/`, `admissions/`,
`publications/`, and `cloud-runs/`. Delegations and their handoffs live inside
workspaces and survive with them. Config credentials, `.git`, `.env`, and cache
directories at the quarantine root are excluded. The runner is installed
outside the quarantine checkout, under `RUNNER_TEMP`.

`cloud-runs/` records the GitHub run identity, timestamps, configuration hash,
runner commit and exit status. Existing per-request model identity, source
revision, reasoning archives and edit receipts retain their ordinary provenance.
Discovery never admits proposals to the main database.

The recovery upload lasts 30 days, subject to repository retention policy.
Download it from the run's **Artifacts** section, following GitHub's
[artifact instructions](https://docs.github.com/en/actions/tutorials/store-and-share-data).
The ZIP contains `trawl-backup.tar.gz`. Extract that tarball into a separate
directory, inspect the saved state, and merge it into a stopped quarantine
checkout before resuming. Avoid overwriting newer local work blindly.

A rejected push leaves the artifact available; the workflow never force-pushes
or resolves competing edits by overwriting them. When GitHub abruptly cancels a
job, loses its runner, or stops it at the hard job limit, `always()` cannot
guarantee subsequent backup steps will finish. Prefer the planned runtime stop
to the Actions Cancel button. Unsaved in-flight replies may be lost after the
15-minute drain deadline; previously saved files and pending request journals
remain recoverable if preservation runs.

## Maintenance and local checks

The three official actions are pinned to immutable release commits:
`actions/checkout` v4.2.2, `actions/setup-python` v5.6.0 and
`actions/upload-artifact` v4.6.2. These established versions support the required
checkout, Python installation and artifact operations without depending on a
moving major tag. Their hashes were verified against the official repositories.
Update the hashes deliberately when adopting newer releases.

`run_bounded.py` and `backup.py` come from the selected trusted runner revision;
they are not copied into discovery workspaces. No model-written program is
executed. The workflow copies tracked `trawl/deepseek.yaml` to ignored
`config.local.yaml` on its ephemeral checkout after validation. Local terminal
configuration and secrets are not read by GitHub.

Run the deadline, archive and local Git-push checks without network or API use:

```sh
python3 trawl/github-actions/check_cloud.py
```
