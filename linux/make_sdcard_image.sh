#! /bin/bash -xv

#复制编译好的uboot，zImage,dtb,rootfs到sdcard镜像制作工具中，编译生成SDcard镜像
#完成以下功能：
#       1.复制tftpboot目录下的uboot,zImage，dtb，rootfd文件到sdcard工具文件目录
#       2.使用build脚本进行镜像制作

#设置环境变量，显示每行行号
PS4='$LINENO'

#创建 zImage 和 dtb文件目录环境变量
export MK_SD_DIR="/home/wh/MYD_dev/03-Tools/ManufactoryTool/MYiR-iMX-mkupdate-sdcard"
export SYS_TYPE_DIR="mfgimages-myd-y6ull-ddr256m-nand256m-base"
export SERVER_TFTP_DIR="/var/lib/tftpboot"

#设置默认值
uboot_name="u-boot-nand-2016.03-r0.imx"
zImage_name="zImage"
dtb_name="myd-y6ull-gpmi-weim.dtb"
rootfs_name="core-image-base-myd-y6ull14x14-20180809141225.rootfs.tar.bz2"

#进入工具目录
cd $MK_SD_DIR

#复制uboot
cp $SERVER_TFTP_DIR/$uboot_name $PWD/$SYS_TYPE_DIR
#复制zImage
cp $SERVER_TFTP_DIR/$zImage_name $PWD/$SYS_TYPE_DIR
#复制dtb
cp $SERVER_TFTP_DIR/$dtb_name $PWD/$SYS_TYPE_DIR
#复制rootfs
cp $SERVER_TFTP_DIR/$rootfs_name $PWD/$SYS_TYPE_DIR

#打印tftp服务器目录和文件
ls -lah $PWD/$SYS_TYPE_DIR

#执行制作脚本
sudo $PWD/build-sdcard.sh -p myd-y6uly2 -n -d mfgimages-myd-y6ull-ddr256m-nand256m-base/ -s 256

ls -lah $PWD
