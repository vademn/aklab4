ifneq ($(KERNELRELEASE),)
# kbuild part of makefile
obj-m   := hello1.o hello2.o
else
# normal makefile
KDIR ?= /lib/modules/`uname -r`/build
INC_DIR := inc

all:
	$(MAKE) -C $(KDIR) M=$$PWD EXTRA_CFLAGS="-I$(PWD)/$(INC_DIR)" modules

clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean
endif

