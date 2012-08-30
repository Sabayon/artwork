#!/bin/bash

FILE="/home/v00d00/projects/sabayon/artwork/5.6/sabayon-artwork-kde/ksplash/Sabayon/1600x1200/icon5.png"

convert out.png -size 1250x540 tile:$FILE 
