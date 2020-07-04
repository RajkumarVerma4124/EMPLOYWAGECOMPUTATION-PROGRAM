

echo "Welcome to Employee Wage Computation Program on Master Branch "

#---------------------------------------------------------------------------------------------------------------------------------------------------

workhour (){
read -p "Enter the hours you work : " Empworkhour
echo $Empworkhour
}

#---------------------------------------------------------------------------------------------------------------------------------------------------

#!/bin/bash -x

printf "\n"
echo " checking if an employ is present or not "
printf "\n"
Attendence=$(( $RANDOM % 2 + 1 ))
if [ $Attendence -eq 1 ]
then
	employ="Present"
	read -p "Enter the Employ name : " name
	echo $employ
else
	employ="Absent"
	read -p "Enter the Employ name : " name
	echo $employ
fi

printf "\n"
echo " Calculating its daily wage if present "
printf "\n"
if [ "$employ" == "Present" ]
then
	Employwageperhour=20
	workhour
	dailyemploywage=$(($Employwageperhour * $Empworkhour))
	echo "Wage of $name who does full time is : "$dailyemploywage
else
	dailyemploywage=0
	echo "Employee Name $name was Absent today : "$dailyemploywage
fi

printf "\n"
echo " Calculating its part time wage if present "
printf "\n"
if [ "$employ" == "Present" ]
then
	partime=$(($Empworkhour/2))
	parttimeemploywage=$(($Employwageperhour * $partime))
	echo "Wage of $name who does part time is : " $parttimeemploywage
else
	parttimeemploywage=0
	echo "Employee Name $name was Absent today : "$dailyemploywage
fi

#------------------------------------------------------------------------------------------------------------------

printf "\n"
echo "Solving Using Switch case"
printf "\n"

while true
do
	echo "1.Check if employ is Present or not"
	echo "2.Wages of the employ who does full time"
	echo "3.Wages of the employ who does part time"
	echo "4.Exit"
	read -p "Enter your choice from above statements : " choice

	case $choice in

	"1")
	Attendence=$(( $RANDOM % 2 + 1 ))
	if [ $Attendence -eq 1 ]
	then
		employ="Present"
		read -p "Enter the Employ name : " name
		echo $employ
	else
		employ="Absent"
		read -p "Enter the Employ name : " name
		echo $employ
	fi
	;;

	"2")
	if [ "$employ" == "Present" ]
	then
		Employwageperhour=20
		workhour
		dailyemploywage=$(($Employwageperhour * $Empworkhour))
		echo "Wage of $name for full time is : "$dailyemploywage
		printf "\n"
		printf "\n"
	else
		echo "The employ $name is : " $employ
		printf "\n"
		printf "\n"
	fi
	;;

	"3")
	if [ "$employ" == "Present" ]
	then	
		workhour
		partworktime=$(($Empworkhour/2))
		parttimeemploywage=$(($Employwageperhour*$partworktime))
		echo "Wage of $name for part time is : "$parttimeemploywage
		printf "\n"
		printf "\n"
	else
		echo "The employ $name is : "$employ
		printf "\n"
		printf "\n"
	fi 
	;;

	4)
	break
	printf "\n"
	printf "\n"
	;;

	*) 
	echo invalid choice 
	;;

	esac
done

#---------------------------------------------------------------------------------------------------------------------------------------------------------


printf "\n"

echo "Calculating Wages for a Month - Assume 20 Working Day per Month"

printf "\n"

WorkingDayPerMonth=20
workhour
dailyemploywage=$(($Empworkhour*$Employwageperhour))
wagesperamonth=$(($dailyemploywage*$WorkingDayPerMonth))

echo "Wages Per Month of $name is : " $wagesperamonth

printf "\n"

#--------------------------------------------------------------------------------------------------------------------------------------------------

printf "\n"
echo " Calculate Wages till a condition of total working hours or days is reached for a month - Assume 100 hours and 20 days"
printf "\n"

read -p "Enter the Total hours you worked : " totaltime
read -p "Enter the total no. of days you worked : " totalday
newworktime=0
wages=0
days=0
dailyemploywages=160
parttimeemploywages=80
absentday=0
i=0
while [ $newworktime -le $totaltime -a $days -lt $totalday ]
do
	checkPresent=$(( $RANDOM % 3 + 1 ))
	if [ $checkPresent -eq 1 ]
	then
		newworktime=$(($newworktime+8))
		days=$(($days+1))
		i=$(($i+1))
		wages=$(($wages+$dailyemploywages))
		declare -A dayss=( [day]="DAY [$i]"   [wages]="FULLDAY WAGE :: $dailyemploywages"   [totalwage]="TOTAL WAGE :: $wages" )
		echo "WAGE IN    :  " ${dayss[@]}
	fi

	if [ $checkPresent -eq 2 ]
	then
		newworktime=$(($newworktime+4))
		days=$(($days+1))
		i=$(($i+1))
		wages=$(($wages+$parttimeemploywages))
		declare -A dayss=( [day]="DAY [$i]"   [wages]="PARTTIME WAGE :: $parttimeemploywages"   [totalwage]="TOTAL WAGE :: $wages" )
		echo "WAGE IN    :  " ${dayss[@]}
	fi
	
	if [ $checkPresent -eq 3 ]
	then
		days=$(($days+1))
		i=$(($i+1))
		declare -A dayss=( [day]="DAY [$i]"   [wages]="ABSENT DAY WAGE :: $absentday"   [totalwage]="TOTAL WAGE :: $wages" )
		echo "WAGE IN    :  " ${dayss[@]}
	fi
done
echo " Total wages of $name is : $wages "


#----------------------------------------------------------------------------------------------------------------------------------------------------------------

printf "\n"
echo " Storing the Daily Wage along with the Total Wage"
printf "\n"
dailyemploywage(){
Employwageperhour=20
dailyemploywage=$(($Employwageperhour * $Empworkhour))
}

parttimeemploywage(){
Employwageperhour=20
partime=$(($Empworkhour/2))
parttimeemploywage=$(($Employwageperhour * $partime))
}

checkifAvailable() {
person=$(($RANDOM%3+1))
if [ $person -eq 1 ]
then
	dailyemploywage
	employ=$dailyemploywage
elif [ $person -eq 2 ]
then
	parttimeemploywage
	employ=$parttimeemploywage
elif [ $person -eq 3 ]
then
	employ=0
fi
}

totalwage=0

read -p "Enter the number of days you want to work  : " days

workhour

echo $days

for((i=1; i<=$days; i++))
do
	checkifAvailable
	Day[$i]=$employ
	totalwage=$(($totalwage+${Day[$i]}))
echo Day $i " = " ${Day[$i]} " : " $totalwage
done
echo "Total wages of $name in $days days of work is : "$totalwage

