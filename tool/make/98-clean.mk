HELP_ME += \
"98-clean.mk\n" \
"Provides nonrecursive cleaning of object via recipe of clean.\n" \
"Not intended as omniscient reset magic bullet. Just prune potentially bad objects.\n" \
"We only care about objects and only use objects from the toplevel of OBJECT.dir, not deeper.\n" \
"\n"

.PHONY: clean
clean:
	-${RM} ${OBJECT.dir}/* ${TARGET}
