#!/bin/bash
#
# disable-dither.sh
# to view dither setting use xrandr --verbose
# xrandr disable dithering
#xrandr --output HDMI-1 --set "underscan" "auto"
#
xrandr --output DP-1 --set "dithering mode" "off"
xrandr --output HDMI-1 --set "dithering mode" "off"
#xrandr --output HDMI-1 --set "vibrant hue" "100"
#xrandr --output HDMI-1 --set "color vibrance" "160"
#
#
#xrandr --output HDMI-1 --set "dithering depth" "8 bpc"
#
## add aditional mode
#xrandr --newmode "3840x2160_30.00"  338.75  3840 4080 4488 5136  2160 2163 2168 2200 -hsync +vsync
#xrandr --addmode HDMI-1 3840x2160_30.00
#xrandr --newmode "3840x2160_60.0"  594.00  3840 4016 4104 4400  2160 2168 2178 2250  60.00

#xrandr --addmode HDMI-1 "3840x2160_60.0"

