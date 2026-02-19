#!/usr/bin/make -f

TARGET := $(shell basename $$PWD).out

CFLAGS   := -std=c23 -pthread
CPPFLAGS := -D_GNU_SOURCE
LDFLAGS  := -lm

SOURCE.dir      := source
OBJECT.dir      := object

HEADER.pch.filter :=

-include tool/make/*.mk
