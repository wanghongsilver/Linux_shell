#! /bin/bash 

#完成以下功能：
#	3.加载完成后打印工具链版本信息

#打印环境变量
echo PATH:
echo $PATH
echo CROSS_COMPILE:
echo $CROSS_COMPILE
echo ARCH:
echo $ARCH

#设置环境变量
export PATH=$PATH:/opt/gcc-linaro-4.9-2014.11-x86_64_arm-linux-gnueabihf/bin
export CROSS_COMPILE=arm-linux-gnueabihf-
export ARCH=arm

echo   
#打印环境变量
echo PATH:
echo $PATH
echo CROSS_COMPILE:
echo $CROSS_COMPILE
echo ARCH:
echo $ARCH

echo   
arm-linux-gnueabihf-gcc --version



