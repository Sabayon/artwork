SUBDIRS=sabayon-artwork-core sabayon-artwork-kde

include make.include

all:
	for d in $(SUBDIRS); do $(MAKE) -C $$d; done

clean:
	for d in $(SUBDIRS); do $(MAKE) -C $$d clean; done

push:
	for d in $(SUBDIRS); do $(MAKE) -C $$d push; done