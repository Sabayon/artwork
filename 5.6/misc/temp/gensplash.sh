#! /bin/bash

if [ -z "$1" ]; then
    echo "Thev00d00's Automagical Image Resizing Thingie v2.0"
    echo ""
    echo "usage: $0 fbsplash input output aspect(normal/wide/all) format"
    echo "usage: $0 ksplash input format"
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
RES11="1024x600"

#16:9
RES12="1280x720"
RES13="1366x768"
RES14="1920x1080"

R43="${RES1} ${RES2} ${RES3} ${RES4} ${RES5} ${RES6}"
R1610="${RES7} ${RES8} ${RES9} ${RES10} ${RES11}"
R169="${RES12} ${RES13} ${RES14}"

if [ $1 = fbsplash ]
then
    if [ $4 = normal ]
        then
		#convert $2 -crop '1600x1200!+160' $2-R43.png
        RESES="${R43}"
    elif [ $4 = wide ]
        then
        RESES="${R1610} ${R169}"
    elif [ $4 = all ]
        then
        RESES="${R43} ${R1610} ${R169}"
    else
        echo "please choose normal, wide or all apsect ratios"
    fi

    echo "Creating Images size: "$RESES""
    for i in ${RESES}
    do
		echo "converting ${2} to ${3}-${i}.${5}"
        convert $2 -filter Lanczos -quality 94 -resize ${i}\! $3-${i}.${5}
    done

elif [ $1 = ksplash ]
    then
    for i in 640x400 $RES2 $RES3 $RES4 $RES6 $RES10
    do
        mkdir $i
        convert $2 -filter Lanczos -quality 94 -resize $i\! $i/background.${3}
        echo "converting ${2} to $i/background.${3}"
	done
	convert $2 -filter Lanczos -resize 400x300\! Preview.png

fi

echo ""
echo "Done"
