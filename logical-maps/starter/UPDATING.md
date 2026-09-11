# Updating a map

The version of this starter is recorded in VERSION. Keep an untouched download
or a Git commit before editing. This first release has no required migration.

When a newer starter is available:

1. Back up your project and extract the new ZIP into a different folder.
2. Read its release notes and compare VERSION.
3. Copy the new `scripts/`, `schema/`, `viewer/`, `starter/`, `requirements.txt`,
   and VERSION into your working project. Review and merge any custom changes
   you made to those files. Keep the tooling's licence notice.
4. Keep your `topics/` folder. Do not replace it with the new blank/example topics.
   Compare updated README.md, DATA_FORMAT.md, AGENTS.md, and CLAUDE.md with your
   own instructions before merging them.
5. Install requirements again, validate, run selftest, and rebuild:

```sh
python -m pip install -r requirements.txt
python scripts/pmap.py validate
python scripts/pmap.py selftest
python scripts/pmap.py build --no-pdf
```

Inspect the local website and downloads before uploading the rebuilt topic
folder. Schema changes should be described in a future release's migration notes;
do not discard records simply to make a new validator pass.

`python scripts/pmap.py starter` regenerates `build/logical-maps-starter.zip`
from the curated `starter/` templates and current tooling. Normal builds also
copy this ZIP beside each map and link it from Contribute. This relative download
can also be linked from a future home page without changing the starter format.
Use `build --no-starter --no-pdf` when only the map itself needs rebuilding.
