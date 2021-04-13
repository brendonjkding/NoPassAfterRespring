ifdef SIMULATOR
TARGET = simulator:clang:11.2:8.0
else
TARGET = iphone:clang:latest:7.0
	ifeq ($(debug),0)
		ARCHS= armv7 arm64 arm64e
	else
		ARCHS= arm64 arm64e
	endif
endif

INSTALL_TARGET_PROCESSES = SpringBoard

TWEAK_NAME = NoPassAfterRespringSafe

NoPassAfterRespringSafe_FILES = Tweak.c

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk

