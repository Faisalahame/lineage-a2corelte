$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, device/samsung/a2corelte/device.mk)
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_a2corelte
PRODUCT_DEVICE := a2corelte
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A260G
PRODUCT_MANUFACTURER := samsung
$(call inherit-product, $(LOCAL_DIR)/final_overrides.mk)
