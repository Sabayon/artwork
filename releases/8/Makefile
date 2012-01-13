SUBDIRS=sabayon-artwork-core sabayon-artwork-kde sabayon-artwork-gnome sabayon-artwork-extra sabayon-artwork-loo sabayon-artwork-lxde

include make.include

all:
	for d in $(SUBDIRS); do $(MAKE) -C $$d || exit 1; done

clean:
	for d in $(SUBDIRS); do $(MAKE) -C $$d clean || exit 1; done

push:
	for d in $(SUBDIRS); do $(MAKE) -C $$d push || exit 1; done
