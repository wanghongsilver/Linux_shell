#! /bin/bash 


filepath=$1
if [ $# -ne 1 ];
then
	echo "Usage default path"
	filepath="/media/mmcblk0p1/"
fi

cd $filepath
ls *.log >sn.txt

declare -A ftimecnt_array;
while read line;
do
	ftime=`ls -l "$line"| awk '{if( NF==9 );print $5","$6"-"$7","$8","$9}' | cut -d, -f2`
	echo $ftime : $line
    let ftime_array["$ftime"]++;
done < sn.txt

echo =============file time cnt============
for ftime in "${!ftime_array[@]}";
do
        echo $ftime : ${ftime_array["$ftime"]}
done

