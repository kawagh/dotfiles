local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

if wezterm.target_triple == "aarch64-apple-darwin" then
	config.font_size = 13.0
else
	config.font_size = 11.0
end
config.color_scheme = "Ubuntu"
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false
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
	{
		key = "r",
		mods = "LEADER",
		action = act.RotatePanes("Clockwise"),
	},
	{
		key = "R",
		mods = "LEADER",
		action = act.RotatePanes("CounterClockwise"),
	},
}

return config
