#!/sbin/sh
#

# remove the binaries as they are no longer needed. (kernel handled)
if [ -e /system/bin/mpdecision ] ; then
	busybox mv /system/bin/mpdecision /system/bin/mpdecision_bck
fi
if [ -e /system/bin/thermald ] ; then
	busybox mv /system/bin/thermald /system/bin/thermald_bck
fi

# remove the library as they are no longer needed. (kernel handled)
if [ -e /system/lib/hw/power.msm8960.so ] ; then
        busybox mv /system/lib/hw/power.msm8960.so /system/lib/hw/power.msm8960.so_bck
fi

# backup the old prima stuff
#if [ ! -e /system/vendor/firmware/wlan/prima/WCNSS_cfg.dat_bck ] ; then
#        busybox mv /system/vendor/firmware/wlan/prima/WCNSS_cfg.dat /system/vendor/firmware/wlan/prima/WCNSS_cfg.dat_bck
#fi
#if [ ! -e /system/etc/wifi/WCNSS_qcom_cfg.ini_bck ] ; then
#        busybox mv /system/etc/wifi/WCNSS_qcom_cfg.ini /system/etc/wifi/WCNSS_qcom_cfg.ini_bck
#fi
return $?
