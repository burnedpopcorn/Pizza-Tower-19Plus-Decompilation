if (!discsquash)
{
    discanim += 0.05
    discspin += 40
    discspin %= 360
    if (discanim >= 1)
    {
        discanim = 1.2
        discspin = 0
        discsquash = true
        event_play_oneshot("event:/sfx/misc/disclamersplat")
    }
}
else
    discanim = Approach(discanim, 1, 0.05)
if (input_keyboard_check_pressed(vk_f1) || (input_gamepad_check_pressed(input_player_get_gamepad(), 32779) && input_gamepad_check_pressed(input_player_get_gamepad(), 32780)))
{
    input_profile_reset_bindings("keyboard_and_mouse")
    input_profile_reset_bindings("gamepad")
    config_set_option("Input", "bindings", input_system_export(false))
    config_dump()
    scr_tiptext(string_get("tips/menu/options/allbindsreset"))
}
if (input_check_pressed("jump") && get_savestate() == (0 << 0))
{
    instance_destroy()
    instance_create_depth(x, y, depth, obj_logos)
}
