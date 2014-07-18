#!/bin/bash

# Bash Color
green='\033[01;32m'
red='\033[01;31m'
blink_red='\033[05;31m'
restore='\033[0m'

clear

# Resources
THREAD="-j$(grep -c ^processor /proc/cpuinfo)"
KERNEL="zImage-dtb"
DEFCONFIG="ak_bacon_defconfig"

# Kernel Details
BASE_AK_VER="AK"
VER=".001.OnePone"
AK_VER="$BASE_AK_VER$VER"

# Vars
export LOCALVERSION=~`echo $AK_VER`
export CROSS_COMPILE=${HOME}/android/AK-linaro/4.7.4-2014.01.20140206.CR83/bin/arm-cortex_a15-linux-gnueabihf-
export ARCH=arm
export SUBARCH=arm
export KBUILD_BUILD_USER=ak
export KBUILD_BUILD_HOST=kernel

# Paths
MODULES_DIR="${HOME}/android/AK-OnePone-Anykernel/cwm/system/lib/modules"
KERNEL_DIR=`pwd`
OUTPUT_DIR="${HOME}/android/AK-OnePone-Anykernel/zip"
CWM_DIR="${HOME}/android/AK-OnePone-Anykernel/cwm"
ZIMAGE_DIR="${HOME}/android/AK-OnePone/arch/arm/boot"
CWM_MOVE="${HOME}/android/AK-releases"
ZIMAGE_ANYKERNEL="${HOME}/android/AK-OnePone-Anykernel/cwm/kernel"
ANYKERNEL_DIR="${HOME}/android/AK-OnePone-Anykernel"

# Functions
function cleanall {
	rm -rf $MODULES_DIR/*
	rm -rf $OUTPUT_DIR/*
	rm -rf $ZIMAGE_DIR/zImage*
	rm -rf $ZIMAGE_ANYKERNEL/zImage
	rm -rf $ZIMAGE_ANYKERNEL/zImage-dtb
	make clean && make mrproper
}

function makeak {
                make $DEFCONFIG
                make $THREAD
                rm `echo $MODULES_DIR"/*"`
		find $KERNEL_DIR -name '*.ko' -exec cp -v {} $MODULES_DIR \;
                cp -vr $ZIMAGE_DIR/$KERNEL $ZIMAGE_ANYKERNEL
                cd $CWM_DIR
                zip -r `echo $AK_VER`.zip * && mv  `echo $AK_VER`.zip $OUTPUT_DIR
                cp -vr $OUTPUT_DIR/`echo $AK_VER`.zip $CWM_MOVE
                cd $ANYKERNEL_DIR
                git reset --hard && cd $KERNEL_DIR
}


DATE_START=$(date +"%s")

echo -e "${green}"
echo "AK Kernel Creation Script:"
echo "    _____                         "
echo "   (, /  |              /)   ,    "
echo "     /---| __   _   __ (/_     __ "
echo "  ) /    |_/ (_(_(_/ (_/(___(_(_(_"
echo " ( /                              "
echo " _/                               "
echo

echo "---------------"
echo "Kernel Version:"
echo "---------------"

echo -e "${red}"; echo -e "${blink_red}"; echo "$AK_VER"; echo -e "${restore}";

echo -e "${green}"
echo "-----------------"
echo "Making AK Kernel:"
echo "-----------------"
echo -e "${restore}"

while read -p "Do you want to clean stuffs (y/n)? " cchoice
do
case "$cchoice" in
	y|Y )
		cleanall
		echo "All Cleaned now."
		break
		;;
	n|N )
		break
		;;
	* )
		echo ""
		echo "Invalid try again!"
		echo ""
		;;
esac
done

echo

while read -p "Do you want to build kernel (y/n)? " dchoice
do
case "$dchoice" in
	y|Y)
		makeak
		break
		;;
	n|N )
		break
		;;
	* )
		echo ""
		echo "Invalid try again!"
		echo ""
		;;
esac
done

echo -e "${green}"
echo "-------------------"
echo "Build Completed in:"
echo "-------------------"
echo -e "${restore}"

DATE_END=$(date +"%s")
DIFF=$(($DATE_END - $DATE_START))
echo "Time: $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds."
echo

