SUBDIRS=sabayon-artwork-core

include make.include

all:
	for d in $(SUBDIRS); do $(MAKE) -C $$d; done

clean:
	for d in $(SUBDIRS); do $(MAKE) -C $$d clean; done

push:
	for d in $(SUBDIRS); do $(MAKE) -C $$d push; done