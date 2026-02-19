ifneq ($(shell which mold 2> /dev/null),)
        LDFLAGS += -fuse-ld=mold
        LD := mold
endif

ifneq ($(shell which clang 2> /dev/null),)
	CC := clang
else
        ifneq ($(shell which gcc 2> /dev/null),)
                CC := gcc
	else
	$(error GCC & Clang not available.)
        endif
endif
