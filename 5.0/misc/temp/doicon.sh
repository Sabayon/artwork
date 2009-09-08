#! /bin/bash

if [ -z "$1" ]; then
    echo "Icon Resizer"
    echo "Base SVG must be in same dir as script"
    echo "usage: $0 input.svg icon-name category"
    exit
fi

mkdir oxygen-icons-sabayon
cp $1 oxygen-icons-sabayon
cd oxygen-icons-sabayon

for i in 8x8 16x16 22x22 32x32 48x48 64x64 128x128 256x256
  do
  mkdir $i
  mkdir $i/$3
  convert -filter Lanczos -background \#00000000 -resize $i\! $1 $i/$3/$2.png
  echo "converting ${1} to $i/$3/$2.png"
done

mkdir scalable
mkdir scalable/$3
cp $1 ./scalable/$3/$2
gzip --suffix=svgz scalable/$3/$2
echo "moving ${1} to scalable/$3/$2.svgz"

rm $1
