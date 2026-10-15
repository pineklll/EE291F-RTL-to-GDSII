# ---------------------------------------------------------------- #
# Makefile for dc

# DC script
DC_SCRIPT:=${SCRIPT_DIR}/dc
DC_MAIN:=${DC_SCRIPT}/dc.tcl

# DC build
DC_BUILD:=${BUILD_DIR}/dc
DC_CMD:=${DC_BUILD}/${RUN_STAMP}-dc.cmd
DC_LOG:=${DC_BUILD}/${RUN_STAMP}-dc.log
DC_COMMIT:=${DC_BUILD}/${RUN_STAMP}-git-commit.txt

# DC command
DC:=dc_shell

# Declare phony tasks
.PHONY: dc dc-elaborate dc-compile dc-final dc-shell dc-clean

# DC shell
dc-shell: | ${DC_BUILD}
	echo "${GIT_COMMIT}" >> $(abspath ${DC_COMMIT})
	echo "${RUN_COMMAND}" >> $(abspath ${DC_COMMIT})
	cd ${DC_BUILD} && \
		${DC} -x "\
			set_app_var sh_command_log_file {$(abspath ${DC_CMD})}; \
			set_app_var sh_output_log_file  {$(abspath ${DC_LOG})}"

# DC run
dc: | ${DC_BUILD}
	echo "${GIT_COMMIT}" >> $(abspath ${DC_COMMIT})
	echo "${RUN_COMMAND}" >> $(abspath ${DC_COMMIT})
	cd ${DC_BUILD} && \
		${DC} -x "\
			set_app_var sh_command_log_file {$(abspath ${DC_CMD})}; \
			set_app_var sh_output_log_file  {$(abspath ${DC_LOG})}" \
		-f $(abspath ${DC_MAIN}) < /dev/null

# DC stage run
dc-elaborate:
	$(MAKE) dc DC_MAIN=${DC_SCRIPT}/01_elaborate.tcl

dc-compile:
	$(MAKE) dc DC_MAIN=${DC_SCRIPT}/02_compile.tcl

dc-final:
	$(MAKE) dc DC_MAIN=${DC_SCRIPT}/03_final.tcl

# DC clean
dc-clean:
	rm -r -v -I ${DC_BUILD}

# DC mkdir
${DC_BUILD}: | ${BUILD_DIR}
	mkdir -p $@
