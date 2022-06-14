#!/bin/bash
shopt -s extglob
echo "Enter the table name you want to insert into:"
ls -p | grep -v /
read tname
if [ -f "$tname" ]; then
tempo=`awk '{print NF}' .$tname | sort -nu | tail -n 1`
	x=$tempo
	while [ $tempo -gt 0 ]
		do	
			if  [ $tempo -eq $x ]
			then 
				echo "Enter P.K"
				read pk
				case $pk in		
					+([A-Za-z0-9!@#$%^&*])) 
						opk=`grep "^$pk" tester | cut -d ":" -f1`
						if [ $opk ]
						then
							echo "pk must be unique";continue
						else
							array[$tempo]=$pk
							tempo=$(($tempo-1))
						fi
						;;
					*) echo "Enter a Valid Value of P.K"
				esac
			else
				
				echo "Enter Name Of $tempo Field? "
				read ans
				if [ $ans ]
					then
					array[$tempo]=$ans
					tempo=$(($tempo-1))
					else array[$tempo]="null"
					tempo=$(($tempo-1))
					
				fi
			fi
		done

	reverse() {
	    declare -n arr="$1" rev="$2"
	    for i in "${arr[@]}"
	    do
		rev=("$i" "${rev[@]}")
	    done
	}

	reverse array reversed
	IFS=":"
	echo ${reversed[*]} >> $tname
	unset array
	unset reversed
	echo "Inserted into table successfully."
else
	echo "$tname isn't a valid table name.";continue
fi
