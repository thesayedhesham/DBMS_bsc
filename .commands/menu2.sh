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
					export ct
				./../.commands/dataTypeArr.sh
					;;
				*) echo "Please enter a table name"
			esac
			;;
		2) tlist="`ls -p | grep -v '/'`"
			if [ $tlist ]
			then
				echo $tlist
				echo "Tables listed successfully."
			else
				echo "No tables found"
			fi
			;;
		3) echo "Enter the table name to drop:"
			read dt
			if [ -f "$dt" ]; then
				rm -i $dt
				rm -i .$dt
				echo "Table $dt dropped successfully."
			else
				echo "no table named $dt."
			fi	
			;;
		4) . ./../.commands/insert.sh
			;;
		5) echo "Enter the table you want to select from:"
			ls -p | grep -v /
			read sft
			if [ -f "$sft" ]; then
				echo "enter the primary key of your field"
				read pk
				opk=$pk
				epk="`cat $sft | grep -w "^$opk"`"
					if [ "$epk" ]
					then
						echo "$epk"
						echo "Selected from table $sft successfully."
							
					else
						echo "Field not found";
					fi
			else
				echo "no table named $sft."
			fi	
			;;
		6) echo "Enter the table name you want to delete from:"
			ls -p | grep -v '/'
			read dft
			if [ -f "$dft" ]; then
				echo "deleted from table $dft successfully."
			else
				echo "no table named $dft."
			fi	
			;;
		7) echo "Enter the table name you want to update:"
			ls -p | grep -v '/'
			read upt
			if [ -f "$upt" ]; then
				echo "Updated table $upt successfully."
			else
				echo "no table named $upt."
			fi	
			;;
		8) . ./../.commands/cd.sh ..
			. ./mentest.sh
			;;
		*) echo "Invalid option"
			;;
	esac
done
