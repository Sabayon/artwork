#! /bin/bash
VERSION=${1}
FOLDERS="core gnome kde extra loo lxde"
LOCALDIR="/home/v00d00/projects/sabayon/artwork-ztarballs/${VERSION}"
REMOTEHOST="ian@pkg.sabayon.org"
REMOTEDIR="/sabayon/rsync/rsync.sabayon.org/distfiles/x11-themes"

mkdir ${LOCALDIR}
for I in ${FOLDERS}; do
	export PKGNAME=sabayon-artwork-${I}

	# Optimise PNGs
	echo "Optimising PNG images"
	find ${PKGNAME} -name "*.png" | xargs optipng -o2
	find ${PKGNAME} -name "*.png" | xargs advpng -z -4

	# Compression
	echo "Compressing ${PKGNAME}"
	tar -cj --file=${PKGNAME}.tbz2 ${PKGNAME}
	#lzma -9v -F lzma -S .lzma ${PKGNAME}.tar
	echo "Moving ${PKGNAME}"
	mv ${PKGNAME}.tbz2 ${LOCALDIR}/${PKGNAME}-${VERSION}.tar.bz2

	# Upload
	rsync --progress -ave ssh ${LOCALDIR}/${PKGNAME}-${VERSION}.tar.bz2 \
		${REMOTEHOST}:${REMOTEDIR}/${PKGNAME}/${PKGNAME}-${VERSION}.tar.bz2
done

