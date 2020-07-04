

echo "Welcome to Employee Wage Computation Program on Master Branch "

#!/bin/bash -x

Attendence=$(( $RANDOM % 2 + 1 ))
if [ $Attendence -eq 1 ]
then
	employ="Present"
	echo $employ
else
	employ="Absent"
	echo $employ
fi

if [ "$employ" == "Present" ]
then
	Employwageperhour=20
	Empworkhour=8
	dailyemploywage=$(($Employwageperhour * $Empworkhour))
	echo $dailyemploywage
else
	dailyemploywage=0
	echo $dailyemploywage
fi
