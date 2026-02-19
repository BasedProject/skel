CFLAGS += -MMD -MP
DEPEND := $(wildcard ${OBJECT.dir}/*.d)
-include ${DEPEND}
