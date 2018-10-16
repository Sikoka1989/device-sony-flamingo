ifeq ($(PRODUCT_PLATFORM_SOD),true)

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    macaddrsetup.c

ifeq ($(WIFI_DRIVER_BUILT),qca_cld3)
LOCAL_CFLAGS += -DQCA_CLD3_WIFI
endif

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libcutils

LOCAL_MODULE := macaddrsetup
ifeq (1,$(filter 1,$(shell echo "$$(( $(PLATFORM_SDK_VERSION) >= 25 ))" )))
LOCAL_MODULE_OWNER := sony
LOCAL_INIT_RC_64   := vendor/etc/init/macaddrsetup.rc
LOCAL_PROPRIETARY_MODULE := true
endif

LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)

endif