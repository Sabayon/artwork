#! /bin/bash

if [ -z "$1" ]; then
    echo "Ian Whymans Automagical Image Resizing Thingie v1.0"
    echo ""
    echo "usage: $0 fbsplash input output aspect(normal/wide/all)"
    echo "usage: $0 ksplash input"
    exit
fi

# 4:3
RES1="640x480"
RES2="800x600"
RES3="1024x768"
RES4="1280x1024"
RES5="1400x1050"
RES6="1600x1200"

# 16:10
RES7="1280x800"
RES8="1440x900"
RES9="1680x1050"
RES10="1920x1200"

if [ $1 = fbsplash ]
then
    if [ $4 = normal ]
        then
        RESES="$RES1 $RES2 $RES3 $RES4 $RES5 $RES6" 
    elif [ $4 = wide ]
        then
        RESES="$RES7 $RES8 $RES9 $RES10"
    elif [ $4 = all ]
        then
        RESES="$RES1 $RES2 $RES3 $RES4 $RES5 $RES6 $RES7 $RES8 $RES9 $RES10"
    else
        echo "please choose normal, wide or all apsect ratios"
    fi
        
    echo "Creating Images size: "$RESES""
    for i in ${RESES}
    do
        convert $2 -filter Lanczos -resize ${i}\! $3-${i}.png
        echo "converting ${2} to ${3}-${i}.png"
    done

elif [ $1 = ksplash ]
    then
    for i in $RES1 $RES2 $RES3 $RES4 $RES6 $RES10
    do
        mkdir $i
        convert $2 -filter Lanczos -resize $i\! $i/background.png
        echo "converting ${2} to $i/background.png"
	done
	convert $2 -filter Lanczos -resize 400x300\! Preview.png

fi

echo ""
echo "Done"
