ifneq (${DEBUG},1)
        CFLAGS   += -fstack-protector-strong
        CXXFLAGS += -fstack-protector-strong
        ifneq (${PLATFORM},Darwin)
                CFLAGS   += -fstack-clash-protection -pie
                CXXFLAGS += -fstack-clash-protection -pie
                LDFLAGS  += -Wl,-z,relro,-z,now
        endif
        CFLAGS   += -fPIE
        CXXFLAGS += -fPIE
        CPPFLAGS += -D_FORTIFY_SOURCE=3
endif
