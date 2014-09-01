#!/bin/bash

SPLASH_BIN=./ovgsplash.bin
FIFO=FIFO

change_screen() {
	echo $(realpath $1) > FIFO
	echo "Changing to $1"
}

init_splash() {
	mkfifo $FIFO
	(tail -f $FIFO | $SPLASH_BIN $1) &
	PID=$!
}

end_splash() {
	echo \n > $FIFO
	pkill -TERM -P $PID
	rm $FIFO
}
