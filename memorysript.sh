#!/bin/bash
clear

echo -e "Hello there!\nPlease be advised that if the provided number = or if the provided number is higher \nthan the current memory, we will create a file with this information located in /var/log/memoryfile.txt and email it to the admin"
echo

echo

read -p "provide us with a number for this script, to check if the memory is = or > to it. PROVIDE THE NUMBER HERE:" number

memo=$(free -h | awk '{print $1, $3}' | head -2 | tail -1 | cut -d ":" -f2| cut -d "M" -f1)

if [ $number -ge $memo ]; then

	echo 	
	
	touch /var/log/memoryfile.txt
	
	echo -e "Problem found the provided number is either hitting the limit or surpassing it.\nThe current memory is $memo"

	echo " Problem found the provided number is either hitting the limit or surpassing it...$memo " > /var/log/memoryfile.txt && mail -s "CHECK MEMORY" ivanignatov9624@gmail.com < /var/log/memoryfile.txt
	
	echo


else

	echo "No problem found"

fi
