###############################
#[GB]: TODO: Fill up this file#
###############################

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/fstab.beagleboneblack:root/fstab.beagleboneblack

# kernel modules
# Note: when operating with an LCD screen, tilcdc must be started after
# cape manager has loaded the corresponding dtbo file. Hence, it is
# a module, not a built-in. The backlight and touch screen drivers could
# be built-ins, but it makes more sense for everything associated with the lcd
# panel to be modular
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/modules/pwm-tiehrpwm.ko:system/modules/pwm-tiehrpwm.ko \
	$(LOCAL_PATH)/modules/ti_am335x_tsc.ko:system/modules/ti_am335x_tsc.ko \
	$(LOCAL_PATH)/modules/ti_am335x_tscadc.ko:system/modules/ti_am335x_tscadc.ko 
#	$(LOCAL_PATH)/modules/tilcdc.ko:system/modules/tilcdc.ko \
#	$(LOCAL_PATH)/modules/tda998x.ko:system/modules/tda998x.ko

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/init.beagleboneblack.rc:root/init.beagleboneblack.rc \
	$(LOCAL_PATH)/init.beagleboneblack.usb.rc:root/init.beagleboneblack.usb.rc \
	$(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab \
	$(LOCAL_PATH)/ueventd.beagleboneblack.rc:root/ueventd.beagleboneblack.rc \
	$(LOCAL_PATH)/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \
	$(LOCAL_PATH)/mixer_paths.xml:system/etc/mixer_paths.xml \
	$(LOCAL_PATH)/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml

# BBB has low RAM. only 512 MB.
PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.low_ram=true \
	config.disable_network=true \
	config.disable_network_time=true \
	config.disable_bluetooth=true \
	config.disable_noncore=true \
	config.disable_location=true \
	config.disable_mediaproj=true \
	config.disable_textservices=true \
	config.disable_serial=true \
	config.disable_textservices=true \
	config.disable_searchmanager=true \
	config.disable_samplingprof=true 

## Disable Red activity highlights. Meant for diagnostics
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.strictmode.visual=0 \
	persist.sys.strictmode.disable=1

PRODUCT_CHARACTERISTICS := tablet

## Need to explicitly specify lcd_density. Otherwise the system complains during bootup as below:
## "ro.sf.lcd_density must be defined as a build property"
PRODUCT_PROPERTY_OVERRIDES += \
		ro.sf.lcd_density=160

## TODO: Create an overlay in the local path
DEVICE_PACKAGE_OVERLAYS := \
	$(LOCAL_PATH)/overlay

## TODO: Review the below tag.
PRODUCT_TAGS += dalvik.gc.type-precise

##TODO:Review the below packages
PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

PRODUCT_PACKAGES += \
	libaudioutils

PRODUCT_PACKAGES += \
	audio.primary.beaglebone \
	tinycap \
	tinymix \
	tinyplay

PRODUCT_PACKAGES += \
	dhcpcd.conf

PRODUCT_PACKAGES += \
	make_ext4fs

PRODUCT_PACKAGES += \
	androidvncserver

# Use pixel finger (libGLES_android.so) as a backup to SGX
# Software rendering
PRODUCT_PACKAGES += \
	libGLES_android

# Configure the Dalvik heap for a device with 512 MB RAM

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
