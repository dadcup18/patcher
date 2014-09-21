#!/bin/bash
echo -e "\e[0;32mNovaFusion patcher for CyanogenMod 11\nStarting..."

PATCHERDIR=$(dirname $(readlink -f "$0"))
cd $PATCHERDIR
cd ../../../..
BASEDIR=$(pwd)

echo -e "\n\e[0;31mPatching RECOVERY:\e[0;34m"
cd $BASEDIR/bootable/recovery
patch -p1 -N -i$PATCHERDIR/recovery.patch

echo -e "\n\e[0;31mPatching AV:\e[0;34m"
cd $BASEDIR/frameworks/av
patch -p1 -N -i$PATCHERDIR/001-av.patch
patch -p1 -N -i$PATCHERDIR/002-h264switcher.patch
patch -p1 -N -i$PATCHERDIR/003-STE-OMX-getSupportedProfileLevel-fix.patch

echo -e "\n\e[0;31mPatching BASE:\e[0;34m"
cd $BASEDIR/frameworks/base
patch -p1 -N -i$PATCHERDIR/base.patch

echo -e "\n\e[0;31mPatching NATIVE:\e[0;34m"
cd $BASEDIR/frameworks/native
patch -p1 -N -i$PATCHERDIR/native.patch

echo -e "\n\e[0;31mPatching CORE:\e[0;34m"
cd $BASEDIR/system/core
patch -p1 -N -i$PATCHERDIR/core.patch

echo -e "\n\e[0;31mPatching VOLD:\e[0;34m"
cd $BASEDIR/system/vold
patch -p1 -N -i$PATCHERDIR/vold.patch

echo -e "\n\e[0;31mPatching SETTINGS:\e[0;34m"
cd $BASEDIR/packages/apps/Settings
patch -p1 -N -i$PATCHERDIR/settings.patch

echo -e "\n\e[0;32mEverything (probably) patched, have a nice day!\e[0m"
