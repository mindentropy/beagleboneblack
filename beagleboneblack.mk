$(call inherit-product,$(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product,$(LOCAL_PATH)/device.mk)

# Should be same as what is provided in vendorsetup.sh for lunch option.
PRODUCT_NAME := beagleboneblack
#PRODUCT_DEVICE should match with an entry in device
PRODUCT_DEVICE := beagleboneblack
PRODUCT_BRAND := Android
PRODUCT_MODEL := AOSP on Beagleboneblack
PRODUCT_MANUFACTURER := beagleboard.org
