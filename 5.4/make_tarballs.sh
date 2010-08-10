#! /bin/bash
VERSION=${1}
FOLDERS="core gnome kde extra ooo lxde"
FILENAME="sabayon-artwork-${tarball}-${VERSION}"
LOCALDIR="/home/v00d00/build/sabayon/artwork-ztarballs/${VERSION}"
REMOTEHOST="ian@sabayon.org"
REMOTEDIR="/home/sabayonlinux/public_html/distfiles.sabayon.org/x11-themes"

mkdir /home/v00d00/build/sabayon/artwork-ztarballs/${VERSION}
for tarball in ${FOLDERS}; do
	echo "Compressing sabayon-artwork-${tarball}"
	tar -cj --file=sabayon-artwork-${tarball}.tbz2 sabayon-artwork-${tarball}
#	lzma -9v -F lzma -S .lzma sabayon-artwork-${tarball}.tar
	echo "Moving sabayon-artwork-${tarball}"
	mv sabayon-artwork-${tarball}.tbz2 ${LOCALDIR}/sabayon-artwork-${tarball}-${VERSION}.tar.bz2
	
	#Upload
	rsync --progress -ave ssh ${LOCALDIR}/sabayon-artwork-${tarball}-${VERSION}.tar.bz2 \
		${REMOTEHOST}:${REMOTEDIR}/sabayon-artwork-${tarball}/sabayon-artwork-${tarball}-${VERSION}.tar.bz2
done

