local flib_gui = require("__flib__.gui-lite")
local flib_position = require("__flib__.position")

---@class MSVUi
local ui = {}

---@param player LuaPlayer
function ui.build(player)
	local elements = flib_gui.add(player.gui.screen, {
		type = "frame",
		name = "msv_window",
		direction = "vertical",
		-- Titlebar
		{
			type = "flow",
			drag_target = "msv_window",
			style = "flib_titlebar_flow",
			{
				type = "label",
				style = "frame_title",
				caption = { "supervisor.titlebar" },
				ignored_by_interaction = true,
			},
			{
				type = "empty-widget",
				style = "flib_titlebar_drag_handle",
				ignored_by_interaction = true,
			},
			{
				type = "textfield",
				name = "search_textfield",
				style = "flib_titlebar_search_textfield",
				visible = true,
				clear_and_focus_on_right_click = true,
				lose_focus_on_confirm = true,
			},
			{
				type = "button",
				name = "search_button",
				style = "frame_action_button",
			},
			{
				type = "button",
				name = "close_button",
				style = "frame_action_button",
			},
		},
		-- Main content area
		{
			type = "frame",
			name = "cameras",
			style = "inside_shallow_frame",
		},
	})

	-- RUNTIME STYLES
	--- @type GuiLocation
	local anchor_location = { x = 15, y = 58 + 15 }
	local window_size = { 480, 360 }
	local window = elements.msv_window

	elements.search_textfield.focus()

	window.style.size = window_size
	window.location = flib_position.mul(anchor_location, { player.display_scale, player.display_scale })

	local cameras = window.cameras
	cameras.style.size = { window_size[1] - 24, window_size[2] - 56 }

	player.opened = window
end

---@param player LuaPlayer
function ui.toggle(player)
	local window = player.gui.screen.msv_window

	if window then
		window.destroy()
	else
		ui.build(player)
	end
end

return ui
