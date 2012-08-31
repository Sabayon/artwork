#!/bin/bash

SOURCE_SVG="../_devel/grub.svg"
IMAGE_NAME="default-splash.png"
THEME_DIR="images"

inkscape -z --export-png="${THEME_DIR}/${IMAGE_NAME}" \
            --export-area-page \
            --export-width="1024" \
            --export-height="768" \
            "${SOURCE_SVG}" || exit 1
