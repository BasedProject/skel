HELP_ME += \
"11-gperf.mk\n" \
"Automatic gperf support.\n" \
"Chains in GPERF.orig.\n" \
"Provides GPERF configurable for overrides.\n" \
"\n"

vpath %.gperf ${SOURCE.dir}

GPERF      ?= gperf
GPERF.orig := $(wildcard ${SOURCE.dir}/*.gperf)
GPERF.orig := $(GPERF.orig:${SOURCE.dir}/%.gperf=${OBJECT.dir}/%.h)
ALSO       += ${GPERF.orig}

${OBJECT.dir}/%.h: %.gperf
	$(call quiet_echo,GPERF	$<)
	${QUIET}${GPERF} --null-strings -tEIH $(shell basename $(basename $<))_hash -N $(shell basename $(basename $<))_lookup < $< > $@
