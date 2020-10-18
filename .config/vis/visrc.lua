-- ┐ ┬o┐─┐  ┬─┐┬─┐o┌┐┐┌─┐┬─┐
-- │┌┘│└─┐──├─ │ ││ │ │ ││┬┘
-- └┘ ┆──┘  ┴─┘┆─┘┆ ┆ ┘─┘┆└┘

-- VIS CONFIGURATION FILE visrc.lua
-- Copyright (c) 2019 by Jan Geldmacher
-- Email: geldmacher@protonmail.ch

require('vis')
require('plugins/vis-commentary')
require('plugins/vis-title')

plugin_vis_open                = require('plugins/fzf-open')
plugin_vis_open.fzf_path       = "fzf"
plugin_vis_open.fzf_args       = ""

vis.events.subscribe(vis.events.INIT, function()

	-- Global configuration options here
	vis:command('set theme geldmacher')
	vis:command('set change-256colors on')
    
    -- Open up files with fuzzy matching pattern
    vis:command('map! normal <Space>o :fzf<Enter>')

    -- Read xresources color information via xrdb
    fg = io.popen("xrdb -query | grep vis.background | awk '{print $2}'"):read("*l")
    bg = io.popen("xrdb -query | grep vis.foreground | awk '{print $2}'"):read("*l")

end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)

	-- Window configuration options here
	vis:command('set autoindent')
	vis:command('set cursorline')
	vis:command('set expandtab')
	vis:command('set number')
	vis:command('set relativenumbers')
	vis:command('set show-eof off')
	vis:command('set show-tabs off')
	vis:command('set tabwidth 4')

end)

vis.events.subscribe(vis.events.WIN_STATUS, function(win)

	local modes = {
	   [vis.modes.NORMAL]              = 'NORMAL MODE',
	   [vis.modes.OPERATOR_PENDING]    = 'PENDING MODE',
	   [vis.modes.VISUAL]              = 'VISUAL MODE',
	   [vis.modes.VISUAL_LINE]         = 'VISUAL-LINE MODE',
	   [vis.modes.INSERT]              = 'INSERT MODE',
	   [vis.modes.REPLACE]             = 'REPLACE MODE',
    }
    
	local mode         = modes[vis.mode]
	local file         = win.file
	local name         = file.name
	local size         = file.size
	local selection    = win.selection
	local col          = selection.col
	local pos          = selection.pos
	local line         = selection.line

    local nstatus = " "..mode.."   "..(name or 'No Name').." "
    local lstatus = " "..mode.."   "..(name or 'No Name').." "
    local rnstatus = "  MASTER  "..math.ceil(pos/size*100).."%    "..line..",  "..col.." "
    local rstatus = "  FORK  "..math.ceil(pos/size*100).."%    "..line..",  "..col.." "

    -- Conditional statusbar update

    if vis.mode == vis.modes.NORMAL then
       win:style_define(win.STYLE_STATUS_FOCUSED, 'fore:'..fg..',bold,back:'..bg)
       win:status(nstatus, rnstatus) ;;
    else
       win:style_define(win.STYLE_STATUS_FOCUSED, 'fore:'..fg..',bold,italics,back:'..bg)
       win:status(lstatus, rstatus) ;;
    end

end)
