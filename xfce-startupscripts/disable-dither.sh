#!/bin/bash
#
# disable-dither.sh
# to view dither setting use xrandr --verbose
# xrandr disable dithering
#xrandr --output HDMI-1 --set "underscan" "auto"
#
xrandr --output DP-1 --set "dithering mode" "off"
#xrandr --output HDMI-1 --set "dithering mode" "off"
xrandr --output HDMI-1 --set "dithering mode" "off"
#xrandr --output HDMI-1 --set "dithering depth" "8 bpc"
#xrandr --output HDMI-1 --set "vibrant hue" "100"
#xrandr --output HDMI-1 --set "color vibrance" "160"
#
#

