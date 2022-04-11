#!/bin/sh
month=$(date +%m) # getting the month (01..12)
day=$(date +%d) # getting the day (01..31)

# If the day begins with a 0, like 01..09, remove the 0. We do this for compatibility in the calculation.
if [[ $day == 0* ]]; then
	day=${day#?}
fi

# If the month begins with a 0, like 01..09, remove the 0. We do this for compatibility in the calculation.
if [[ $month == 0* ]]; then
	month=${month#?}
fi

# Here we define how many days all months have.
if [ $month == 1 ]; then
	daysofmonth=31
elif [ $month == 2 ]; then
	daysofmonth=28
elif [ $month == 3 ]; then
	daysofmonth=31
elif [ $month == 4 ]; then
	daysofmonth=30
elif [ $month == 5 ]; then
	daysofmonth=31
elif [ $month == 6 ]; then
	daysofmonth=30
elif [ $month == 7 ]; then
	daysofmonth=31
elif [ $month == 8 ]; then
	daysofmonth=31
elif [ $month == 9 ]; then
	daysofmonth=30
elif [ $month == 10 ]; then
	daysofmonth=31
elif [ $month == 11 ]; then
	daysofmonth=30
elif [ $month == 12 ]; then
	daysofmonth=31
fi

monthsleft=$(( 7 - $month - 1 )) # getting how many months left until July
daysleft=$(( $daysofmonth - $day )) # getting how many days left until the end of the month

# For months > 9: plus 12. Otherwise we would get a negative result.
if [[ $monthsleft == -* ]]; then
	monthsleft=$(( $monthsleft + 12 ))
fi

# For when it's less than a month until July 1st: plus days of the active month. Otherwise we would get a negative result.
if [[ $daysleft == -* ]]; then
	daysleft=$(( $daysleft + $daysofmonth ))
fi

echo "$monthsleft month(s) and $daysleft day(s) left until big vacation."
