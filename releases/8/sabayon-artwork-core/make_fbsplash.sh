#!/bin/bash

SILENT_SVG_16_9="../_devel/fbsplash_silent_16_9.svg"
VERBOSE_SVG_16_9="../_devel/fbsplash_verbose_16_9.svg"
SILENT_SVG_4_3="../_devel/fbsplash_silent_4_3.svg"
VERBOSE_SVG_4_3="../_devel/fbsplash_verbose_4_3.svg"

RESOLUTION_4_3="
640x480
800x600
1024x768
1152x864
1280x1024
1400x1050
1600x1200
"
RESOLUTION_16_9="
1024x600
1280x720
1280x800
1366x768
1440x900
1680x1050
1920x1080
1920x1200
"

RASTER_EXT=".png"
VERBOSE_PREFIX="verbose-"
SILENT_PREFIX="silent-"

THEME_DIR="fbsplash/sabayon/images"

for pfx in ${VERBOSE_PREFIX} ${SILENT_PREFIX}; do
    for res in ${RESOLUTION_4_3}; do
        if [ "${pfx}" = "${VERBOSE_PREFIX}" ]; then
            src_svg="${VERBOSE_SVG_4_3}"
        else
            src_svg="${SILENT_SVG_4_3}"
        fi
        echo "Doing 4:3 -> ${pfx}${res}"
        convert -resize "${res}" "${src_svg}" \
            "${THEME_DIR}/${pfx}${res}${RASTER_EXT}" || exit 1
    done
    for res in ${RESOLUTION_16_9}; do
        if [ "${pfx}" = "${VERBOSE_PREFIX}" ]; then
            src_svg="${VERBOSE_SVG_16_9}"
        else
            src_svg="${SILENT_SVG_16_9}"
        fi
        echo "Doing 16:9 -> ${pfx}${res}"
        convert -resize "${res}" "${src_svg}" \
            "${THEME_DIR}/${pfx}${res}${RASTER_EXT}" || exit 1
    done
done
