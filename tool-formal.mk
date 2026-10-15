# ---------------------------------------------------------------- #
# Makefile for formal

# Formal script
FORMAL_SCRIPT:=${SCRIPT_DIR}/formal
FORMAL_MAIN:=${FORMAL_SCRIPT}/formal.tcl

# Formal build
FORMAL_BUILD:=${BUILD_DIR}/formal
FORMAL_CMD:=${FORMAL_BUILD}/${RUN_STAMP}-formal.cmd
FORMAL_LOG:=${FORMAL_BUILD}/${RUN_STAMP}-formal.log
FORMAL_COMMIT:=${FORMAL_BUILD}/${RUN_STAMP}-git-commit.txt

# Formal command
FORMAL:=fm_shell

# Declare phony tasks
.PHONY: formal formal-clean

# Formal run
formal: | ${FORMAL_BUILD}
	echo "${GIT_COMMIT}" >> $(abspath ${FORMAL_COMMIT})
	echo "${RUN_COMMAND}" >> $(abspath ${FORMAL_COMMIT})
	cd ${FORMAL_BUILD} && \
		${FORMAL} -x "set_app_var sh_command_log_file {$(abspath ${FORMAL_CMD})}" \
		-file $(abspath ${FORMAL_MAIN}) 2>&1 | tee $(abspath ${FORMAL_LOG})

# Formal clean
formal-clean:
	rm -r -v -I ${FORMAL_BUILD}

# Formal mkdir
${FORMAL_BUILD}: | ${BUILD_DIR}
	mkdir -p $@
