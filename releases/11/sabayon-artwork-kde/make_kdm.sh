#!/bin/bash

SOURCE_SVG="../_devel/wallpaper_final_kgdm.svg"

PREVIEW_NAME="screenshot.png"
THEME_DIR="kdm/sabayon"

convert -resize 400x250 "${SOURCE_SVG}" "${THEME_DIR}/${PREVIEW_NAME}"

