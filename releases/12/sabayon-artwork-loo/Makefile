
include ../make.include

DIR_NAME := $(shell basename $(CURDIR))
TARBALL_NAME := $(DIR_NAME)-$(VERSION).tar.xz
PKG_CATEGORY := x11-themes
PKG_PUSH_DIR = $(PUSH_DIR)/$(PKG_CATEGORY)/$(DIR_NAME)

all: scripts cook

scripts:
	./make_images.sh

cook:
	tar -cJf ../$(TARBALL_NAME) \
		../$(DIR_NAME) --exclude Makefile \
		--exclude .gitignore \
		--exclude *.tar.xz \
		--exclude *.sh

clean:
	rm -f ../$(TARBALL_NAME)

push:
	ssh -p $(PUSH_PORT) $(PUSH_USER)@$(PUSH_SERVER) \
		mkdir -p $(PKG_PUSH_DIR)
	scp -P $(PUSH_PORT) ../$(TARBALL_NAME) \
		$(PUSH_USER)@$(PUSH_SERVER):$(PKG_PUSH_DIR)/

