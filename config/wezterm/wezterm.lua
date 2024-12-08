local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

config.font_size = 13.0
config.color_scheme = "Ubuntu"
config.window_decorations = "RESIZE"
config.leader = { key = "q", mods = "CTRL" }
config.keys = {
	{
		key = "-",
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "\\",
		mods = "LEADER",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{ key = "[", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
}

return config
