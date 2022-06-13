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
		  feildArry[$colNum]=$colname;col=$(($col + 1)) 
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
	*) echo "Please Enter a Valid Value";break 	
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
echo ${feildArray2[*]} > .$ct

reverse dataArray dataArray2
echo ${dataArray2[*]} >> .$ct






#--------------------------------------------------------------------------------------------------------------------
