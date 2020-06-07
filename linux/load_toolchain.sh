##! /bin/bash -xv
#! /bin/bash 

#完成以下功能：
#	1.工具链运行指令可以是脚本后参数运行或者运行脚本后选择工具链，二选一
#	2.脚本后续方便添加扩展其他工具链
#	3.加载完成后打印工具链版本信息

#设置环境变量，显示每行行号
PS4='$LINENO'

echo -e "\e[1;32m 加载工具链 \e[0m"

export MYD_META="/opt/myir-imx-fb/4.1.15-2.0.1/meta/environment-setup-cortexa7hf-neon-poky-linux-gnueabi"
export MYD_CORE="/opt/myir-imx-fb/4.1.15-2.0.1/core/environment-setup-cortexa7hf-neon-poky-linux-gnueabi"


#建立2个对应的普通数组
#建立索引数组
array_index[0]="meta"
array_index[1]="core"

#建立环境变量路径数组
array_path[0]=$MYD_META
array_path[1]=$MYD_CORE

#判断脚本有无附加参数,有参数将参数设置索引，无参数，输入索引
if [ $# != 0 ]; then
	#将参数设置成索引
	index=$1
else
	#循环打印索引
	echo -e "\e[1;33m"
	printf " %-5s    %-s\n" ID  Path
	for((i=0;i<${#array_index[*]};i++))
	do
	printf "[%-5s]   %-s\n" ${array_index[i]} ${array_path[i]}
	done
	echo -e "\e[0m"
	
	#输入索引
	read -p "Please input index: " index
fi

#循环根据索引选择目录
for((i=0;i<${#array_index[*]};i++))
do
		#判断index是否和索引数组有一致，有的化退出循环，没有的话，在最后一次循环输出错误
        if [ "${array_index[i]}" = "$index" ]; then
			pathbuf=${array_path[i]}
			break
		else
			if [ ${i+1} = ${#array_index[*]} ]; then
				echo -e "\e[1;31m ERR:索引参数错误,请重新输入 \e[0m"
				exit -1 
			fi
        fi
		
done

echo "Envpath:" $pathbuf

#加载环境配置文件
source $pathbuf

#查看编译器板版本
arm-poky-linux-gnueabi-gcc --version


