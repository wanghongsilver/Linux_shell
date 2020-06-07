#! /bin/bash

#name    :file_list.sh
#use     : E40s
#function:
#	1.from /opt/APP/confid/Config.json read sn
#	2.creat sn.txt
#	3.保存 /media/mmcblk0p1/ 目录下文件信息到sn.txt

awk '{ if($1 == "/"SN:/"") sn=$2}' /opt/APP/config/Config.json
echo $sn
