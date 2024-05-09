local styles = data.raw['gui-style'].default

data:extend({
    -- Hotkeys
    {
        type = 'custom-input',
        name = 'msv_toggle_interface',
        key_sequence = 'CONTROL + I',
        order = 'a',
    },
    {
        type = 'custom-input',
        name = 'msv_add_camera',
        key_sequence = 'CONTROL + A',
        order = 'a',
    },
    {
        type = 'custom-input',
        name = 'msv_remove_all_cameras',
        key_sequence = 'CONTROL + D',
        order = 'a',
    },
})
