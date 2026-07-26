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

local function is_herdr_pane(pane)
	local proc = pane:get_foreground_process_name()
	return proc ~= nil and proc:match("herdr$") ~= nil
end

local prefix_table = act.ActivateKeyTable({
	name = "prefix",
	one_shot = true,
	timeout_milliseconds = 1000,
})

config.keys = {
	{
		key = "q",
		mods = "CTRL",
		action = wezterm.action_callback(function(window, pane)
			if is_herdr_pane(pane) then
				window:perform_action(act.SendKey({ key = "q", mods = "CTRL" }), pane)
			else
				window:perform_action(prefix_table, pane)
			end
		end),
	},
	{ key = "LeftArrow", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
	{ key = "DownArrow", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
	{ key = "UpArrow", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
	{ key = "RightArrow", mods = "CTRL", action = act.ActivatePaneDirection("Right") },
}

config.key_tables = {
	prefix = {
		{
			key = "-",
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "\\",
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{ key = "[", action = act.ActivateCopyMode },
		{ key = "h", action = act.ActivatePaneDirection("Left") },
		{ key = "j", action = act.ActivatePaneDirection("Down") },
		{ key = "k", action = act.ActivatePaneDirection("Up") },
		{ key = "l", action = act.ActivatePaneDirection("Right") },
		{ key = "z", action = act.TogglePaneZoomState },
		{ key = "H", action = act.AdjustPaneSize({ "Left", 2 }) },
		{ key = "J", action = act.AdjustPaneSize({ "Down", 2 }) },
		{ key = "K", action = act.AdjustPaneSize({ "Up", 2 }) },
		{ key = "L", action = act.AdjustPaneSize({ "Right", 2 }) },
		{
			key = "r",
			action = act.RotatePanes("Clockwise"),
		},
		{
			key = "R",
			action = act.RotatePanes("CounterClockwise"),
		},
	},
}

return config
