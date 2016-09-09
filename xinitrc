if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

#xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

# xsetroot -cursor_name left_ptr &

# synclient MaxSpeed=3 AccelFactor=0.1 VertScrollDelta=-130 HorizScrollDelta=-130 PalmDetect=1 
PalmMinWidth=8 CoastingFriction=10 CoastingSpeed=5 TapButton1=1 TapButton2=3 TapButton3=2

exec mate-session &
exec xmonad
