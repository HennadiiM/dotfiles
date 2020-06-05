#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)


#userresources=$HOME/.Xresources
#usermodmap=$HOME/.Xmodmap
#sysresources=/etc/X11/xinit/.Xresources
#sysmodmap=/etc/X11/xinit/.Xmodmap
#
##DEFAULT_SESSION=startkde
#DEFAULT_SESSION=dwm
#
## merge in defaults and keymaps
#
#if [ -f $sysresources ]; then
#    xrdb -merge $sysresources
#fi
#
#if [ -f $sysmodmap ]; then
#    xmodmap $sysmodmap
#fi
#
#if [ -f "$userresources" ]; then
#    xrdb -merge "$userresources"
#fi
#
#if [ -f "$usermodmap" ]; then
#    xmodmap "$usermodmap"
#fi
#
## start some nice programs
#
#if [ -d /etc/X11/xinit/xinitrc.d ] ; then
#    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
#        [ -x "$f" ] && . "$f"
#    done
#    unset f
#fi
#
#exec 'xmodmap .Xmodmap
#
#get_session(){
#    local dbus_args=(--sh-syntax --exit-with-session)
#    case $1 in
#        awesome) dbus_args+=(awesome) ;;
#        bspwm) dbus_args+=(bspwm-session) ;;
#        budgie) dbus_args+=(budgie-desktop) ;;
#        cinnamon) dbus_args+=(cinnamon-session) ;;
#        deepin) dbus_args+=(startdde) ;;
#        enlightenment) dbus_args+=(enlightenment_start) ;;
#        fluxbox) dbus_args+=(startfluxbox) ;;
#        gnome) dbus_args+=(gnome-session) ;;
#        i3|i3wm) dbus_args+=(i3 --shmlog-size 0) ;;
#        jwm) dbus_args+=(jwm) ;;
#        kde) dbus_args+=(startkde) ;;
#        lxde) dbus_args+=(startlxde) ;;
#        lxqt) dbus_args+=(lxqt-session) ;;
#        mate) dbus_args+=(mate-session) ;;
#        xfce) dbus_args+=(xfce4-session) ;;
#        openbox) dbus_args+=(openbox-session) ;;
#	dwm) dbus_args+=(dwm);;
#        *) dbus_args+=($DEFAULT_SESSION) ;;
#    esac
#
#    echo "dbus-launch ${dbus_args[*]}"
#}
#
##exec $(get_session)
#exec dwm
#


if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# twm &
# xclock -geometry 50x50-1+1 &
# xterm -geometry 80x50+494+51 &
# xterm -geometry 80x20+494-0 &
# exec xterm -geometry 80x66+0+0 -name login

## некоторые приложения, которые должны быть запущены в фоновом режиме
#xscreensaver &
#xsetroot -cursor_name left_ptr &


# launch xmodmap after start 
if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

# language
#setxkbmap -model pc105 -layout us,ru, -option grp:alt_shift_toggle
#setxkbmap -option terminate:ctrl_alt_bksp,grp:shifts_toggle ru,us

while true; do
    dwm >/dev/null 2>&1
done


exec dwm
