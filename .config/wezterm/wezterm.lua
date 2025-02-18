local wezterm = require 'wezterm'
local current_theme = require('current_theme')
local current_opacity = require('current_opacity')

local config = {
  enable_wayland = false,
  window_decorations = "NONE",
  use_resize_increments = true,
  enable_tab_bar = false,
  default_cursor_style = "SteadyUnderline",
  font = wezterm.font('Noto Sans Mono', { weight = 'Regular', italic = false }),
  font_size = 11.0,
  window_padding = {
    left =   8,
    right =  8,
    top =    8,
    bottom = 8,
  },
}

config.window_background_opacity = current_opacity.opacity
config.colors = current_theme.colors
return config
