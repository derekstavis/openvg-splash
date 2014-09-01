openvg-splash
=============

This is a very simple tool to ease the plot of JPG images using OpenVG.
It is heavily based on @ajstaks libshapes. You can learn how to download
and install it here: [ajstarks/openvg](https://github.com/ajstarks/openvg)

# How to build

After you installed libshapes you can just enter on project directory and

	$ make

# How to use

There's two script files inside the directory. `ovgsplash.sh` contains
helper functions to initialize, control and close the daemon. You can 
check a example usage by running and checking `example.sh` source code.

# How `ovgsplash.bin` works

The `ovgsplash.bin` must be called with a default splash image that 
will be painted on initialization. After the splash is painted the 
program enters a finite loop, accepting next image path on `stdin`, 
ended by `\n` (newline) character. If the program gets a invalid
path or a EOF it will break and exit.

# Using bash to control it

As a convenience, you can just `source ovgsplash.sh`. It defines 
three helper functions:

	init_splash "splash.jpg"
	change_screen "error.jpg"
	end_splash

and three variables:

	SPLASH_BIN
    FIFO

# How it works

## `init_splash`

* Expect a parameter, the initial image file
* Create a named pipe, pointed by `$FIFO` variable
* Spawns a subshell piping `tail` and `$SPLASH_BIN` processes
* Store the PID of the subshell in the `$PID` variable

## `change_screen`

* Expect a parameter, the image file to paint
* `echo` the absolute path of file in the pipe `$PIPE`

## `end_splash`

* `echo` a `\n` on the pipe, causing `$SPLASH_BIN` to exit
* kills `$PID` and its subprocesses (at this time only `tail`)
* clean the pipe created by `init_splash`

