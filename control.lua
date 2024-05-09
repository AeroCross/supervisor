local ui = require('scripts/ui')
local init = require('scripts/init')

-- On first mod load
script.on_init(function(event)
    init.disable_intro()
    global.players = {}

    for _, player in pairs(game.players) do
        init.globals(player)
    end
end)

-- New player joins, start of game
script.on_event(defines.events.on_player_created, function(event)
    local player = game.get_player(event.player_index)
    if not player then return end

    init.globals(player)
end)

-- Pressing hotkey (see: data.lua)
script.on_event('msv_toggle_interface', function(event)
    local player = game.get_player(event.player_index)
    if not player then return end

    ui.toggle(player)
end)

-- Exiting main frame (ie. esc, hotkey)
script.on_event(defines.events.on_gui_closed, function(event)
    if event.element and event.element.name == 'msv_window' then
        local player = game.get_player(event.player_index)
        if not player then return end

        ui.toggle(player)
    end
end)

-- Player removed from server
script.on_event(defines.events.on_player_removed, function(event) global.players[event.player_index] = nil end)

script.on_event(defines.events.on_gui_click, function(event)
    if event.element.name == 'camera_example' then
        local player = game.get_player(event.player_index)
        if not player then return end
        player.open_map(event.element.position)
    end
end)
