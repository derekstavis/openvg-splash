#!/bin/bash

source ovgsplash.sh

init_splash $SPLASH_IMAGE
sleep 5
change_screen "images/screen.jpg"
sleep 5
end_splash
echo "Finished"
