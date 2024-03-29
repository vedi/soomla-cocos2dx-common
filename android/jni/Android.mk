LOCAL_PATH := $(call my-dir)

# cocos2dx-soomla-common
include $(CLEAR_VARS)

LOCAL_MODULE := cocos2dx_soomla_common_static
LOCAL_MODULE_FILENAME := libcocos2dxsoomlacommon
LOCAL_SRC_FILES := ../../Soomla/CCDomainFactory.cpp \
	../../Soomla/CCDomainHelper.cpp \
	../../Soomla/CCSoomlaJsonHelper.cpp \
	../../Soomla/data/CCCommonJSONConsts.cpp \
	../../Soomla/domain/CCDomain.cpp

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../Soomla
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../Soomla/data
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../Soomla/domain

LOCAL_WHOLE_STATIC_LIBRARIES += cocos2dx_static
LOCAL_WHOLE_STATIC_LIBRARIES += jansson_static


LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../..
LOCAL_EXPORT_C_INCLUDES += $(LOCAL_PATH)/../../Soomla
LOCAL_EXPORT_C_INCLUDES += $(LOCAL_PATH)/../../Soomla/data
LOCAL_EXPORT_C_INCLUDES += $(LOCAL_PATH)/../../Soomla/domain

include $(BUILD_STATIC_LIBRARY)

$(call import-module,external/jansson)
