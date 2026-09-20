$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, device/samsung/a2corelte/device.mk)
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_a2corelte
PRODUCT_DEVICE := a2corelte
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A260G
PRODUCT_MANUFACTURER := samsung

# ==========================================
# <1GB NUCLEAR STRIP-DOWN (Appended directly to product mk)
# ==========================================
PRODUCT_LOCALES := en_US
PRODUCT_PACKAGES_DEBUG :=
PRODUCT_PACKAGES := $(filter-out Jelly Eleven AudioFX Recorder Snap Terminal Email Exchange2 Updater SeedVault ManagedProvisioning PrintSpooler EasterEgg Traceur PhotoTable LiveWallpapersPicker VisualizationWallpapers SharedStorageBackup WallpaperBackup BasicDreams MagicSmokeWallpapers PhaseBeam Galaxy4 HoloSpiralWallpaper NoiseField,$(PRODUCT_PACKAGES))
PRODUCT_PACKAGES := $(filter-out IconPack% %SourceOverlay ClockFont%,$(PRODUCT_PACKAGES))
