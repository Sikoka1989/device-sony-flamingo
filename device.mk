# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_PACKAGE_OVERLAYS += \
    device/sony/flamingo/overlay

# Device etc
PRODUCT_COPY_FILES := \
    device/sony/flamingo/rootdir/system/etc/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/sony/flamingo/rootdir/system/etc/thermal-engine-8226.conf:system/etc/thermal-engine-8226.conf \
    device/sony/flamingo/rootdir/system/etc/sensors/sensor_def_qcomdev.conf:system/etc/sensors/sensor_def_qcomdev.conf \
    device/sony/flamingo/rootdir/system/etc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    device/sony/flamingo/rootdir/system/etc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    device/sony/flamingo/rootdir/build.prop:system/build.prop

# IDC
PRODUCT_COPY_FILES += \
    device/sony/flamingo/rootdir/system/usr/idc/elan-touchscreen.idc:system/usr/idc/elan-touchscreen.idc

# Device Specific Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

PRODUCT_PACKAGES += \
    keystore.msm8226

# Device Init
PRODUCT_PACKAGES += \
    fstab.flamingo \
    init.recovery.flamingo \
    init.flamingo \
    ueventd.flamingo

# Lights
PRODUCT_PACKAGES += \
    lights.flamingo

# Simple PowerHAL
PRODUCT_PACKAGES += \
    power.flamingo

#GAPPS
GAPPS_VARIANT := pico

PRODUCT_AAPT_CONFIG := large
PRODUCT_AAPT_PREBUILT_DPI := hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=240 \
    ro.usb.pid_suffix=1BC

# Inherit from those products. Most specific first.
$(call inherit-product, device/sony/yukon/platform.mk)
$(call inherit-product, vendor/sony/flamingo/flamingo-vendor.mk)
$(call inherit-product, vendor/google/build/opengapps-packages.mk)
