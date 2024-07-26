local wezterm = require 'wezterm'
local act = wezterm.action

return {
  default_prog = { 'wsl.exe' },

  -- color_scheme = 'nord',
  -- color_scheme = 'Monokai (base16)',
  color_scheme = 'Gruvbox dark, medium (base16)',

  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },

  font = wezterm.font(
    'JetBrains Mono',
    {
      weight = 'Regular',
      stretch = 'Condensed',
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
      mods = 'ALT|SHIFT',
      action = act.AdjustPaneSize { 'Left', 1 }
    },
    {
      key = 'j',
      mods = 'ALT|SHIFT',
      action = act.AdjustPaneSize { 'Down', 1 }
    },
    {
      key = 'k',
      mods = 'ALT|SHIFT',
      action = act.AdjustPaneSize { 'Up', 1 }
    },
    {
      key = 'l',
      mods = 'ALT|SHIFT',
      action = act.AdjustPaneSize { 'Right', 1 }
    },
  }
}
