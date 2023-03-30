local wezterm = require 'wezterm'
return {
  color_scheme = "Catppuccin Mocha",
  default_prog = {"wsl.exe"},
  window_background_opacity = 0.9;
  window_padding = {
    left = 2,
    right = 2,
    top = 4,
    bottom = 0,
  },
  font = wezterm.font("Source Code Pro", {weight=400, stretch="Normal", italic=false}),
  font_size = 10,
}
