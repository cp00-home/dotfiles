# ┬─┐┬─┐┌┐┐┌─┐┬─┐┬─┐
# │┬┘│─┤││││ ┬├─ │┬┘
# ┆└┘┘ ┆┆└┘┆─┘┴─┘┆└┘

# Ranger colortheme - Slim version
# Written by: Jan Geldmacher
# Email: geldmacher@protonmail.com

from __future__ import (absolute_import, division, print_function)

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import (
    black, blue, cyan, green, magenta, red, white, yellow, default,
    normal, default_colors,
)


class Default(ColorScheme):
    progress_bar_color = cyan

    def use(self, context):  # pylint: disable=too-many-branches,too-many-statements
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                fg = black
                bg = white
            else:
                fg = default
            if context.inactive_pane:
                fg = default
            if context.border:
                fg = white

        elif context.in_titlebar:
            if context.hostname:
                fg = white if context.bad else green
            elif context.directory:
                fg = white
            elif context.tab:
                if context.good:
                    bg = white
            elif context.link:
                fg = white

        elif context.in_statusbar:
            if context.permissions:
                fg = white
            if context.marked:
                fg = white
            if context.frozen:
                fg = white
            if context.message:
                fg = white
            if context.loaded:
                bg = self.progress_bar_color
            if context.vcsinfo:
                fg = white
            if context.vcscommit:
                fg = white
            if context.vcsdate:
                fg = white
        
        return fg, bg, attr
