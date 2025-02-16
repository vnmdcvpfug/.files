local wezterm = require 'wezterm'
local current_theme = require('current_theme')

local config = {
  enable_wayland = false,
  window_decorations = "NONE",
  use_resize_increments = true,
  enable_tab_bar = false,
  default_cursor_style = "SteadyUnderline",
  font = wezterm.font('Noto Sans Mono', { weight = 'Regular', italic = false }),
  font_size = 11.0,
  window_background_opacity = 0.75,
  window_padding = {
    left =   8,
    right =  8,
    top =    8,
    bottom = 8,
  },
}

config.colors = current_theme.colors
return config
