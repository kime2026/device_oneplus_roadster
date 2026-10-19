#
# Google Mobile Services & Pixel Experience Integration for roadster
#

# Enforce Google privileged permission whitelisting
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.gsm.xml

# Pixel Core Experience Packages
PRODUCT_PACKAGES += \
    GoogleServicesFramework \
    Phonesky \
    PrebuiltGmsCore \
    GoogleContacts \
    GoogleDialer \
    GoogleCalendar \
    Messages \
    NexusLauncherRelease \
    LatinIMEGooglePrebuilt

# Define default dialer & SMS application to Google variants
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-oneplus \
    ro.opa.eligible_device=true
