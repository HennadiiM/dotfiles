#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

#if [ -d /etc/X11/xinit/xinitrc.d ] ; then
# for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
#  [ -x "$f" ] && . "$f"
# done
# unset f
#fi
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/*; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


#xrdb -merge .Xresources

#setxkbmap -layout us,ru -option grp:caps_toggle
setxkbmap -layout us,ru -variant ,ruu -option grp:caps_toggle

# run xmodmap ONLY after setxkbmap. Else setxkbmap overwrite xmodmap settings
if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# unique keyboard layout for each tag
xxkb &
feh --bg-scale /home/prodper/sandbox/wallpapers/rubick.jpg &
picom -f &
slstatus &
low-battery &
#redshift &
#xrandr --output eDP-1 --mode 1920x1080 &


#timeshift-launcher &  

# Launch dwmstatus
#dwmstatus 2>&1 >/dev/null &

while true; do
    dwm >/dev/null 2>&1
done
#
## any of 2 lines above doesn't work! No wallpaper appears.
##xpmroot ~/Downloads/wallpaper.jpg &
##xloadimage -onroot -fullscreen ~/Downloads/wallpaper.jpg 
#
exec dwm

#exec startplasma-x11

/bin/xmonad

#export XDG_CURRENT_DESKTOP=GNOME-Classic:GNOME
#export GNOME_SHELL_SESSION_MODE=classic
#exec gnome-session --session=gnome-classic
