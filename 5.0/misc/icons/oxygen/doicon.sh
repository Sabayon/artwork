#! /bin/bash

if [ -z "$1" ]; then
    echo "Icon Resizer"
    echo ""
    echo "usage: $0 input.svg icon-name category"
    echo ""
    exit
fi

for i in 8x8 16x16 22x22 32x32 48x48 64x64 128x128 256x256
  do
  mkdir $i
  mkdir $i/$3
  convert $1 -filter Lanczos -resize $i\! $i/$3/$2.png
  echo "converting ${1} to $i/$3/$2.png"
done
   mkdir scalable
   mkdir scalable/$3
   cp $1 ./scalable/$3/$2
   gzip --suffix=svgz scalable/$3/$2
   echo "moving ${1} to scalable/$3/$2.svgz"
