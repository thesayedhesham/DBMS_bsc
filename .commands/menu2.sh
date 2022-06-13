#!/bin/bash
shopt -s extglob
PS3="Enter your table options: "
select choice in "Create Table" "List Tables" "Drop Table" "Insert into Table" "Select From Table" "Delete From Table" "Update Table" "return"
do	
	case $REPLY in
		1) echo "Enter the table name:"
			read ct
			case $ct in
				+([A-Za-z0-9!@#$%^&*]))
					if [ -f "$ct" ]; then
					    echo "$ct already exists"
					else
						touch $ct
						echo "table $ct created."
					fi	
					;;
				*) echo "Please enter a valid name"
			esac
			;;
		2) ls -p | grep -v /
			echo "Tables listed successfully."
			;;
		3) echo "Enter the table name to drop:"
			read dt
			case $dt in
				+([A-Za-z0-9!@#$%^&*]))
					if [ -f "$dt" ]; then
						rm -i $dt
						echo "Table $dt dropped successfully."
					else
						echo "no table named $dt."
					fi	
					;;
				*) echo "Please enter a valid name"
			esac
			;;
		4) . ./../.commands/test.sh
			;;
		5) echo "Enter the table you want to select from:"
			ls -p | grep -v /
			read sft
			case $sft in
				+([A-Za-z0-9!@#$%^&*]))
					if [ -f "$sft" ]; then
						cat $sft
						echo "Selected from table $sft successfully."
					else
						echo "no table named $sft."
					fi	
					;;
				*) echo "Please enter a valid name"
			esac
			;;
		6) echo "Enter the table name you want to delete from:"
			read dft
			case $dft in
				+([A-Za-z0-9!@#$%^&*]))
					if [ -f "$dft" ]; then
						echo "deleted from table $dft successfully."
					else
						echo "no table named $dft."
					fi	
					;;
				*) echo "Please enter a valid name"
			esac
			;;
		7) echo "Enter the table name you want to update:"
			read upt
			case $upt in
				+([A-Za-z0-9!@#$%^&*]))
					if [ -f "$upt" ]; then
						echo "Updated table $upt successfully."
					else
						echo "no table named $upt."
					fi	
					;;
				*) echo "Please enter a valid name"
			esac

			;;
		8) . ./../.commands/cd.sh ..
			. ./mentest.sh
			;;
		*) echo "Invalid option"
			;;
	esac
done
