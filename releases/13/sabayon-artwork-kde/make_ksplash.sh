#!/bin/bash

SOURCE_SVG="../_devel/wallpaper_final_kgdm.svg"

RESOLUTIONS="
640x400
800x600
1024x768
1280x1024
1600x1200
1920x1200
"
IMAGE_NAME="background.png"
PREVIEW_NAME="Preview.png"
THEME_DIR="ksplash/Sabayon"

for res in ${RESOLUTIONS}; do
    echo "Doing -> ${res}"
    convert -resize "${res}" "${SOURCE_SVG}" \
        "${THEME_DIR}/${res}/${IMAGE_NAME}" || exit 1
done
convert -resize 400x250 "${SOURCE_SVG}" "${THEME_DIR}/${PREVIEW_NAME}"

