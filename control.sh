#!/bin/bash

SPLASH_BIN=./ovgsplash
SPLASH_IMAGE=images/back.jpg
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

init_splash $SPLASH_IMAGE

sleep 5

change_screen "images/screen.jpg"

sleep 5

end_splash

echo "Finished"
