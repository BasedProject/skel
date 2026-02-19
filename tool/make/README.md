# GNUmakefile

This is meant to be a well isolated GNU Makefile.

By defualt, we'll attempt to compile all .c files in source/ into object/

include/ serves as the place for remote/all headers.


* 01-compiler.mk
Optional. Optional. Selects Clang by default, defaulting to GCC otherwise.

Specifies to use the Mold linker if possible.

* 01-depend.mk
Optional. Creates Makefile dependencies in object. Only useful after first compilation.

* 01-object.mk
Critical. Compiles code into objects.
Provides TARGET recipe.

* 01-pch.mk
Optional. Creates PCH/GCH for respective compilers.

* 02-debug.mk
Important. Debugging / Optimization flags for a respective compiler. Attempts to vectorize.

- Provides DEBUG=1 for debugging. When not present, provides -DNDEBUG.
- Provides VECTORIZE=1 for displaying vectorized code, and VECTORIZE_ALL=1 for all vectorization information.
- provides SANITIZE=1 for fsan.

Note that GCC is much better about vectorization - and debugging information in that regard, and is recommended over clang for that need.

* 02-gperf.mk
Optional. Attempts to automatically compile gperf files.

* 02-hardened.mk
Optional. Provides Hardening flags for Release builds.

* 99-all.mk
all/run recipe.

* 99-clean.mk
clean recipe.
WIPES. REMOVES ${OBJECT.dir}/* AND ${TARGET}, nonrecursively.
