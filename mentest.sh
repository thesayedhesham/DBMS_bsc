#!/bin/bash
shopt -s extglob
PS3="Enter your database options: "
select choice in "Create Database" "List Databases" "Connect To Databasess" "Drop Database" "exit"
do	
	case $REPLY in
		1) echo "Enter the name of the database you want to create:"
			read cdb
			case $cdb in
				+([A-Za-z0-9!@#$%^&*]))
					if [ -d "$cdb" ]; then
					    echo "$cdb already exists"
					else
						mkdir $cdb
						echo "Database $cdb created successfully."
					fi
					;;
				*) echo "Please enter a database name"
					continue
			esac
			;;
		2) dblist="`ls -d */ 2>/dev/null | cut -f1 -d'/'`"
			if [ "$dblist" ]
			then
				echo "$dblist"
				echo "Databases listed successfully."
			else
				echo "No databases found"
			fi		
			
			;;
		3) echo "Enter the database u want to connect to:"
			ls -d */ 2>/dev/null | cut -f1 -d'/'
			read db
				if [ -d "$db" ]; then
					. ./.commands/cd.sh $db
					echo "Connected to $db database"
					. ./../.commands/menu2.sh $db
				else
					echo "no available database named $db."
					continue 1
				fi
				;;
		4) echo "Enter the database u want to drop:"
			ls -d */ 2>/dev/null | cut -f1 -d'/'
			read rdb
			if [ -d "$rdb" ]; then
				while true; do
				    read -p "Do you wish to drop this database?'all of its tables will be deleted' " yn
				    case $yn in
					[Yy]* ) rm -r $rdb
						echo "Dropped database $rdb successfully."
						break
						;;
					[Nn]* ) break
						;;
					* ) echo "Please answer yes or no.";;
				    esac
				done

			else
				echo "no available database named $rdb."
			fi
			;;
		5) exit
			;;
		*) echo "Invalid option"
			;;
	esac
done
exit
