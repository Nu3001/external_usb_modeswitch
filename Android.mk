LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := usb_modeswitch.c
LOCAL_STATIC_LIBRARIES := libc libusb-1.0
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_C_INCLUDES := external/usb_modeswitch/libusb-1.0/libusb
LOCAL_MODULE := usb_modeswitch
LOCAL_MODULE_TAGS := optional
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE := usb_modeswitch.sh
LOCAL_SRC_FILES := usb_modeswitch.sh
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin/
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

######################################
include $(call all-makefiles-under,$(LOCAL_PATH))
