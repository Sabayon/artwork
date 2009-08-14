#! /bin/bash
VERSION=${1}
FOLDERS="core gnome kde extra"

mkdir /home/v00d00/build/sabayon/artwork-ztarballs/${VERSION}
for tarball in ${FOLDERS}; do
	echo "Compressing sabayon-artwork-${tarball}"
	tar -c --file=sabayon-artwork-${tarball}.tar sabayon-artwork-${tarball}
	lzma -9v -F lzma -S .lzma sabayon-artwork-${tarball}.tar
	echo "Moving sabayon-artwork-${tarball}"
	mv sabayon-artwork-${tarball}.tar.lzma /home/v00d00/build/sabayon/artwork-ztarballs/${VERSION}/sabayon-artwork-${tarball}-${VERSION}.tar.lzma
done
	
