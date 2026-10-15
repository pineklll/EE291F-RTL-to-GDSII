PROJECT:=mmForMLP

BUILD_DIR:=build

SCRIPT_DIR:=script
TCL_FILES:=$(shell find ${SCRIPT_DIR} -type f -name '*.tcl' -print | sort)
TCLSH:=tclsh

TECH_SRC:=/mnt/sharefile/EE291F/3003/tech.lab
TECH_DIR:=tech

RUN_STAMP:=$(shell date +%Y%m%d-%H%M%S)

GIT_COMMIT:=$(shell git log -1 --pretty=tformat:"%H" 2>/dev/null)

RUN_COMMAND:=make $(MAKECMDGOALS) $(MAKEOVERRIDES)

.PHONY: init tcl-check clean

# Project initialization
init:
	ln -sfn ${TECH_SRC} ${TECH_DIR}

# Tcl check
tcl-check:
	${TCLSH} ${SCRIPT_DIR}/check.tcl ${TCL_FILES}

# Build clean
clean:
	rm -r -v -I ${BUILD_DIR}

# Build mkdir
${BUILD_DIR}:
	mkdir -p $@

# Include flow makefiles
include tool-genus.mk
include tool-dc.mk
include tool-formal.mk
