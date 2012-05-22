#!/bin/bash

SOURCE_SVG="../_devel/wallpaper_final.svg"

PREVIEW_NAME="sabayonlinux.png"
THEME_DIR="compiz"

convert -resize 1920x1200 "${SOURCE_SVG}" "${THEME_DIR}/${PREVIEW_NAME}"

