DEBUG      ?= 0
SANITIZE   ?= 0
VECTORIZED ?= 0

ifeq (${DEBUG},1)
        CFLAGS += -O2 -flto=thin -ggdb -pg -fno-inline -Wall -Wextra -Wpedantic -Wshadow -Wundef -fno-omit-frame-pointer
else
        CFLAGS   += -O2 -flto=auto -ftree-vectorize -march=x86-64 -mtune=generic
        CPPFLAGS += -DNDEBUG
endif

ifeq (${SANITIZE},1)
        ifeq (${CC},clang)
                CFLAGS += -fvisibility=hidden -fsanitize=address,leak,undefined,bounds,cfi
        else
                CFLAGS += -fsanitize=address,leak,undefined
        endif
endif

ifeq (${VECTORIZED},1)
        ifeq (${CC},clang)
                CFLAGS += -Rpass=loop-vectorize
        else
                CFLAGS += -fopt-info-vec-optimized
        endif
endif

ifeq (${VECTORIZED_ALL},1)
        ifeq (${CC},clang)
          CFLAGS += -Rpass=loop-vectorize -Rpass-missed=loop-vectorize
        else
          CFLAGS += -fopt-info-vec-all
        endif
endif
