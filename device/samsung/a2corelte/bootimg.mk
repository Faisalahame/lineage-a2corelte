# Define the flashable tar output
FLASH_IMAGE_TARGET ?= $(PRODUCT_OUT)/recovery.tar

# Add DTB to mkbootimg args globally if available
ifdef TARGET_PREBUILT_DTB
    BOARD_MKBOOTIMG_ARGS += --dt $(TARGET_PREBUILT_DTB)
endif

# Boot Image
$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES) $(BOOTIMAGE_EXTRA_DEPS)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
	@echo -e ${CL_CYN}"Made boot image: $@"${CL_RST}

# Recovery Image
$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
		$(recovery_ramdisk) \
		$(recovery_kernel) \
		$(BOOTIMAGE_EXTRA_DEPS)
	@echo ----- Making recovery image ------
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	@echo -e ${CL_CYN}"----- Made recovery image -------- $@"${CL_RST}
	@echo -e ${CL_GRN}"----- Lying about SEAndroid state to Samsung bootloader ------"${CL_RST}
	$(hide) printf "SEANDROIDENFORCE" >> $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)
	$(hide) tar -C $(PRODUCT_OUT) -H ustar -c recovery.img > $(FLASH_IMAGE_TARGET)
	@echo "------- Made flashable image: $(FLASH_IMAGE_TARGET) -------"
