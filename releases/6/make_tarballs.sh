#! /bin/bash
FOLDERS="core gnome kde extra loo lxde"
TMP_DIR="/tmp"
LOCALDIR="/home/v00d00/projects/sabayon/artwork-ztarballs/${VERSION}"
REMOTEHOST="ian@pkg.sabayon.org"
REMOTEDIR="/sabayon/rsync/rsync.sabayon.org/distfiles/x11-themes"

if [ -z ${1} ]; then
	echo "useage: ${0} Version"
	exit
else
	VERSION="${1}"
fi

if [ ! -d ${LOCALDIR} ]; then
	mkdir ${LOCALDIR}
fi

for I in ${FOLDERS}; do
	export PKGNAME=sabayon-artwork-${I}

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

