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

echo "Available   : `df -H | grep disk1| awk '{print $4}'`"
echo "Total Disk  : `df -H | grep disk1| awk '{print $2}'`"





