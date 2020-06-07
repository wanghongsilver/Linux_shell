#! /bin/bash -xv

#复制kernel编译文件到tftp服务器文件目录zImage dtb
#完成以下功能：
#       1.复制指定内核文件目录下的zImage，dtb文件到tftp文件目录
#       2.默认复制当前目录下的文件到tftp服务器目录
#       3.显示服务器目录下的文件

#设置环境变量，显示每行行号
PS4='$LINENO'

#创建 zImage 和 dtb文件目录环境变量
export FILE_ZIMAGE_DIR="arch/arm/boot"
export FILE_DTB_DIR="$FILE_ZIMAGE_DIR/dts"
export SERVER_TFTP_DIR="/var/lib/tftpboot"

#设置默认值
zImage_name="zImage"
dtb_name="myd-y6ull-gpmi-weim.dtb"


#复制zImage
cp $PWD/$FILE_ZIMAGE_DIR/$zImage_name $SERVER_TFTP_DIR

#复制dtb
cp $PWD/$FILE_DTB_DIR/$dtb_name $SERVER_TFTP_DIR

#打印tftp服务器目录和文件
echo $SERVER_TFTP_DIR
ls -lah $SERVER_TFTP_DIR
