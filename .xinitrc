#!/bin/sh


#xrandr --setprovideroutputsource modesetting NVIDIA-0 
#xrandr --auto 
#xrandr --dpi 96

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

[ "$XDG_CURRENT_DESKTOP" = "KDE" ] || [ "$XDG_CURRENT_DESKTOP" = "GNOME" ] || export QT_QPA_PLATFORMTHEME="qt5ct"

: '
cold-snow-trees.jpg
desert-black.jpg
night-king-with-his-dragon.jpg
pink-clouds-mountains.jpg
polar-river.jpg
rain-shower-lightning.jpg
snow-beach-mountain.jpg
'




fw pink-clouds-mountains.jpg &
picom &
low-battery &
xautolock -time 1 -corners 00-0 -locker slock & #top l, top r, bottom 
flameshot & # in background
#/usr/bin/emacs --daemon &
redshift &

slstatus &

while true; do
    dwm >/dev/null 2>&1
done

#xmobar ~/.config/xmobarrc &
#/bin/xmonad


# plasma
#export DESKTOP_SESSION=plasma 
#exec startplasma-x11


# gnome
# xorg session
#export XDG_SESSION_TYPE=x11
#export GDK_BACKEND=x11
#exec gnome-session



#xrandr --output eDP-1 --mode 1920x1080 &

# Launch dwmstatus
#dwmstatus 2>&1 >/dev/null &

# deepin
#exec startdde
