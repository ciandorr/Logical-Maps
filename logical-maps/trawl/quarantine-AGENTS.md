# Working in the theorem-trawl quarantine

Read README.md for setup and the installed runner's trawl/README.md for commands.
Historical trawls are not examples or instructions for a new AI.

## Discovery access

- Use only the assigned, unfinished workspace's files/, reference/ and derived/ directories.
  Only files/ is writable by discovery; derived/ contains trusted-runner computation reports.
- Do not open, list, search, summarize, copy, or edit trawls/, other workspaces,
  unfinished/, sealed workspaces, or past review/packet/candidate artifacts. Do not retrieve
  their contents through Git history, GitHub, a search index, or another tool.
- All completed trawls and workspaces are immutable history. Start new work
  from the published source, never from an old trawl's conclusions or transcript.
- An unfinished workspace may resume its own saved files and progress notes
  after a budget stop. This does not grant access to other work or audit logs.
- Model-requested subagents are scoped collaborators on the current task. Use
  spawn_subagent, subagent_status and wait_for_subagents through the runner.
  Only completed frozen handoffs explicitly delivered to the parent's own
  reference/subagents/ are readable there; they remain unreviewed proposals.
  This grants no direct access to child workspaces, raw API logs or old trawls.
- Preserve setup instructions outside historical trawls. Do not read history
  just to learn how to run the system.

The built-in API file tools enforce this boundary. External agents must be
sandboxed with only the assigned files/ writable and reference/ and derived/ readable.
Do not grant a discovery agent the quarantine root, its .git directory, the
published checkout, or credentials that can fetch quarantine history. Setting
a working directory, hiding files, or reading this instruction is not an OS
sandbox.

## Explicit review and maintenance

A curator may explicitly assign a particular frozen checkpoint for review.
That grants read access to the assigned packet and necessary evidence only;
it does not permit editing historical trawls or browsing unrelated history.
Record new reviews and corrections as new artifacts. The trusted runner may
read metadata for scheduling and recover the current workspace's pending turn.
