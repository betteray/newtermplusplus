THEOS_DEVICE_IP=192.168.1.168

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = newtermplusplus

newtermplusplus_FILES = Tweak.x
newtermplusplus_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
