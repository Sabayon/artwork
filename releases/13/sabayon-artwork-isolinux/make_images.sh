#!/bin/bash

SOURCE_SVG="../_devel/isolinux.svg"
IMAGE_NAME="back.jpg"
THEME_DIR="images"

convert -resize 640x480 "${SOURCE_SVG}" \
    "${THEME_DIR}/${IMAGE_NAME}" || exit 1

