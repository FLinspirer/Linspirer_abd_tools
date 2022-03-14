@echo off
if "%1"=="-releasecontrol"  goto rc

if "%1"=="-factory" goto fr

if "%1"=="-bluetooth" goto bt

if "%1"=="-sdotg"  goto sdotg

if "%1"=="-usb" goto usb

if "%1"=="-disable"  goto frz

if "%1"=="-enable" goto ufrz

if "%1"=="-clear" goto clr
echo Usage:abd -releasecontrol
echo           -factory
echo           -bluetooth       0/1
echo           -sdotg           0/1
echo           -usb             0/1
echo           -disable
echo           -enable
echo           -clear
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
echo open_bluetooth_%2
adb shell am startservice -n com.android.launcher3/com.drupe.swd.launcher.huoshan.mdm.service.ExecuteCmdService --es "cmd" "command_bluetooth" --ei "active" %2
exit
:sdotg
echo open_sd&otg_%2
adb shell am startservice -n com.android.launcher3/com.drupe.swd.launcher.huoshan.mdm.service.ExecuteCmdService --es "cmd" "command_sdcard_and_otg" --ei "active" %2
exit
:usb
echo open_usb_%2
adb shell am startservice -n com.android.launcher3/com.drupe.swd.launcher.huoshan.mdm.service.ExecuteCmdService --es "cmd" "command_connect_usb" --ei "active" %2
exit
:frz
echo disable_linspirer
adb shell pm disable-user com.android.launcher3
exit
:ufrz
echo enable_linspirer
adb shell pm enable com.android.launcher3
exit
:clr
echo clear_linspirer_data
adb shell pm clear com.android.launcher3
exit