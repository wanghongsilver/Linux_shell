#! /bin/bash

#文件名 sleep.sh
#功能：
#   1.从0开始计时到设定时间

printf  "Set count: %s,Count:" $1 

#存储光标位置
tput sc

#循环设置时间单位秒
for count in `seq 0 $1`
do
	#恢复光标之前存储的的位置
	tput rc
	#清除光标到行尾的所有内容
	tput ed
	echo -n $count
	sleep 1
done

printf "\r\ntimeout!!\r\n"
