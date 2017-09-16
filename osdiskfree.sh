#!/bin/bash
cd /private/var/vm/
export used=`du|sed 's/\.//'`
export all=`df |grep disk1|awk '{print $2}'`
#printf "VM Swap Space Used:$used\n"
echo   "VMSWap Used : `du -h /private/var/vm/|awk '{print $1}'`"
printf "Swap/Total  : "
bc <<EOF
scale=3
$all/$used

EOF
printf '%'
echo "Available   : `df -H | grep disk1| awk '{print $4}'`"
echo "Total Disk  : `df -H | grep disk1| awk '{print $2}'`"

# Replace /S/ with your projects folder:
cd /s/
echo *********PROJECT FOLDER TOP 10 **************
du -d 1 . | awk '{printf "%010d %s\n", $1, $2  }'|sort -r|head -n 10


echo *********DOWNLOADS TOP 10 **************
cd ~/Downloads/
du -d 1 . | awk '{printf "%010d %s\n", $1, $2  }'|sort -r|head -n 10

echo *********DESKTOP TOP 10**************
cd ~/Desktop/
du -d 1 . | awk '{printf "%010d %s\n", $1, $2  }'|sort -r|head -n 10

