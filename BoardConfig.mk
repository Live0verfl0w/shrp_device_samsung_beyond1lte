# Platform
DEVICE_PATH := device/samsung/beyond1lte
BOARD_VENDOR := samsung
TARGET_BOARD_PLATFORM := exynos5
TARGET_BOARD_PLATFORM_GPU := mali-g76
TARGET_SOC := exynos9820
TARGET_BOOTLOADER_BOARD_NAME := universal9820
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_USES_UEFI := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_SMP := true

# Secondary Architecture
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_NO_REAL_SDCARD := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# TWRP specific build flags
RECOVERY_VARIANT := twrp
ALLOW_MISSING_DEPENDENCIES=true
BOARD_SUPPRESS_SECURE_ERASE := true
TW_Y_OFFSET := 142
TW_H_OFFSET := -142
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_PIXEL_FORMAT := "ABGR_8888"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 25500
TW_DEFAULT_BRIGHTNESS := 12800
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_INCLUDE_NTFS_3G := true
TW_EXCLUDE_SUPERSU := true
TW_EXTRA_LANGUAGES := true
TW_USE_NEW_MINADBD := true
TW_EXCLUDE_TWRPAPP := true

# Release related flags
PLATFORM_VERSION := 10
PLATFORM_SECURITY_PATCH := 2020-11-01

# Kernel
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/kernel
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/dtbo
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --header_version 1

# Include
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# SHRP flags
# Path of your SHRP Tree
SHRP_PATH := device/samsung/beyond1lte
# Maintainer name 
SHRP_MAINTAINER := bruh™
# Device codename 
SHRP_DEVICE_CODE := beyond1lte
# Recovery Type (It can be treble,normal,SAR) [Only for About Section] 
SHRP_REC_TYPE := SAR
# Recovery Type (It can be A/B or A_only) [Only for About Section] 
SHRP_DEVICE_TYPE := A_only
# shrp express
SHRP_EXPRESS := true 
# Shrp dark theme
SHRP_DARK := true 
# EDL mode
SHRP_EDL_MODE := 1 
# Device paths
SHRP_EXTERNAL := /external_sd
SHRP_INTERNAL := /sdcard 
SHRP_OTG := /usb-otg 
# Flashlight
SHRP_FLASH := 1 
# Recovery path 
SHRP_REC := /dev/block/platform/13d60000.ufs/by-name/recovery
# AB device
SHRP_AB := false
# Force mount system in system 
SHRP_NO_SAR_AUTOMOUNT := true 

