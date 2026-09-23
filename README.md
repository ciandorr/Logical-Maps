# Logical Maps

Interactive maps of principles, implications, conjectures, and countermodels.

- [Browse the maps](https://zacharygoodsell.com/logical-maps/)
- [Unbounded Utility](https://zacharygoodsell.com/logical-maps/unbounded-utility/)
- [Project documentation](logical-maps/README.md)
- [Create your own map](logical-maps/starter/README.md)
- [Reusable starter download](logical-maps/build/logical-maps-starter.zip)

The application, topic records, and build tools are in `logical-maps/`.
The `logical-maps/build/` directory contains the static website and downloads;
it is committed because the personal website imports these exports.

## Build and check

```sh
cd logical-maps
python3 -m venv .venv
source .venv/bin/activate
python3 -m pip install -r requirements.txt
python3 scripts/pmap.py validate
python3 scripts/pmap.py selftest
python3 scripts/pmap.py build
python3 scripts/check_public.py
python3 -m http.server 8000 --directory build
```

Open <http://localhost:8000/> to preview. Pandoc is optional; see the project
documentation for Lean checks.
Formalization is incomplete; individual certificates record verification status.

## Contributing

See the map's Contribute tab and [the editing rules](logical-maps/CLAUDE.md).
Preserve mathematical statements and attribution when changing presentation.
For suggestions, email zacharyw.goodsell@gmail.com with `[Logical Maps]` in the
subject line.

## Private work

Private drafts belong in the ignored `.private/` directory at this repository's
root, outside the build inputs. It can hold a separate private Git repository;
it is not included when cloning this repository. Commit and push private work
from that directory. Files elsewhere in this repository are intended for sharing.

## Licensing

The reusable starter is supplied under its [MIT licence](logical-maps/starter/LICENSE).
That licence does not grant rights to the research papers or apply a new licence
to the entire research collection. Source papers retain their own terms; the
[literature catalogue](logical-maps/topics/unbounded-utility/papers.yaml) links to
papers that are not included in the downloads.
