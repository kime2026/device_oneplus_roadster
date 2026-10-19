#
# Architecture configuration for OnePlus Ace 6 Ultra (roadster / 25815)
#

# CPU & Architecture (MediaTek MT6993 ARMv9)
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv9-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic

# Board / Platform Identification
TARGET_BOARD_PLATFORM := mt6993
TARGET_BOOTLOADER_BOARD_NAME := k6993v1_64

# Kernel / GKI Baseline (Linux 6.12 - 4KB Page Size)
BOARD_KERNEL_PAGESIZE := 4096
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

# Dynamic Partitions (Super Partition Architecture)
BOARD_SUPER_PARTITION_GROUPS := oplus_dynamic_partitions
BOARD_OPLUS_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor odm

# VINTF Compatibility
DEVICE_MANIFEST_FILE := device/oneplus/roadster/vendor_manifest.xml
