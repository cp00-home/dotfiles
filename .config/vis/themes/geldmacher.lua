-- ┐ ┬o┐─┐  ┬─┐┬─┐o┌┐┐┌─┐┬─┐
-- │┌┘│└─┐──├─ │ ││ │ │ ││┬┘
-- └┘ ┆──┘  ┴─┘┆─┘┆ ┆ ┘─┘┆└┘

-- VIS EDITOR THEME geldmacher.lua 
-- Copyright (c) 2019 by Jan Geldmacher 
-- Email: geldmacher@protonmail.ch

local lexers = vis.lexers

local colors = {
    ['FOREGROUND']      = io.popen("xrdb -query | grep vis.foreground | awk '{print $2}' &"):read("*l"),
    ['BACKGROUND']      = io.popen("xrdb -query | grep vis.background | awk '{print $2}' &"):read("*l"),
    ['CLASS']           = '#657B83',
    ['COMMENT']         = '#818181',
    ['CONSTANT']        = '#586E75',
    ['DEFINITION']      = '#676767',
    ['ERROR']           = '#657B83',
    ['FUNCTION']        = '#657B83',
    ['KEYWORD']         = '#657B83',
    ['LABEL']           = '#a9a9a9',
    ['NUMBER']          = '#2aa198',
    ['OPERATOR']        = '#586E75',
    ['REGEX']           = '#586E75',
    ['STRING']          = '#839496',
    ['PREPROCESSOR']    = '#cecece',
    ['TAG']             = '#a5a5a5',
    ['TYPE']            = '#657B83',
    ['VARIABLE']        = '#586E75',
    ['EMBEDDED']        = '#cfcfcf',
    ['IDENTIFIER']      = '#070707',
}

local fg = 'fore:'..colors.FOREGROUND
local bg = 'back:'..colors.BACKGROUND

lexers.colors = colors

lexers.STYLE_DEFAULT            = fg..','..bg
lexers.STYLE_NOTHING            = ''
lexers.STYLE_CLASS              = 'fore:'..colors.CLASS
lexers.STYLE_COMMENT            = 'fore:'..colors.COMMENT
lexers.STYLE_CONSTANT           = 'fore:'..colors.CONSTANT
lexers.STYLE_DEFINITION         = 'fore:'..colors.DEFINITION
lexers.STYLE_ERROR              = 'fore:'..colors.ERROR..',italics'
lexers.STYLE_FUNCTION           = 'fore:'..colors.FUNCTION
lexers.STYLE_KEYWORD            = 'fore:'..colors.KEYWORD..',bold'
lexers.STYLE_LABEL              = 'fore:'..colors.LABEL
lexers.STYLE_NUMBER             = 'fore:'..colors.NUMBER
lexers.STYLE_OPERATOR           = 'fore:'..colors.OPERATOR
lexers.STYLE_REGEX              = 'fore:'..colors.REGEX
lexers.STYLE_STRING             = 'fore:'..colors.STRING
lexers.STYLE_PREPROCESSOR       = 'fore:'..colors.PREPROCESSOR
lexers.STYLE_TAG                = 'fore:'..colors.TAG
lexers.STYLE_TYPE               = 'fore:'..colors.TYPE..',bold'
lexers.STYLE_VARIABLE           = 'fore:'..colors.VARIABLE
lexers.STYLE_WHITESPACE         = ''
lexers.STYLE_EMBEDDED           = 'fore:'..colors.EMBEDDED
lexers.STYLE_IDENTIFIER         = fg

lexers.STYLE_LINENUMBER         = 'fore:#a5bbb3'
lexers.STYLE_LINENUMBER_CURSOR  = 'fore:#657b83,back:#d4d4c1,bold'
lexers.STYLE_CURSOR             = 'fore:#657b83,back:#f7f7e4'
lexers.STYLE_CURSOR_PRIMARY     = 'fore:#657b83,back:#f7f7e4'
lexers.STYLE_CURSOR_LINE        = 'fore:#e7e7d4,back:#d4d4c1'
lexers.STYLE_COLOR_COLUMN       = 'back:#fdf6e3'
lexers.STYLE_SELECTION          = 'fore:#272704,back:#f7f7e4,bold'
lexers.STYLE_STATUS             = 'fore:#657b83,back:default'
lexers.STYLE_STATUS_FOCUSED     = 'fore:#657b83,back:default'
lexers.STYLE_SEPARATOR          = lexers.STYLE_DEFAULT
lexers.STYLE_INFO               = 'fore:fg,back:bg,bold'
lexers.STYLE_EOF                = ''
