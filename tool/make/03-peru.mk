ALSO += .peru/lastimports .WAIT

HAS_PERU := 0
ifneq ($(shell which peru 2> /dev/null),)
        HAS_PERU := 1
endif

PERU_MUST_WORK ?= 0
ifneq ($(PERU_MUST_WORK),0)
.peru/lastimports: peru.yaml
	@echo "Peru Syncing..."
	@peru sync
	@touch $@
else
.peru/lastimports: peru.yaml
	@echo "Peru Syncing..."
	@peru sync 2>/dev/null ||\
        (echo "NOTICE:\nYour system lacks <https://github.com/buildinspace/peru>\nBuild will continue."; true)
	@touch $@ 2>/dev/null || true
endif
