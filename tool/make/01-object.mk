SOURCE.orig := $(wildcard ${SOURCE.dir}/*.c)
SOURCE.orig := $(SOURCE.orig:${SOURCE.dir}/%=%)
OBJECT.orig := $(addprefix ${OBJECT.dir}/, ${SOURCE.orig:.c=.o})

CPPFLAGS += -I${OBJECT.dir}

vpath %.c ${SOURCE.dir}

${OBJECT.dir}/%.o: %.c
	@echo "CC	$<"
	@${COMPILE.c} -o $@ $<

${TARGET}: ${OBJECT.orig}
	@echo "LD	$@"
	@${LINK.c} -o "$@" $+ ${LDFLAGS}
