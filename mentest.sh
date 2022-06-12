#!/bin/bash
PS3="Enter your database options: "
select choice in "Create Database" "List Databases" "Connect To Databasess" "Drop Database" "exit"
do	
	case $REPLY in
		1) echo "Enter the name of the database you want to create:"
			read cdb
			mkdir $cdb
			echo "Database created successfully."
			;;
		2) ls -d */
			echo "Database listed successfully."
			;;
		3) echo "Enter the database u want to connect to:"
			read db
			. ./.commands/cd.sh $db
			echo "Connected to $db database"
			. ./../.commands/menu2.sh $db
			;;
		4) echo "Enter the database u want to drop:"
			ls -d */
			read rdb
			rm -d -i $rdb
			echo "Dropped database $rdb successfully."
			;;
		5) exit
			;;
		*) echo "Invalid option"
			;;
	esac
done
exit
