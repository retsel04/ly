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
			
			echo "Critical threshold should be greather than warning threshold";
		
		fi	
		
	echo $usage_percentage
	echo $crit
		
		if (( $usage_percentage >= $crit )); then
		
SUBJECT="$(date +"%Y%m%d %H: %M") memory check critical"
MESSAGE="/tmp/Mail.out
TO="$email"
	echo "Memory Usage is: $usage_percentage%" >> $MESSAGE
	echo "Top 10 processess that uses a lot of memory " >> $MESSAGE
	echo "$(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head )" >> $MESSAGE
		mail -s "SUBJECT" "$TO" < $MESSAGE
	#####rm /tmp/Mail.out
	
		fi
	
exit	
	
		
		
		