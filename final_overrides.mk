PRODUCT_LOCALES := en_US
PRODUCT_PACKAGES_DEBUG :=
PRODUCT_PACKAGES := $(filter-out Jelly Eleven AudioFX Recorder Snap Terminal Email Exchange2 Updater SeedVault ManagedProvisioning PrintSpooler EasterEgg Traceur PhotoTable LiveWallpapersPicker VisualizationWallpapers SharedStorageBackup WallpaperBackup BasicDreams MagicSmokeWallpapers PhaseBeam Galaxy4 HoloSpiralWallpaper NoiseField,$(PRODUCT_PACKAGES))
PRODUCT_PACKAGES := $(filter-out IconPack% %SourceOverlay ClockFont%,$(PRODUCT_PACKAGES))
