#!/bin/bash

#Check if script was run as root. Exit if true.
if [ $UID -eq 0 ] 
 then
echo "Please do not run this script as root."
exit 
fi

#Define variables
output=$HOME/research/sys_info.txt
ip=$(ip addr | grep inet | tail -2 | head -1)
suids=$(sudo find / -type f -perm 777 2>/dev/null)
cpu=$(lscpu | grep CPU)
disk=$(df -H | head -2)

#Define lists to use later
commands=(
        'date'
        'uname -a'
        'hostname -s'
)

files=('/etc/passwd' '/etc/shadow')

#Check for research directory. Create if needed.
if [ ! -d $HOME/research ]; 
 then
 mkdir $HOME/research
 fi

# Check for output file. Clear it if needed.
if [ -f $output ]; 
 then 
> $output
fi
 
echo "A Quick System Audit Script" > $output
date >> $output
echo "" >> $output

for x in {0..2}; do
results=$(${commands[$x]})
echo "Results of "${commands[$x]}" command:" >> $output
echo $results >> $output
echo "" >> $output
done

#Display machine type info
echo "Machine Type Info:" >> $output
echo $MACHTYPE >> $output

#Display IP Address info
echo -e "Uname info: $(uname -a) \n" >> $output
echo -e "IP Info:" >> $output
echo -e "$ip /n" >> $output
echo -e "Hostname: $(hostname -s) \n" >> $output
echo "DNS Servers: " >> $output
cat /etc/resolv.conf >> $output
echo -e "\nMemory Info:" >> $output
free >> $output
echo -e "\nCPU Info:" >> $output
lscpu | grep CPU >> $output
echo -e "\nDisk Usage:" >> $output
df -H | head -2 >> $output
echo -e "\nWho is logged in: \n $(who -a) \n" >> $output
echo -e "\nExec Files:" >> $output
echo $execs >> $output
echo -e "\nTop 10 Processes" >> $output
ps aux --sort -%mem | awk {'print $1, $2, $3, $4, $11'} | head >> $output

#Loop that prints out permissions of files in list
for file in ${files[@]}
do
ls -l $file >> $output
fi

