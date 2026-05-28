#!/bin/sh

X=1
while [ $X -ne 0 ]
do
	ss -o state all dport = ssh or sport = ssh | awk '{ print $5, $6 }' > notify-ssh.log1
	sleep 3
	ss -o state all dport = ssh or sport = ssh | awk '{ print $5, $6 }' > notify-ssh.log2
	result=$(diff -q notify-ssh.log1 notify-ssh.log2 | grep differ)
	if [[ -z "$result" ]]; then
	    	sleep 1
	else
    		play ./notify-ssh.mp3 
	fi
done
