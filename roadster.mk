# Inherit basic AOSP telephony & core frameworks
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit device-specific definitions
$(call inherit-product, device/oneplus/roadster/device.mk)

# Product Identification (Matched with PMB110 / 25815)
PRODUCT_NAME := aosp_roadster
PRODUCT_DEVICE := roadster
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := OnePlus PMB110
PRODUCT_MANUFACTURER := OnePlus

# Build Fingerprint Baseline (Android 17)
PRODUCT_SHIPPING_API_LEVEL := 36
