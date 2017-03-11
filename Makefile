# This file is part of the migrate-parsetree package. It is released under the
# terms of the LGPL 2.1 license (see LICENSE file).
# Copyright 2017  Frédéric Bour
#           2017  Jérémie Dimino

INSTALL_ARGS := $(if $(PREFIX),--prefix $(PREFIX),)

.PHONY: all
all:
	jbuilder build @install

.PHONY: install
install:
	jbuilder install $(INSTALL_ARGS)

.PHONY: uninstall
uninstall:
	jbuilder uninstall $(INSTALL_ARGS)

.PHONY: reinstall
reinstall: uninstall reinstall

.PHONY: test
test:
	jbuilder runtest

.PHONY: all-supported-ocaml-versions
all-supported-ocaml-versions:
	jbuilder runtest --workspace jbuild-workspace.dev

.PHONY: cinaps
cinaps:
	cinaps -styler ocp-indent -i src/migrate_parsetree_versions.ml*
	cinaps -styler ocp-indent -i src/migrate_parsetree_40?_40?.ml*

.PHONY: clean
clean:
	rm -rf _build *.install
	find . -name .merlin -delete
