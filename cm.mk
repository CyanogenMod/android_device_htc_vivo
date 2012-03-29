$(call inherit-product, device/htc/vivo/full_vivo.mk)

PRODUCT_RELEASE_NAME := IncS

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_vivo BUILD_FINGERPRINT=htc_wwe/htc_vivo/vivo:2.3.5/GRJ90/197817.3:user/release-keys PRIVATE_BUILD_DESC="3.08.405.3 CL197817 release-keys"

PRODUCT_NAME := cm_vivo
PRODUCT_DEVICE := vivo
