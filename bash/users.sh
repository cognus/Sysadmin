#!/bin/bash
exec &> users.log
echo "Time now is: `date +%r`"
echo "Today is: `date +%d/%m/%y`"
echo "User logged @arquimedes are: "
echo "`who -s`"
echo "System is up since: `uptime`"


