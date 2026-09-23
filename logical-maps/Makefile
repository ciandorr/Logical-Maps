PY ?= python3
.PHONY: all validate build bundle status selftest checks clean
all: validate build
validate: ; $(PY) scripts/pmap.py validate
build: ; $(PY) scripts/pmap.py build
bundle: ; $(PY) scripts/pmap.py bundle
status: ; $(PY) scripts/pmap.py status
selftest: ; $(PY) scripts/pmap.py selftest
checks: ; $(PY) topics/decision-theory/checks/countermodels.py
clean: ; rm -rf build
