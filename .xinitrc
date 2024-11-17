sxhkd &
#xrandr --output HDMI-A-4 --set "scaling mode" "Full aspect"
#xrandr -s 2560x1440
xrandr --dpi 120
xrandr --output DisplayPort-3 --dpi 120
xrandr --output HDMI-A-4 --rotate left
xrdb /home/mohan/.Xresources

# for dpi scaling some applications
export GDK_SCALE=1.5
export GDK_DPI_SCALE=1.5
export QT_SCALE_FACTOR=1.2
export _JAVA_AWT_WM_NONREPARENTING=1
export ROC_ENABLE_PRE_VEGA=1

export QT_QPA_PLATFORMTHEME=qt5ct

# display blank time after 1hr of inactivity
xset s 3600 3600
#blueman-applet &

export GTK_THEME=Catppuccin-Mocha-BL

exec bspwm
