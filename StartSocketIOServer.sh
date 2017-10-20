#!/bin/bash

VideoPath=$1
VideoName=${VideoPath##*/}
index=0
ReapeatTime=$2;
while ((ReapeatTime--)); do
	((index++))
	OutputName=$VideoName'.txt'
	node ./server/socket_server.js | tee -a ./head_tracking_log/$OutputName
	if [[ ${PIPESTATUS[0]} -ne "0" ]]
	then
		rm -f ./head_tracking_log/$OutputName
	fi
done
$SHELL
