---@class MSVInit
local init = {}

-- Disables the intro cutscene and the crashlanding at start
function init.disable_intro()
    local freeplay = remote.interfaces['freeplay']
    if freeplay then
        if freeplay['set_skip_intro'] then remote.call('freeplay', 'set_skip_intro', true) end
        if freeplay['set_disable_crashsite'] then remote.call('freeplay', 'set_disable_crashsite', true) end
    end
end

function init.globals(player)
    local default_globals = { controls_active = true, button_count = 0, selected_item = nil }
    global.players[player.index] = default_globals
end

return init
