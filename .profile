#!/bin/sh
# BASH-PROFILE Configuration
# Written by: Jan Geldmacher
# Email: geldmacher@protonmail.com

# XDG Base Directories

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export HIGHLIGHT_DATADIR="$XDG_CONFIG_HOME/highlight/"
export HISTFILE="$XDG_DATA_HOME/bash/bash_history"
export RXVT_SOCKET="$XDG_CONFIG_HOME/urxvtd/urxvtd-0x00"
export XAUTHORITY="$XDG_CONFIG_HOME/X11/xauthority"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"

# Create history file in case it does not exist
if [[ ! -e "$HOME/.local/share/bash/.bash_history" ]]; then
	mkdir -p $HOME/.local/share/bash/
	touch $HOME/.local/share/bash/bash_history
fi

# Start X at login
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	exec startx "$XDG_CONFIG_HOME/X11/xinitrc" -- -keeptty > ~/.local/share/xorg/.xsession-errors 2>&1
fi
