DEVICE_TREE := device/samsung/gts210ltexx

CM_PLATFORM_SDK_VERSION := 7	# Required for libf2fs.so
override TARGET_OUT_VENDOR_SHARED_LIBRARIES = $(TARGET_OUT_SHARED_LIBRARIES)

ALLOW_MISSING_DEPENDENCIES := true
SOONG_ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := universal5433

# Platform
TARGET_BOARD_PLATFORM := exynos5
TARGET_BOARD_PLATFORM_GPU := mali-t760mp6

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic
TARGET_CPU_SMP := true

# Boot image
BOARD_KERNEL_CMDLINE := # Exynos doesn't take cmdline arguments from boot image
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
# 000RU = recovery kernel, 000KU = system kernel
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --board SYSMAGIC000RU
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_TREE)/mkbootimg.mk

#COMPRESSION
BOARD_RAMDISK_USE_LZMA := true
BOARD_RAMDISK_COMPRESSION_LZMA_OPTS := -9

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_TREE)/kernel
TARGET_PREBUILT_DT := $(DEVICE_TREE)/dt.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DT)
#BOARD_MKBOOTIMG_ARGS += --dt $(TARGET_PREBUILT_DT)
BOARD_KERNEL_SEPARATED_DT := false
endif

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE     := 14680064
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 3145728000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 27657240576
BOARD_FLASH_BLOCK_SIZE := 131072

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_SUPPRESS_SECURE_ERASE := true

# TWRP specific build flags
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/15400000.usb/15400000.dwc3/gadget/lun%d/file"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 162
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_NO_EXFAT_FUSE := true
TW_MTP_DEVICE := "/dev/mtp_usb"
TW_EXCLUDE_SUPERSU := true

# Touchscreen correction
RECOVERY_TOUCHSCREEN_SWAP_XY := true
RECOVERY_TOUCHSCREEN_FLIP_Y := true

# Encryption support
#TW_INCLUDE_CRYPTO := true
