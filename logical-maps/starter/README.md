# Create your own Logical Map

This starter contains a blank map, a small worked example, and the same interactive
viewer used by Logical Maps. Edit ordinary YAML and Markdown files to describe
your principles, implications, conjectures, and models. The build produces a
static website with light/dark mode, graph search, and a theory explorer.

## Look first

Open `build/example/index.html` in your browser to explore the worked example.
Open `build/my-map/index.html` for the blank map. These previews work without
installing anything. The example's background page explains the records.

## Set up editing

Install Python 3.10 or newer. Open a terminal in the extracted
`logical-maps-starter` folder. On macOS or Linux:

```sh
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
```

On Windows PowerShell:

```powershell
py -3 -m venv .venv
.\.venv\Scripts\python.exe -m pip install -r requirements.txt
```

The commands below use `python` in the activated environment. In PowerShell,
use `.\.venv\Scripts\python.exe` instead. Lean, Node, Pandoc, and a database
server are not needed to edit or publish a map. Pandoc and XeLaTeX can optionally
produce PDF write-ups; use `--no-pdf` for the standard workflow.

## Make your first map

1. Edit `topics/my-map/topic.yaml`: give your map a title, description, and a
   precise framework. Keep `id: my-map` while using that folder name.
2. Write the introductory material in `topics/my-map/background.md` and replace
   `contribute.md` with your own contact or contribution instructions.
3. Create records using the commands below, then fill in their YAML files.
   [DATA_FORMAT.md](DATA_FORMAT.md) explains the fields; `topics/example/`
   contains complete examples. A second topic can be created with
   `python scripts/pmap.py new-topic another-map`.

```sh
python scripts/pmap.py new-principle my-map principle-a
python scripts/pmap.py new-principle my-map principle-b
python scripts/pmap.py new-result my-map a-implies-b --source misc
python scripts/pmap.py new-model my-map proposed-model --source misc
```

New results and models start as `conjectured`. Complete all required fields,
including sources, before validation. Promote a result to `proved` only when
you supply its proof; promote a model only after verifying its listed properties.
Validation checks structure and recorded consistency, not the truth of prose proofs.

```sh
python scripts/pmap.py validate my-map
python scripts/pmap.py build my-map --no-pdf
python -m http.server 8000 --directory build
```

Then visit <http://localhost:8000/my-map/>. Stop the server with Ctrl+C.
You can also open the generated HTML directly. Rebuild and refresh after edits.
Validation should fail while newly created records still contain placeholders;
the untouched blank map and supplied example already pass.

## Working with a coding agent

Open this folder in your agent's workspace and ask, for example:

> Read AGENTS.md and README.md. Build my map in topics/my-map. First help me
> state the framework precisely. Add only the principles and sources I provide;
> keep unsupported results conjectured. Validate and rebuild after each batch.

Review mathematical claims and references yourself. Agent instructions require
accurate attribution, stable IDs, and a strict distinction between proofs,
conjectures, incompatibilities, and countermodels.

## Check and publish

```sh
python scripts/pmap.py validate
python scripts/pmap.py selftest
python topics/example/checks/relations.py
python scripts/pmap.py build my-map --no-pdf
```

Upload **the whole `build/my-map/` folder** to a directory on your static website.
Its `index.html`, write-ups, sources, and download ZIPs use relative links.
No backend is required. Check the uploaded graph and download links.
Only that topic folder needs publishing; the example can remain local.

Everything in your topic's `sources/` folder is copied into public builds and
downloads. Keep private notes and documents outside `topics/`. Add only documents
you intend and have permission to distribute.

## Files and updates

| Path | Purpose |
| --- | --- |
| `topics/my-map/` | Your editable content |
| `topics/example/` | A small demonstration using binary relations |
| `schema/` | Machine-readable record formats |
| `viewer/` | Shared HTML, styles, and browser logic |
| `scripts/` | Scaffolding, validation, build, and packaging tools |
| `build/` | Generated websites and downloadable working copies |
| `starter/` | Pristine templates used to regenerate the starter download |
| `VERSION` | Starter release version |

See [UPDATING.md](UPDATING.md) for updating the tools while retaining your data.
The **Content bundle** download on a built map contains that map and its tools;
**Topic sources** contains the editable topic folder. A Contribute link offers
the reusable starter, generated from `starter/`, not your topic content.

## Reuse

The supplied starter code, documentation, and elementary example are available
under the [MIT licence](LICENSE). Keep its notice with reused tooling. That
licence does not grant rights to papers or other materials you later add; choose
and document the terms for your own topic content separately.
