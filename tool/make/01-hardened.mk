ifneq (${DEBUG},1)
        CFLAGS   += -fstack-protector-strong
        CXXFLAGS += -fstack-protector-strong
        ifneq (${PLATFORM},Darwin)
                CFLAGS   += -fstack-clash-protection -fPIE -pie
                CXXFLAGS += -fstack-clash-protection -fPIE -pie
                LDFLAGS  += -Wl,-z,relro,-z,now
        endif
        CPPFLAGS += -D_FORTIFY_SOURCE=3
endif
