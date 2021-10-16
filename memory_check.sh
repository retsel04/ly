#!/bin/bash
#############################

##sendmail
TO"$email"

#####display memory size
free=$(free | grep Mem: | awk '{print$4}')
usage=$(free | grep Mem: | awk '{print$3}')
total_mem=$(free grep Mem: | awk '{print}')

	echo "Free space: $free";
	echo "Memory Usage: $usage";
	echo "Total Memory: $total_mem";

usage_percentage=$((usage * 100 / total_mem));
	echo "Memory Usage Percentae: $usage_percentage%";
	
	while getops c:w:e 'opts' do
		case "${opts}" in
			c) crit=${OPTARG};;
			w) warn=${OPTARG};;
			e) email=${OPTARG};;
		esac
	
	done
	
		echo "Critical: $crit% " "Warning: $warn% " " Email sent to:$email";
		
		if [[ -z "$crit" || -z "$warn" || -z "$email" ]]; then
		
		echo "Please provide all the requirements";

		fi
	
		if (( $"crit" <= "$warn" )); then
			
		echo "Critical threshold should be greater than warning threshold";
		
		fi	
###echo "Debug_0";		
	echo $usage_percentage
	echo $crit
##echo "Debug_1";		
		if (( $usage_percentage >= $crit )); then
		
SUBJECT="$(date +"%Y%m%d %H: %M") memory check critical"
MESSAGE="/tmp/Mail.out"
####echo "Debug_2";
	
####echo "Debug_3";	
TO="$email"
##echo "Debug_4";
	echo "Memory Usage is: $usage_percentage%" >> $MESSAGE
	echo "Top 10 processess that uses a lot of memory " >> $MESSAGE
	echo "$(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head )" >> $MESSAGE
		mail -s "SUBJECT" "$TO" < $MESSAGE
		rm /tmp/Mail.out	
	
exit 2
		fi
		
		if (( "$usage_percentage" >= "$warn" && "usage_percentage" < "$crit" )); then
			echo "Warning Memory Usage is greater than: $warn";
			
########echo "Exit 1"
	
exit 1

		fi
		
########echo "Exit 0"

exit 0	
		
		
		