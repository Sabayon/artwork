#!/bin/bash

SOURCE_SVG="../_devel/grub.svg"
IMAGE_NAME="default-splash.png"
THEME_DIR="images"

convert -resize 1024x768 "${SOURCE_SVG}" \
    "${THEME_DIR}/${IMAGE_NAME}" || exit 1

