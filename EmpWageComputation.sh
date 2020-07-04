

echo "Welcome to Employee Wage Computation Program on Master Branch "

#!/bin/bash -x

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

if [ "$employ" == "Present" ]
then
	Employwageperhour=20
	Empworkhour=8
	dailyemploywage=$(($Employwageperhour * $Empworkhour))
	echo "Wage of $name who does full time is : "$dailyemploywage
else
	dailyemploywage=0
	echo "Employee Name $name was Absent today : "$dailyemploywage
fi


if [ "$employ" == "Present" ]
then
	Employwageperhour=20
	Empworkhour=8
	partime=$(($Empworkhour/2))
	parttimeemploywage=$(($Employwageperhour * $partime))
	echo "Wage of $name who does part time is : " $parttimeemploywage
else
	parttimeemploywage=0
	echo "Employee Name $name was Absent today : "$dailyemploywage
fi
