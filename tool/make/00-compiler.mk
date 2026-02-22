ifeq (${LD},ld)
        ifneq ($(shell which mold 2> /dev/null),)
                LDFLAGS += -fuse-ld=mold
                LD := mold
        endif
endif

# If CC is set, we'll assume the respective compiler collection.

ifeq (${CC},cc)
        ifneq ($(shell which clang 2> /dev/null),)
                CC  := clang
                CXX := clang++
        else
                ifneq ($(shell which gcc 2> /dev/null),)
                        CC := gcc
                        CC := g++
                else
                $(error GCC & Clang not available.)
                endif
        endif
else
        ifeq (${CC},gcc)
                CXX := g++
        endif
        ifeq (${CC},clang)
                CXX := clang++
        endif
endif
