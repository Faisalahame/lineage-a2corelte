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
