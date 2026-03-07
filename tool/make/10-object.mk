HELP_ME += \
"10-object.mk\n" \
"Critical makefile that provides all building and source location for C/C++.\n" \
"Provides SOURCE.orig.cxx, SOURCE.orig.c, SOURCE.orig\n" \
"Includes OBJECT.dir in CPPFLAGS\n" \
"\n"

SOURCE.orig.cxx := $(wildcard ${SOURCE.dir}/*.cpp ${SOURCE.dir}/*.c++ ${SOURCE.dir}/*.C)
SOURCE.orig.c   := $(wildcard ${SOURCE.dir}/*.c)
SOURCE.orig := $(SOURCE.orig.c) $(SOURCE.orig.cxx)
SOURCE.orig := $(SOURCE.orig:${SOURCE.dir}/%=%)
SOURCE.orig := ${SOURCE.orig:.c=.o}
SOURCE.orig := ${SOURCE.orig:.cpp=.o}
SOURCE.orig := ${SOURCE.orig:.c++=.o}
SOURCE.orig := ${SOURCE.orig:.C=.o}
OBJECT.orig += $(addprefix ${OBJECT.dir}/, ${SOURCE.orig})

CPPFLAGS += -I${OBJECT.dir}

vpath %.c ${SOURCE.dir}
vpath %.cpp ${SOURCE.dir}
vpath %.c++ ${SOURCE.dir}
vpath %.C ${SOURCE.dir}

# this file / 99-all.mk is designed for a single target executable object, not library generation.
# Therefore, we'll call linkage exactly once and I can avoid touching Bourne Shell.
${TARGET}: ${OBJECT.orig}
	$(call quiet_echo,LD	$<)
ifeq (${SOURCE.orig.cxx},)
	${QUIET}${LINK.c} -o "$@" $+
else
	${QUIET}${LINK.cpp} -o "$@" $+
endif

${OBJECT.dir}/%.o: %.c
	$(call quiet_echo,CC	$<)
	${QUIET}${COMPILE.c} -o $@ $<

# C++

${OBJECT.dir}/%.o: %.cpp %.c++ %.C
ifeq (VERBOSE,0)
	$(call quiet_echo,CPP	$<)
endif
	${QUIET}${COMPILE.cpp} -o $@ $<
