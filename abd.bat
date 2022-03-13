@echo off
if "%1"=="-releasecontrol"  goto rc

if "%1"=="-factory" goto fr

if "%1"=="-bluetooth" goto bt

if "%1"=="-sdotg"  goto sdotg

if "%1"=="-usb" goto usb

echo Usage:abd -releasecontrol
echo           -factory
echo           -bluetooth
echo           -sdotg
echo           -usb

exit

:rc
echo release_control
adb shell am startservice -n com.android.launcher3/com.drupe.swd.launcher.huoshan.mdm.service.ExecuteCmdService --es "cmd" "command_release_control"
exit
:fr
echo factory_reset
adb shell am startservice -n com.android.launcher3/com.drupe.swd.launcher.huoshan.mdm.service.ExecuteCmdService --es "cmd" "command_reset_factory"
exit
:bt
echo open_bluetooth
adb shell am startservice -n com.android.launcher3/com.drupe.swd.launcher.huoshan.mdm.service.ExecuteCmdService --es "cmd" "command_bluetooth"
exit
:sdotg
echo open_sd&otg
adb shell am startservice -n com.android.launcher3/com.drupe.swd.launcher.huoshan.mdm.service.ExecuteCmdService --es "cmd" "command_sdcard_and_otg"
exit
:usb
echo open_usb
adb shell am startservice -n com.android.launcher3/com.drupe.swd.launcher.huoshan.mdm.service.ExecuteCmdService --es "cmd" "command_connect_usb"
exit