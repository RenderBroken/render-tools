@echo off
set hideErrors=n
set "errout= "
if "%hideErrors%" == "y" set "errout=2>nul"

echo.
echo Synapse Android Lab - On the Fly testing
echo by ak @ xda-developers
echo.

echo -----------------------------------------------------------
echo.
::adb connect 192.168.1.129
::adb root
adb shell busybox mount -o rw,remount /
adb push synapse/data/UKM /data/UKM/
adb shell chmod -R 755 /data/UKM/
adb shell rm -f /data/N4UKM/config.json
adb shell /system/xbin/uci reset
adb shell /system/xbin/uci
adb shell sleep 1
adb shell am force-stop com.af.synapse
adb shell am start -n com.af.synapse/com.af.synapse.MainActivity
echo.
echo -----------------------------------------------------------

echo.
echo Done!
goto end

:end
echo.
pause