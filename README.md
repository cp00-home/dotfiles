# Welcome to my dotfiles

![current desktop](/pictures/desktop.jpg)

Feel free to copy whatever you like from my current setup. I spend some time to make everything look coherent, so if you have any questions just let me know. 

## Philosophy
I also try to keep my *$HOME* as clean as possible and therefor stick to the [XDG-Base-Configuration](https://specification.freedesktop.org/basedir-spec/basedir-spec-latest.html). As a suckless-enthusiast I primarily use software, that follows a minimalistic approach and does the job. Software that comes with alot of external dependencies often tends to be bloated in my eyes, so I try to avoid that and simply stick to something more simplistic.

## Setup
I keep scripts that I find useful in `.local/bin`. Config files are stored in `.config`. I am able to source my `bashrc` from there aswell by using the following if-statement in `/etc/bash.bashrc`:
> if [ -s "$HOME/.config/bash/bashrc" ]; then
>   . "$HOME/.config/bash/bashrc"
> fi 

## Theming and startup
While I enjoy the solarized-light theme for its fore- and background, I dislike some of the color choices that come with it. Thats why I made a less colorized version of it. Every information about it is stored in `.config/X11/xresoiurces` and `.config/X11/xinitrc` contains all the necessary programs that get executed once X is started. Imagemagick has some nice options to determine the most prominent colors of certain wallpapers, so I might write something in the near future to automatically pipe those informations to update a theme via xrdb. 

## Inspiration
* [suckless.org](https://suckless.org) - software that sucks less
* [fsf](https://fsf.org) - Free Software Foundation
* [libreboot](https://libreboot.org) - freedom-respecting boot firmware
* [parabola](https://www.parabola.nu) - free, simple, and lightweight operating system

## Installation
Make sure to backup your most important files before cloning this repository to your *$HOME*. I take no responsibility for any loss of data or damage, that might occur - you have been warned:
> git clone https://github.com/cp00-home/dotfiles.git

That's all folks - have a good one!