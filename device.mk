#
# Device configuration for OnePlus Ace 6 Ultra (roadster)
#

# Inherit proprietary vendor files (if present in build tree)
$(call inherit-product-if-exists, vendor/oneplus/roadster/roadster-vendor.mk)

# Target Dynamic Partitions Setup
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# System Properties
TARGET_SYSTEM_PROP += device/oneplus/roadster/system.prop

# Core Hardware HAL Packages (AOSP Baseline)
PRODUCT_PACKAGES += \
    android.hardware.audio.service \
    android.hardware.bluetooth@1.1-service \
    android.hardware.gatekeeper-service \
    android.hardware.health-service.example \
    android.hardware.nfc-service.cxd9008 \
    android.hardware.security.keymint-service

# Include VINTF Compatibility Matrix
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := \
    device/oneplus/roadster/vendor_manifest.xml

# Inherit Google Mobile Services integration
$(call inherit-product-if-exists, device/oneplus/roadster/gms.mk)
