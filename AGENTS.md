# Working in Logical Maps

Read `README.md` and `logical-maps/CLAUDE.md` before editing the project.
Run project commands from `logical-maps/`.

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
