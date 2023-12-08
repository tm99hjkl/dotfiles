local wezterm = require 'wezterm'
local act = wezterm.action

return {
  default_prog = { 'wsl.exe' },

  color_scheme = 'nord',

  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },

  font = wezterm.font(
    'Source Code Pro',
    {
      weight = 'Regular',
      stretch = 'Normal',
      italic = false
    }
  ),
  font_size = 14,

  keys = {
    -- Activate Pane Direction
    {
      key = 'h',
      mods = 'ALT',
      action = act.ActivatePaneDirection 'Left',
    },
    {
      key = 'l',
      mods = 'ALT',
      action = act.ActivatePaneDirection 'Right',
    },
    {
      key = 'k',
      mods = 'ALT',
      action = act.ActivatePaneDirection 'Up',
    },
    {
      key = 'j',
      mods = 'ALT',
      action = act.ActivatePaneDirection 'Down',
    },

    -- Adjust Pane Size
    {
      key = 'h',
      mods = 'ALT|CTRL',
      action = act.AdjustPaneSize { 'Left', 1 }
    },
    {
      key = 'j',
      mods = 'ALT|CTRL',
      action = act.AdjustPaneSize { 'Down', 1 }
    },
    {
      key = 'k',
      mods = 'ALT|CTRL',
      action = act.AdjustPaneSize { 'Up', 1 }
    },
    {
      key = 'l',
      mods = 'ALT|CTRL',
      action = act.AdjustPaneSize { 'Right', 1 }
    },
  }
}
