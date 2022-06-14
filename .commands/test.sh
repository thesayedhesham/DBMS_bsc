#!/bin/bash
shopt -s extglob
echo "Enter the table name you want to insert into:"
ls -p | grep -v /
read tname
if [ -f "$tname" ]; then
	echo -n "Enter Number Of Table Columns? "
	read columNum
	x=$columNum
	if [ $? -eq 0 ]
	then  
		case $columNum in
		[0-9]) 	while [ $columNum -gt 0 ]
			do	
				if  [ $columNum -eq $x ]
				then echo "Enter P.K"
					read pk
					case $pk in		
						+([A-Za-z0-9!@#$%^&*])) 
							array[$columNum]=$pk
							columNum=$(($columNum-1))
							;;
						*) echo "Enter a Valid Value of P.K"
					esac
				
				else
					
					echo "Enter Name Of $columNum Field? "
					read ans
					if [ $ans ]
						then
						array[$columNum]=$ans
						columNum=$(($columNum-1))
						else array[$columNum]="null"
						columNum=$(($columNum-1))
						
					fi
				fi
					
		
			done
			;;
		*) echo "Enter Valid Value";
		esac	
	fi

	reverse() {
	    declare -n arr="$1" rev="$2"
	    for i in "${arr[@]}"
	    do
		rev=("$i" "${rev[@]}")
	    done
	}

	reverse array reversed
	echo ${reversed[*]} > $tname
	echo "Inserted into table successfully."
else
	echo "$tnameno isn't a valid table name."
fi	
