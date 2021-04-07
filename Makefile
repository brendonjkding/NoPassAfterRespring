ifdef SIMULATOR
TARGET = simulator:clang:11.2:8.0
else
TARGET = iphone:clang:11.2:7.0
	ifeq ($(debug),0)
		ARCHS= armv7 arm64 arm64e
	else
		ARCHS= arm64 arm64e
	endif
endif

INSTALL_TARGET_PROCESSES = SpringBoard



TWEAK_NAME = NoPassAfterRespringSafe

NoPassAfterRespringSafe_FILES = Tweak.x
NoPassAfterRespringSafe_CFLAGS = -fobjc-arc

ADDITIONAL_CFLAGS += -Wno-error=unused-variable -Wno-error=unused-function -Wno-error=unused-value -include Prefix.pch

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk

