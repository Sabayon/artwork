#! /bin/bash

if [ -z "$1" ]; then
    echo "Ian Whymans Automagical Image Resizing Thingie v1.1 - CoreCD Version"
    echo ""
    echo "usage: $0 input output"
    exit
fi

# 4:3 Only on CoreCD
RES1="800x600"
RES2="1024x768"
RES3="1280x1024"
RES4="1400x1050"
RES5="1600x1200"

RESES="$RES1 $RES2 $RES3 $RES4 $RES5" 

echo "$RESES"

for i in ${RESES}
do
    convert $1 -filter Lanczos -resize ${i}\! $2-${i}.jpg
    echo "converting ${1} to $2-${i}.jpg"
done

echo ""
echo "Done"
