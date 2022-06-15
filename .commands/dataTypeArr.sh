#!/bin/bash
PS3="Your Answer > "

#------------------------------------------------------------------------------------------------------------------
#echo "Enter Table Name"
#read $tbname
echo $ct
echo "Enter Number of Table Column:"
read colNum
x=$colNum
col=1
case $colNum in 
	[0-9]) while [ $colNum -gt 0 ]
		do 
		  echo "Enter Name of Column $col"
		  read colname
		  	if [ $colname ]
		  	then
		  	feildArry[$colNum]=$colname;col=$(($col + 1)) 
		  	else echo "Enter a Valid Name";continue
		  	fi
		  select ch in "String" "Numbers" "Mix"
		  do
		  	case $ch in 
		  		"String") dataArray[$colNum]="String";colNum=$(($colNum - 1));break
		  				;;
		  		"Numbers") dataArray[$colNum]="Number";colNum=$(($colNum - 1));break
		  				;;
		  		"Mix") dataArray[$colNum]="Mix";colNum=$(($colNum - 1));break
		  	esac
		  done
	       done 
		 ;;
	*) echo "Please Enter a Valid Value";./../.commands/dataTypeArr.sh	
esac

#---------------------------------------------------------------------------------------------------------------------

reverse() {
    declare -n arr="$1" rev="$2"
    for i in "${arr[@]}"
    do
        rev=("$i" "${rev[@]}")
    done
}

reverse feildArry feildArray2

IFS=":"
echo "${feildArray2[*]}" > .$ct

reverse dataArray dataArray2
IFS=":"
echo "${dataArray2[*]}" >> .$ct

touch $ct
unset feildArray
unset dataArray
unset feildArray2
unset dataArray2





#--------------------------------------------------------------------------------------------------------------------
