SOURCE.orig := $(wildcard ${SOURCE.dir}/*.c ${SOURCE.dir}/*.cpp ${SOURCE.dir}/*.c++ ${SOURCE.dir}/*.C)
SOURCE.orig := $(SOURCE.orig:${SOURCE.dir}/%=%)
SOURCE.orig := ${SOURCE.orig:.c=.o}
SOURCE.orig := ${SOURCE.orig:.cpp=.o}
SOURCE.orig := ${SOURCE.orig:.c++=.o}
SOURCE.orig := ${SOURCE.orig:.C=.o}
OBJECT.orig := $(addprefix ${OBJECT.dir}/, ${SOURCE.orig})

CPPFLAGS += -I${OBJECT.dir}

vpath %.c ${SOURCE.dir}
vpath %.cpp ${SOURCE.dir}
vpath %.c++ ${SOURCE.dir}
vpath %.C ${SOURCE.dir}

${TARGET}: ${OBJECT.orig}
	@echo "LD	$@"
	@${LINK.c} -o "$@" $+ ${LDFLAGS}

${OBJECT.dir}/%.o: %.c
	@echo "CC	$<"
	@${COMPILE.c} -o $@ $<

# C++

${OBJECT.dir}/%.o: %.cpp
	@echo "C++	$<"
	@${COMPILE.cpp} -o $@ $<

${OBJECT.dir}/%.o: %.c++
	@echo "C++	$<"
	@${COMPILE.cpp} -o $@ $<

${OBJECT.dir}/%.o: %.C
	@echo "C++	$<"
	@${COMPILE.cpp} -o $@ $<
