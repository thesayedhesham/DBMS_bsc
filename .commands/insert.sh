#!/bin/bash
shopt -s extglob
chkType(){

	if [ $1 ]
	then 
		case $1 in 
			+([A-Za-z])) type="String"
				;;
			+([0-9])) type="Number"
				;;
			+([A-za-z0-9@#$%^&*])) type="Mix"
				;;
			*) echo "Enter a Valid Value"
		esac		
	fi
	}
echo "Enter the table name you want to insert into:"
ls -p | grep -v /
echo "----------------------------------------------------------------------"
read tname
echo "----------------------------------------------------------------------"
if [ -f "$tname" ]; then
tempo=`awk -F: '{print NF}' .$tname | sort -nu | tail -n 1`
echo $tempo
	x=$tempo
	felid=2
	while [ $tempo -gt 0 ]
		do	
			if  [ $tempo -eq $x ]
			then 
				ftype=`awk -F: '{print $1}' .$tname | tail -n 1`
				fname=`awk -F: '{print $1}' .$tname | head -n 1`	
				echo "Enter $fname (P.K)"
				read pk
				chkType $pk
				if [ $ftype = $type ]
				then 
					unpk="`cat $tname | grep -w "^$pk"`" 
					if [ "$unpk" ]
					then echo "This P.K alredy Existes";continue
					else
					array[$tempo]=$pk
					tempo=$(($tempo-1))
					fi
				else echo "Enter a Vaild Value";
				fi
			else
				ftype=`awk -F: '{print '$+$felid'}' .$tname | tail -n 1`;	
				fname=`awk -F: '{print '$+$felid'}' .$tname | head -n 1`
				echo "Enter Value OF $fname"
				read fel
				chkType $fel
				if [ $ftype = $type ]
				then 
					array[$tempo]=$fel;
					tempo=$(($tempo-1));
					felid=$(($felid+1));
				else echo "Enter a Vaild Value";continue
				fi
			fi
		done

else
	echo "$tname isn't a valid table name."; . ../.commands/insert.sh
fi

	reverse() {
	    declare -n arr="$1" rev="$2"
	    for i in "${arr[@]}"
	    do
		rev=("$i" "${rev[@]}")
	    done
	}
	reverse array reversed
	IFS=":"
	echo "${reversed[*]}" >> $tname
	echo "Inserted into table successfully."
	unset array
   	unset reversed


