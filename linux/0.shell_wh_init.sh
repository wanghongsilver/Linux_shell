#! /bin/bash  

#完成以下功能：
#	1.初始化目录环境变量
#	2.实现当前目录下脚本菜单选择

#设置环境变量，显示每行行号
PS4='$LINENO'

echo -e "\e[1;32m 选择将要执行脚本 \e[0m"

export SHELL_WH_DIR="/home/wh/shell_wh"

#查找当前目录下的文件,将查到的文件存在数组里
#cd $SHELL_WH_DIR
i=0
filenames=$(ls $SHELL_WH_DIR/*.sh)
for file in $filenames
do
	array_filename[i++]=$file			
done	

#循环打印索引
echo -e "\e[1;33m"
printf " %-5s    %-s\n" ID  name
for((i=0;i<${#array_filename[*]};i++))
do
	printf "[%-5s]   %-s\n" $i ${array_filename[i]}
done
echo -e "\e[0m"
	
#输入索引
read -p "Please input index:" index

#判断index是否为数字，不是数字返回错误
#判断index是否在文件名称数组之内，在的话更新文件，不在的话打印错误，退出
if [ $index -ge ${#array_filename[*]} ]; then
	echo -e "\e[1;31m ERR:索引参数错误,请重新输入 \e[0m"
	exit -1
else
	filenamebuf=${array_filename[$index]}
fi

echo "File_name:" $filenamebuf

#加载环境配置文件
source $SHELL_WH_DIR/$filenamebuf



