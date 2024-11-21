local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font("Menlo", { weight = "Regular" })
config.font_size = 14.0

config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

return config
