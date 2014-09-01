INCLUDEFLAGS=-I/opt/vc/include -I/opt/vc/include/interface/vmcs_host/linux -I/opt/vc/include/interface/vcos/pthreads
LIBFLAGS=-L/opt/vc/lib -lGLESv2 -lEGL -lbcm_host -lpthread -ljpeg -lshapes
BINARY=ovgsplash.bin

all: splash

splash:	openvg-splash.c 
		gcc -Wall $(INCLUDEFLAGS) $(LIBFLAGS) -o $(BINARY) $?

