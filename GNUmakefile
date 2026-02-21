#!/usr/bin/make -f
.SUFFIXES:

TARGET := $(shell basename $$PWD).out

CFLAGS   := -std=c23 -O2 -pthread
CXXFLAGS := -std=c++23 -O2 -pthread
CPPFLAGS := -D_GNU_SOURCE
LDFLAGS  := -lm

SOURCE.dir := source
OBJECT.dir := object

HEADER.pch.filter :=

-include tool/make/*.mk
