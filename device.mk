# Inherit the standard Android telephony base (This triggers the 40,000 step compile!)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Low RAM optimizations for 1GB device
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.low_ram=true \
    dalvik.vm.heapgrowthlimit=128m \
    dalvik.vm.heapmaxfree=8m \
    dalvik.vm.heapminfree=2m \
    dalvik.vm.heapsize=256m \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heaptargetutilization=0.75

# Temporary: strip BT stack until hardware bring-up
PRODUCT_PACKAGES_REMOVE += \
    Bluetooth \
    BluetoothExt
PRODUCT_COPY_FILES += device/samsung/a2corelte/rootdir/fstab.exynos7870:root/fstab.exynos7870
PRODUCT_PACKAGES_REMOVE += webview

# Shrink system.img to fit physical partition
PRODUCT_PACKAGES_REMOVE += \
    Jelly \
    Eleven \
    AudioFX \
    Recorder \
    Snap \
    ExactCalculator \
    Terminal

# ==========================================
# ANDROID 10 GO EDITION CONFIGURATION
# ==========================================

# Inherit AOSP Go defaults (Low Memory Killer tweaks, etc.)
$(call inherit-product-if-exists, build/make/target/product/go_defaults.mk)
$(call inherit-product-if-exists, build/target/product/go_defaults.mk)

# Force Go Edition properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.low_ram=true \
    ro.lmk.critical_upgrade=true \
    ro.lmk.upgrade_pressure=40 \
    ro.lmk.downgrade_pressure=60 \
    ro.lmk.kill_heaviest_task_dup=true \
    dalvik.vm.usejitprofiles=true \
    pm.dexopt.boot=verify \
    pm.dexopt.install=interpret-only \
    pm.dexopt.bg-dexopt=speed-profile

# Aggressively strip heavy non-Go apps to guarantee < 1.2GB system image
PRODUCT_PACKAGES_REMOVE += \
    Jelly \
    Eleven \
    AudioFX \
    Recorder \
    Snap \
    ExactCalculator \
    Terminal \
    Email \
    Exchange2 \
    Profiles \
    Backgrounds \
    LiveWallpapersPicker \
    PhotoTable \
    PrintRecommendationService \
    Updater
