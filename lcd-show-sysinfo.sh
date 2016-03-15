#!/bin/bash
# written by Yannick Zwijsen 
# 03/2016

DELAY=5
ADDRESS=82 #change this number to the one shown on your lcd screen on startup eg: a:82

function clearLCD {
	/usr/bin/bw_tool -a $ADDRESS -w 10:0
}

function selectLineLCD {
	if [ "$1" = "1" ]; then /usr/bin/bw_tool -a $ADDRESS -w 11:00; fi
	if [ "$1" = "2" ]; then /usr/bin/bw_tool -a $ADDRESS -w 11:20; fi
}

function printLCD {
	/usr/bin/bw_tool -a $ADDRESS -t $1
}

function finish {
	clearLCD
	selectLineLCD 1
	printLCD "Shutting down..."
}

#run finish function when script is stopped or rpi is rebooted/shutdown
trap finish EXIT

#start infinite loop 
while :
do
	#show cpu info
	clearLCD
	CPULOAD=`uptime | awk -F'[a-z]:' '{print $2}'`
	selectLineLCD 1
	printLCD "Load Average:"
	selectLineLCD 2
	printLCD "$CPULOAD"
	sleep $DELAY
	
	#show mem info
	clearLCD
	MEMTOTAL=`free | grep Mem | awk '{print int($2 / 1024)}'`
	MEMUSED=`free | grep Mem | awk '{print int($3/$2 * 100.0)}'`
	selectLineLCD 1
	printLCD "Memory Usage:"
	selectLineLCD 2
	printLCD "${MEMUSED}% of ${MEMTOTAL}mb"
	sleep $DELAY

	#show ip address if set
	IPADDR=`hostname --all-ip-addresses`
	if [ "$IPADDR" != "" ]
	then
		clearLCD
		selectLineLCD 1
		printLCD "IP:"
		selectLineLCD 2
		printLCD "$IPADDR"
		sleep $DELAY
	fi
done
