HEADER.pch.filter ?=
HEADER.orig     := $(filter-out ${HEADER.pch.filter},$(wildcard ${SOURCE.dir}/*.h ${OBJECT.dir}/*.h))
HEADER.orig     := $(HEADER.orig:${SOURCE.dir}/%=%)
HEADER.orig     := $(HEADER.orig:${OBJECT.dir}/%=%)

HEADER.pch := $(addprefix ${OBJECT.dir}/, ${HEADER.orig:.c=})
ALSO       += ${HEADER.pch}

ifeq (${CC},gcc)
        HEADER.pch := $(addsuffix .gch,${HEADER.pch})
else
        HEADER.pch := $(addsuffix .pch,${HEADER.pch})
endif

vpath %.h ${SOURCE.dir} ${OBJECT.dir}

${OBJECT.dir}/%.h.pch: %.h
	@echo "PCH	$<"
	@${COMPILE.c} ${PCHFLAGS} -x c-header -o $@ $<

${OBJECT.dir}/%.h.gch: %.h
	@echo "GCH	$<"
	@${COMPILE.c} ${PCHFLAGS} -x c-header -o $@ $<
