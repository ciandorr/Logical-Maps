PY ?= python3
.PHONY: validate build checks starter
validate:
	$(PY) scripts/pmap.py validate
build:
	$(PY) scripts/pmap.py build
checks:
	$(PY) scripts/pmap.py selftest
	$(PY) topics/example/checks/relations.py
starter:
	$(PY) scripts/pmap.py starter
