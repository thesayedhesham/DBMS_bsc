#!/bin/bash -x
shopt -s extglob
PS3="Enter your options: "
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
						export ct
						./../.commands/dataTypeArr.sh
						echo "table $ct created."
					fi
					;;
				*) echo "Please enter a table name"
			esac
			;;
		2) tlist=`ls -p | grep -v '/'`
			if [ "$tlist" ]
			then
				echo $tlist
				echo "Tables listed successfully."
			else
				echo "No tables found"
			fi
			;;
		3) echo "Enter the table name to drop:"
			ls -p | grep -v /
			read dt

			if [ -f "$dt" ]; then
				while true; do
				    read -p "Do you wish to drop this table?'all of its content will be deleted' " yn
				    case $yn in
					[Yy]* ) rm $dt
						rm .$dt
						echo "Table $dt dropped successfully."
						break
						;;
					[Nn]* ) break
						;;
					* ) echo "Please answer yes or no.";;
				    esac
				done
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
				isempt=`cat $sft | wc -l`
				if [ $isempt -eq 0 ]
				then
					echo "table is empty"
				else
				select sopt in "Select specific record" "Select all table data"
				do
					case $REPLY in
					1) echo "enter the primary key of your record"
						read pk
						epk="`cat $sft | grep -w "^$pk"`"
						if [ "$epk" ]
						then
							echo "$epk"
							echo "Selected from table $sft successfully."
													
						else
							echo "Field not found";
							
						fi
						break
						;;
					2) cat $sft
						break
						;;
					* ) echo "Please enter an option."
						
						;;
					esac
					
				done
				fi
			else
				echo "no table named $sft."
			fi	
			;;
		6) echo "Enter the table name you want to delete from:"
			ls -p | grep -v '/'
			read dft
			if [ -f "$dft" ]; then
				isempt=`cat $dft | wc -l`
				if [ $isempt -eq 0 ]
				then
					echo "table is empty"
				else
					echo "enter the primary key of your field you want to delete"
					read pk
					dpk="`cat $dft | grep -w "^$pk"`"
					echo $dpk
					if [ "$dpk" ]
					then
						while true; do
						    read -p "Do you wish to delete this record?" yn
						    case $yn in
							[Yy]* ) `grep -vw "$pk" $dft > temp ; mv temp $dft`
								echo "Deleted from table $dft successfully."
								break
								;;
							[Nn]* ) break
								;;
							* ) echo "Please answer yes or no.";;
						    esac
						done	
					else
						echo "Field not found";
					fi
				fi
			else
				echo "no table named $dft"
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


