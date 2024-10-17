function scr_player_keyget() //scr_player_keyget
{
    hsp = 0
    vsp = 0
    image_speed = 0.35
    movespeed = 0
    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 1
    machhitAnim = 0
    if (character == "C")
        sprite_index = spr_slimebounce
    else
        sprite_index = spr_keyget
    if (floor(image_index) == (image_number - 1))
    {
        global.keyget = 0
        if (character == "C")
            state = (112 << 0)
        else
            state = (0 << 0)
        if (global.key_inv && (!instance_exists(obj_keyinv)))
        {
            with (instance_create_depth(x, y, (depth - 1), obj_keyinv))
                playerid = other.playerobj
        }
        image_index = 0
    }
    if (floor(image_index) == 16)
        voice_collect(obj_player)
    restore_combo()
}

