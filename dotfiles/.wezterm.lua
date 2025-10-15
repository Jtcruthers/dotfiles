local wezterm = require "wezterm"

local function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "Catppuccin Mocha"
  else
    return "Catppuccin Latte"
  end
end

local config = wezterm.config_builder()

-- Use this to make it light/dark theme based on OS
-- config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

config.color_scheme = "Catppuccin Mocha"
config.hide_tab_bar_if_only_one_tab = true
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.default_prog = { '/usr/local/bin/fish', '-l' }


return config

