#! /bin/bash

# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 42):
# <ian.whyman@sabayonlinux.org> wrote this file. As long as you retain this 
# notice you can do whatever you want with this stuff. If we meet some day,
# and you think this stuff is worth it, you can buy me a beer in return
# Ian Whyman
# ----------------------------------------------------------------------------

if [ "${1}" = "--help" ]; then
	echo "Fix Firefox Toolbar Script aka"
    echo "Fix Firefoxes Lack of Proper GTK Theming Script"
    echo ""
    echo "usage: $0 		- Install the fix in to current users home dir"
    echo "usage: $0 skel 	- Install the fix in to skel dir (requires root access)"
    echo ""
    echo "usage: $0 del	- Remove the fix in current users home dir"
    echo "usage: $0 skel del	- Remove the fix from skel dir (requires root access)"
    echo ""
    echo "This software is under the "THE BEER-WARE LICENSE" (Revision 42)"
    exit
fi
#if [ -f /etc/skel/.mozilla/firefox/*.default/chrome/userChrome.css ]; then

if [ -z "$1" ]; then
	if [ -f ~/.mozilla/firefox/*.default/chrome/userChrome.css ]; then
		echo "Found a userChrome.css, backing up"
		cd ~/.mozilla/firefox/*.default
		mv chrome/userChrome.css chrome/userChrome.css.orig
	fi

	echo "Copying css file"
	cd ~/.mozilla/firefox/*.default
	cp /usr/share/themes/Saburreza/gtk-2.0/userChrome.css chrome/userChrome.css
fi

if [ "$1" = "del" ]; then
	if [ -f ~/.mozilla/firefox/*.default/chrome/userChrome.css.orig ]; then
		echo "Found a Backup userChrome.css, restoring"
		cd ~/.mozilla/firefox/*.default
		mv chrome/userChrome.css.orig chrome/userChrome.css
	else
		echo "No Backup file. Removing userChrome"
		cd ~/.mozilla/firefox/*.default
		rm chrome/userChrome.css
	fi
fi

if [ "$1" = "skel" ]; then
	if [ -z "$2" ]; then
		if [ -f /etc/skel/.mozilla/firefox/*.default/chrome/userChrome.css ]; then
			echo "Found a userChrome.css, backing up"
			cd /etc/skel/.mozilla/firefox/*.default
			mv chrome/userChrome.css chrome/userChrome.css.orig
			
	cd /etc/skel/.mozilla/firefox/*.default
	cp /usr/share/themes/Saburreza/gtk-2.0/userChrome.css chrome/userChrome.css

	elif [ "$2" = "del" ]; then
		if [ -f /etc/skel/.mozilla/firefox/*.default/chrome/userChrome.css.orig ]; then
			echo "Found a Backup userChrome.css, restoring"
			cd /etc/skel/.mozilla/firefox/*.default
			mv chrome/userChrome.css.orig chrome/userChrome.css
		else
			echo "No Backup file. Removing userChrome"
			cd /etc/skel/.mozilla/firefox/*.default
			rm chrome/userChrome.css
		fi
	fi
fi


