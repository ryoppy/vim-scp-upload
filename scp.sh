#!/bin/bash

HOST=$1
USER=$2
PASS=$3
PORT=$4
LOCAL_PATH=$5
REMOTE_PATH=$6

expect -c "
set timeout 5
spawn scp -P ${PORT} ${LOCAL_PATH} ${USER}@${HOST}:${REMOTE_PATH}
expect {
	\"password:\" {
		send \"${PASS}\r\"
	}
}
interact
"
