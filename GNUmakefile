#!/usr/bin/make -f
.SUFFIXES:

TARGET := $(shell basename $$PWD).out

## make.mk
# commented assignments are overrides and are otherwise reasonable defaults.

CFLAGS   := -std=c23 -O2 -pthread
CXXFLAGS := -std=c++20 -O2 -pthread
CPPFLAGS := -D_GNU_SOURCE
LDFLAGS  := -lm

SOURCE.dir := source
OBJECT.dir := object

MAKE.dir := tool/make
MAKE.filter := 11-lib.mk 03-peru.mk

## 00-compiler.mk

# Externally overridable with CC=.. CXX=..
PREFER_GCC := 0

## 00-verbose.mk

# Megabroken, define here only if you want the `1' behavior,
# or inline or on command line.
# VERBOSE := 1

## 01-debug.mk

DEBUG          ?= 0
SANITIZE       ?= 0
VECTORIZED_ALL ?= 0
VECTORIZED     ?= 0
DO_LTO         ?= 1 		# always nulled if library

## 03-peru.mk

PERU_MUST_WORK := 0             # make peru nonoptional

## 11-lib.mk

NOT_APART_OF_LIBRARY :=
#LIBTARGET :=

## 11-bison.mk

LFLAGS += --debug --trace
YFLAGS += --debug

## 11-gperf.mk

#GPERF := gperf
#GPERF.orig :=

## 11-pch.mk

HEADER.pch.filter :=

-include ${MAKE.dir}/make.mk
