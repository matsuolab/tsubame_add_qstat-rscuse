#!/bin/sh
cd $HOME
mkdir $HOME/commands
echo 'export PATH=$HOME/commands:$PATH' >> $HOME/.bash_profile
source $HOME/.bash_profile

printf "%s\n" "qstat -f | awk '" "/all.q@/{" '  split($3,a,"/")' '  resv=a[1]; used=a[2]; total=a[3]' '  idle=total-used' '' '  nodes++' '  total_slots+=total' '  used_slots+=used' '  resv_slots+=resv' '  idle_slots+=idle' '' '  if (used==0) idle_nodes++' '  if (idle>0) nodes_with_idle++' '  if (idle>=64)  idle_64_nodes++' '  if (idle>=128) idle_128_nodes++' '  if (idle>=192) idle_192_nodes++' '}' 'END{' '  printf "Nodes total              : %d\n", nodes' '  printf "Slots total              : %d\n", total_slots' '  printf "Slots used               : %d\n", used_slots' '  printf "Slots reserved           : %d\n", resv_slots' '  printf "Slots idle physical      : %d\n", idle_slots' '  printf "Utilization used/total   : %.1f%%\n", used_slots/total_slots*100' '  printf "Idle physical/total      : %.1f%%\n", idle_slots/total_slots*100' '  printf "Idle node equivalent     : %.1f nodes\n", idle_slots/192' '  printf "Nodes with idle slot     : %d\n", nodes_with_idle' '  printf "Nodes with >=64 idle     : %d\n", idle_64_nodes' '  printf "Nodes with >=128 idle    : %d\n", idle_128_nodes' '  printf "Nodes with >=192 idle    : %d\n", idle_192_nodes' "}'" >> "$HOME/commands/qstat-rscuse"


chmod 755 $HOME/commands/qstat-rscuse
