#!/bin/bash
PS3="Enter your table options: "
select choice in "Create Table" "List Tables" "Drop Table" "Insert into Table" "Select From Table" "Delete From Table" "Update Table" "return"
do	
	case $REPLY in
		1) echo "Enter the table name:"
			read ct
			touch $ct
			echo "table $ct created."
			;;
		2) ls -p | grep -v /
			echo "Tables listed successfully."
			;;
		3) echo "Enter the table name to drop:"
			read dt
			rm -i $dt
			echo "Table $dt dropped successfully."
			;;
		4) . ./../.commands/test.sh
			echo "Inserted into table successfully."
			;;
		5) echo "Enter the table name you want to select from:"
			read sft
			cat $sft
			echo "Selected from table $sft successfully."
			;;
		6) echo "Enter the table name you want to delete from:"
			read dft
			echo "Selected from table $dft successfully."
			;;
		7) echo "Enter the table name you want to update:"
			read upt
			echo "Updated table $upt successfully."
			;;
		8) . ./../.commands/cd.sh ..
			. ./mentest.sh
			;;
		*) echo "Invalid option"
			;;
	esac
done
