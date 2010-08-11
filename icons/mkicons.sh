#! /bin/bash

if [ -z "$1" ]; then
    echo "Icon Resizer"
    echo "Base SVG must be in same dir as script"
    echo "usage: $0 input.svg category icon-name"
    exit
fi

mkdir fdo-icons-sabayon
cp $1 fdo-icons-sabayon
cd fdo-icons-sabayon

for i in 8x8 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256 ; do
  echo "converting ${1} to $i/$2/$3.png"
  mkdir -p $i/$2
  convert -filter Lanczos -background \#00000000 -resize $i\! $1 $i/$2/$3.png
done

echo "moving ${1} to scalable/$2/$3.svgz"
mkdir -p scalable/$2
cp $1 ./scalable/$2/$3.svg
gzip -c scalable/$2/$3.svg > scalable/$2/$3.svgz

rm $1
