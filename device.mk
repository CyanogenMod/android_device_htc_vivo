#
# Copyright (C) 2011 The CyanogenMod Project
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
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device

PRODUCT_COPY_FILES += device/common/gps/gps.conf_EU:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/htc/vivo/init.vivo.rc:root/init.vivo.rc \
    device/htc/vivo/init.rc:root/init.rc \
    device/htc/vivo/ueventd.vivo.rc:root/ueventd.vivo.rc

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/vivo/device-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r3 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

DEVICE_PACKAGE_OVERLAYS += device/htc/vivo/overlay

# gsm config xml file
PRODUCT_COPY_FILES += \
    device/htc/vivo/voicemail-conf.xml:system/etc/voicemail-conf.xml

# Sensors, GPS, Lights
PRODUCT_PACKAGES += \
    gps.vivo \
    lights.vivo \
    sensors.vivo

# Input device calibration files
PRODUCT_COPY_FILES += \
    device/htc/vivo/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/vivo/idc/elan-touchscreen.idc:system/usr/idc/elan-touchscreen.idc \
    device/htc/vivo/idc/cy8c-touchscreen.idc:system/usr/idc/cy8c-touchscreen.idc

# Keychars
PRODUCT_COPY_FILES += \
    device/htc/vivo/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/htc/vivo/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/htc/vivo/keychars/vivo-keypad.kcm.bin:system/usr/keychars/vivo-keypad.kcm.bin \
    device/htc/vivo/keychars/vivo-keypad-ara.kcm.bin:system/usr/keychars/vivo-keypad-ara.kcm.bin \
    device/htc/vivo/keychars/vivo-keypad-ell.kcm.bin:system/usr/keychars/vivo-keypad-ell.kcm.bin \
    device/htc/vivo/keychars/vivo-keypad-fra.kcm.bin:system/usr/keychars/vivo-keypad-fra.kcm.bin \
    device/htc/vivo/keychars/vivo-keypad-ger.kcm.bin:system/usr/keychars/vivo-keypad-ger.kcm.bin \
    device/htc/vivo/keychars/vivo-keypad-ita.kcm.bin:system/usr/keychars/vivo-keypad-ita.kcm.bin \
    device/htc/vivo/keychars/vivo-keypad-tur.kcm.bin:system/usr/keychars/vivo-keypad-tur.kcm.bin \
    device/htc/vivo/keychars/vivo-keypad-wwe-bopomo.kcm.bin:system/usr/keychars/vivo-keypad-wwe-bopomo.kcm.bin \
    device/htc/vivo/keychars/vivo-keypad-wwe.kcm.bin:system/usr/keychars/vivo-keypad-wwe.kcm.bin

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/vivo/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/vivo/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/vivo/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/vivo/keylayout/vivo-keypad.kl:system/usr/keylayout/vivo-keypad.kl \
    device/htc/vivo/keylayout/vivo-keypad-ara.kl:system/usr/keylayout/vivo-keypad-ara.kl \
    device/htc/vivo/keylayout/vivo-keypad-ell.kl:system/usr/keylayout/vivo-keypad-ell.kl \
    device/htc/vivo/keylayout/vivo-keypad-fra.kl:system/usr/keylayout/vivo-keypad-fra.kl \
    device/htc/vivo/keylayout/vivo-keypad-ger.kl:system/usr/keylayout/vivo-keypad-ger.kl \
    device/htc/vivo/keylayout/vivo-keypad-ita.kl:system/usr/keylayout/vivo-keypad-ita.kl \
    device/htc/vivo/keylayout/vivo-keypad-tur.kl:system/usr/keylayout/vivo-keypad-tur.kl \
    device/htc/vivo/keylayout/vivo-keypad-wwe-bopomo.kl:system/usr/keylayout/vivo-keypad-wwe-bopomo.kl \
    device/htc/vivo/keylayout/vivo-keypad-wwe.kl:system/usr/keylayout/vivo-keypad-wwe.kl \
    device/htc/vivo/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    device/htc/vivo/keylayout/cy8c-touchscreen.kl:system/usr/keylayout/cy8c-touchscreen.kl \
    device/htc/vivo/keylayout/elan-touchscreen.kl:system/usr/keylayout/elan-touchscreen.kl

# Device specific firmware
PRODUCT_COPY_FILES += \
    device/htc/vivo/firmware/bcm4329.hcd:system/vendor/firmware/bcm4329.hcd \
    device/htc/vivo/firmware/default.acdb:system/etc/firmware/default.acdb \
    device/htc/vivo/firmware/default_mfg.acdb:system/etc/firmware/default_mfg.acdb \
    device/htc/vivo/firmware/default_org.acdb:system/etc/firmware/default_org.acdb \
    device/htc/vivo/firmware/default_org_nel.acdb:system/etc/firmware/default_org_nel.acdb

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/vivo/dsp/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/vivo/dsp/AdieHWCodec_NEL.csv:system/etc/AdieHWCodec_NEL.csv \
    device/htc/vivo/dsp/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
    device/htc/vivo/dsp/AIC3254_REG_DualMic.csv:system/etc/AIC3254_REG_DualMic.csv \
    device/htc/vivo/dsp/AIC3254_REG_DualMic_NEL.csv:system/etc/AIC3254_REG_DualMic_NEL.csv \
    device/htc/vivo/dsp/AIC3254_REG_DualMicXB.csv:system/etc/AIC3254_REG_DualMicXB.csv \
    device/htc/vivo/dsp/TPA2051_CFG.csv:system/etc/TPA2051_CFG.csv \
    device/htc/vivo/dsp/TPA2051_CFG_NEL.csv:system/etc/TPA2051_CFG_NEL.csv \
    device/htc/vivo/dsp/CodecDSPID_BCLK.txt:system/etc/CodecDSPID_BCLK.txt \
    device/htc/vivo/dsp/CodecDSPID_NEL.txt:system/etc/CodecDSPID_NEL.txt \
    device/htc/vivo/dsp/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/vivo/dsp/CodecDSPID_WB.txt:system/etc/CodecDSPID_WB.txt \
    device/htc/vivo/dsp/soundimage/Sound_Bass_Booster.txt:system/etc/soundimage/Sound_Bass_Booster.txt \
    device/htc/vivo/dsp/soundimage/Sound_Blues.txt:system/etc/soundimage/Sound_Blues.txt \
    device/htc/vivo/dsp/soundimage/Sound_Classical.txt:system/etc/soundimage/Sound_Classical.txt \
    device/htc/vivo/dsp/soundimage/Sound_Country.txt:system/etc/soundimage/Sound_Country.txt \
    device/htc/vivo/dsp/soundimage/Sound_Jazz.txt:system/etc/soundimage/Sound_Jazz.txt \
    device/htc/vivo/dsp/soundimage/Sound_Latin.txt:system/etc/soundimage/Sound_Latin.txt \
    device/htc/vivo/dsp/soundimage/Sound_New_Age.txt:system/etc/soundimage/Sound_New_Age.txt \
    device/htc/vivo/dsp/soundimage/Sound_Original_BCLK.txt:system/etc/soundimage/Sound_Original_BCLK.txt \
    device/htc/vivo/dsp/soundimage/Sound_Original_Recording_BCLK.txt:system/etc/soundimage/Sound_Original_Recording_BCLK.txt \
    device/htc/vivo/dsp/soundimage/Sound_Original_Recording.txt:system/etc/soundimage/Sound_Original_Recording.txt \
    device/htc/vivo/dsp/soundimage/Sound_Original_SPK_BCLK.txt:system/etc/soundimage/Sound_Original_SPK_BCLK.txt \
    device/htc/vivo/dsp/soundimage/Sound_Original_SPK.txt:system/etc/soundimage/Sound_Original_SPK.txt \
    device/htc/vivo/dsp/soundimage/Sound_Original.txt:system/etc/soundimage/Sound_Original.txt \
    device/htc/vivo/dsp/soundimage/Sound_Phone_Original_HP_BCLK.txt:system/etc/soundimage/Sound_Phone_Original_HP_BCLK.txt \
    device/htc/vivo/dsp/soundimage/Sound_Phone_Original_HP.txt:system/etc/soundimage/Sound_Phone_Original_HP.txt \
    device/htc/vivo/dsp/soundimage/Sound_Phone_Original_REC_BCLK.txt:system/etc/soundimage/Sound_Phone_Original_REC_BCLK.txt \
    device/htc/vivo/dsp/soundimage/Sound_Phone_Original_REC_NEL.txt:system/etc/soundimage/Sound_Phone_Original_REC_NEL.txt \
    device/htc/vivo/dsp/soundimage/Sound_Phone_Original_REC.txt:system/etc/soundimage/Sound_Phone_Original_REC.txt \
    device/htc/vivo/dsp/soundimage/Sound_Phone_Original_REC_WB.txt:system/etc/soundimage/Sound_Phone_Original_REC_WB.txt \
    device/htc/vivo/dsp/soundimage/Sound_Phone_Original_SPK_BCLK.txt:system/etc/soundimage/Sound_Phone_Original_SPK_BCLK.txt \
    device/htc/vivo/dsp/soundimage/Sound_Phone_Original_SPK.txt:system/etc/soundimage/Sound_Phone_Original_SPK.txt \
    device/htc/vivo/dsp/soundimage/Sound_Phone_Original_SPK_WB.txt:system/etc/soundimage/Sound_Phone_Original_SPK_WB.txt \
    device/htc/vivo/dsp/soundimage/Sound_Piano.txt:system/etc/soundimage/Sound_Piano.txt \
    device/htc/vivo/dsp/soundimage/Sound_Pop.txt:system/etc/soundimage/Sound_Pop.txt \
    device/htc/vivo/dsp/soundimage/Sound_R_B.txt:system/etc/soundimage/Sound_R_B.txt \
    device/htc/vivo/dsp/soundimage/Sound_Recording.txt:system/etc/soundimage/Sound_Recording.txt \
    device/htc/vivo/dsp/soundimage/Sound_Rock.txt:system/etc/soundimage/Sound_Rock.txt \
    device/htc/vivo/dsp/soundimage/Sound_SRS_A_HP.txt:system/etc/soundimage/Sound_SRS_A_HP.txt \
    device/htc/vivo/dsp/soundimage/Sound_SRS_A_SPK.txt:system/etc/soundimage/Sound_SRS_A_SPK.txt \
    device/htc/vivo/dsp/soundimage/Sound_SRS_V_HP.txt:system/etc/soundimage/Sound_SRS_V_HP.txt \
    device/htc/vivo/dsp/soundimage/Sound_SRS_V_SPK.txt:system/etc/soundimage/Sound_SRS_V_SPK.txt \
    device/htc/vivo/dsp/soundimage/Sound_Treble_Booster.txt:system/etc/soundimage/Sound_Treble_Booster.txt \
    device/htc/vivo/dsp/soundimage/Sound_Vocal_Booster.txt:system/etc/soundimage/Sound_Vocal_Booster.txt \
    device/htc/vivo/dsp/soundimage/Sound_Rec_Landscape.txt:system/etc/soundimage/Sound_Rec_Landscape.txt \
    device/htc/vivo/dsp/soundimage/Sound_Rec_Portrait.txt:system/etc/soundimage/Sound_Rec_Portrait.txt \
    device/htc/vivo/dsp/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    device/htc/vivo/dsp/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/vivo/dsp/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/vivo/dsp/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg \
    device/htc/vivo/dsp/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg
 
PRODUCT_COPY_FILES += \
    device/htc/vivo/vold.fstab:system/etc/vold.fstab

# Kernel modules
#PRODUCT_COPY_FILES += \

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/vivo/prebuilt/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/htc/vivo/prebuilt/bcm4329.ko:system/lib/modules/bcm4329.ko

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# htc audio settings
$(call inherit-product, device/htc/vivo/media_htcaudio.mk)

$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/htc/vivo/device-vendor.mk)
