# ---------------------------------------------------------------- #
# Makefile for genus

# Genus script
GENUS_SCRIPT:=${SCRIPT_DIR}/genus
GENUS_MAIN:=${GENUS_SCRIPT}/genus.tcl

# Genus build
GENUS_BUILD:=${BUILD_DIR}/genus
GENUS_CMD:=${GENUS_BUILD}/${RUN_STAMP}-genus.cmd
GENUS_LOG:=${GENUS_BUILD}/${RUN_STAMP}-genus.log
GENUS_COMMIT:=${GENUS_BUILD}/${RUN_STAMP}-git-commit.txt

# Genus command
GENUS:=genus

# Declare phony tasks
.PHONY: genus genus-elaborate genus-generic genus-map genus-opt genus-final genus-shell genus-clean

# Genus shell
genus-shell: | ${GENUS_BUILD}
	echo "${GIT_COMMIT}" >> $(abspath ${GENUS_COMMIT})
	echo "${RUN_COMMAND}" >> $(abspath ${GENUS_COMMIT})
	cd ${GENUS_BUILD} && \
		${GENUS} -log "$(abspath ${GENUS_LOG}) $(abspath ${GENUS_CMD})"

# Genus run
genus: | ${GENUS_BUILD}
	echo "${GIT_COMMIT}" >> $(abspath ${GENUS_COMMIT})
	echo "${RUN_COMMAND}" >> $(abspath ${GENUS_COMMIT})
	cd ${GENUS_BUILD} && \
		${GENUS} -batch \
		-log "$(abspath ${GENUS_LOG}) $(abspath ${GENUS_CMD})" \
		-files $(abspath ${GENUS_MAIN})

# Genus stage run
genus-elaborate:
	$(MAKE) genus GENUS_MAIN=${GENUS_SCRIPT}/01_elaborate.tcl

genus-generic:
	$(MAKE) genus GENUS_MAIN=${GENUS_SCRIPT}/02_generic.tcl

genus-map:
	$(MAKE) genus GENUS_MAIN=${GENUS_SCRIPT}/03_map.tcl

genus-opt:
	$(MAKE) genus GENUS_MAIN=${GENUS_SCRIPT}/04_opt.tcl

genus-final:
	$(MAKE) genus GENUS_MAIN=${GENUS_SCRIPT}/05_final.tcl

# Genus clean
genus-clean:
	rm -r -v -I ${GENUS_BUILD}

# Genus mkdir
${GENUS_BUILD}: | ${BUILD_DIR}
	mkdir -p $@

