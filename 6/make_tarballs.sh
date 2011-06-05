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
	echo "Optimising PNG images..."
	find ${PKGNAME} -name "*.png" | xargs optipng -o2
	find ${PKGNAME} -name "*.png" | xargs advpng -z -4

	# Compression
	echo "Compressing ${PKGNAME}"
	tar -cJ --file=${PKGNAME}.out ${PKGNAME}
	echo "Moving ${PKGNAME}"
	mv ${PKGNAME}.out ${LOCALDIR}/${PKGNAME}-${VERSION}.tar.xz

	# Upload
	echo "Uploading ${PKGNAME}...."
	rsync --progress -ave ssh ${LOCALDIR}/${PKGNAME}-${VERSION}.tar.xz \
		${REMOTEHOST}:${REMOTEDIR}/${PKGNAME}/${PKGNAME}-${VERSION}.tar.xz
done

