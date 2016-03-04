##
##  Makefile for mp
##

CFLAGS = -W -Wall -std=c99 -O2 -s
#CFLAGS = -W -Wall -std=c99 -g

CC_LINUX32        = gcc
CC_LINUX64        = gcc
CC_WINDOWS32      = /usr/bin/i686-w64-mingw32-gcc
CC_WINDOWS64      = /usr/bin/x86_64-w64-mingw32-gcc
CC_OSX32          = /usr/bin/i686-apple-darwin10-gcc
CC_OSX64          = /usr/bin/i686-apple-darwin10-gcc

CFLAGS_LINUX32    = $(CFLAGS) -m32 -DLINUX
CFLAGS_LINUX64    = $(CFLAGS) -m64 -DLINUX
CFLAGS_WINDOWS32  = $(CFLAGS) -m32 -DWINDOWS
CFLAGS_WINDOWS64  = $(CFLAGS) -m64 -DWINDOWS
CFLAGS_OSX32      = $(CFLAGS) -m32 -DOSX
CFLAGS_OSX64      = $(CFLAGS) -m64 -DOSX

all: mp64.bin

mp32: mp32.bin mp32.exe mp32.app
mp64: mp64.bin mp64.exe mp64.app

clean:
	rm -f -R ./bin

mp32.bin: ./src/mp.c
	mkdir -p ./bin
	-$(CC_LINUX32)   $(CFLAGS_LINUX32)   -o ./bin/$@ $^

mp64.bin: ./src/mp.c
	mkdir -p ./bin
	-$(CC_LINUX64)   $(CFLAGS_LINUX64)   -o ./bin/$@ $^

mp32.exe: ./src/mp.c
	mkdir -p ./bin
	-$(CC_WINDOWS32) $(CFLAGS_WINDOWS32) -o ./bin/$@ $^

mp64.exe: ./src/mp.c
	mkdir -p ./bin
	-$(CC_WINDOWS64) $(CFLAGS_WINDOWS64) -o ./bin/$@ $^

mp32.app: ./src/mp.c
	mkdir -p ./bin
	-$(CC_OSX32)     $(CFLAGS_OSX32)     -o ./bin/$@ $^

mp64.app: ./src/mp.c
	mkdir -p ./bin
	-$(CC_OSX64)     $(CFLAGS_OSX64)     -o ./bin/$@ $^
