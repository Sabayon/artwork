#!/bin/bash

SOURCE_ABOUT_SVG="../_devel/libreoffice_about.svg"
SOURCE_INTRO_SVG="../_devel/libreoffice_intro.svg"

INTRO_IMAGE_NAME="intro.png"
ABOUT_IMAGE_NAME="about.png"
THEME_DIR="images"

convert -resize 387x95 "${SOURCE_ABOUT_SVG}" \
    "${THEME_DIR}/${ABOUT_IMAGE_NAME}" || exit 1
convert -resize 640x400 "${SOURCE_INTRO_SVG}" \
    "${THEME_DIR}/${INTRO_IMAGE_NAME}" || exit 1

