ifeq ($(shell uname), Darwin)
  PLATFORM = Darwin
else
  PLATFORM = Linux
endif
