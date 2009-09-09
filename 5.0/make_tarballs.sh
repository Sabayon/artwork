#! /bin/bash
VERSION=${1}
FOLDERS="core gnome kde extra"

mkdir /home/v00d00/build/sabayon/artwork-ztarballs/${VERSION}
for tarball in ${FOLDERS}; do
	echo "Compressing sabayon-artwork-${tarball}"
	tar -cj --file=sabayon-artwork-${tarball}.tar.bz2 sabayon-artwork-${tarball}
#	lzma -9v -F lzma -S .lzma sabayon-artwork-${tarball}.tar
	echo "Moving sabayon-artwork-${tarball}"
	mv sabayon-artwork-${tarball}.tar.bz2 /home/v00d00/build/sabayon/artwork-ztarballs/${VERSION}/sabayon-artwork-${tarball}-${VERSION}.tar.bz2
done
	
