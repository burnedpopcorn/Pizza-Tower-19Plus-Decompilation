function scr_player_freefallland() //scr_player_freefallland
{
    hit_vertical = function(argument0) //anon@53@scr_player_freefallland_scr_player_freefallland
    {
        if (argument0 >= 0)
            scr_destroy_vertical(argument0, ((1 << 0) * (freefallsmash > 10)))
    }

    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 0
    machhitAnim = 0
    movespeed = 0
    if (sprite_index != spr_player_poundcancel2)
    {
        if (sprite_index != spr_freefallland)
            armhurt = 1
        else
            facehurt = 1
    }
    start_running = 1
    alarm[4] = 14
    hsp = 0
    vsp = 0
    var _hasanimended = false
    var _nextframe = image_index + image_speed
    if (_nextframe >= (image_number - 1))
        _hasanimended = true
    if (sprite_index != spr_player_poundcancel1 && _hasanimended)
    {
        if _hasanimended
        {
            state = (grounded ? (0 << 0) : (36 << 0))
            if (state == (0 << 0))
            {
                if facehurt
                    sprite_index = spr_facehurtup
                if armhurt
                    sprite_index = spr_armhurtup
            }
            else
                sprite_index = spr_fall
            image_index = 0
        }
    }
    image_speed = 0.5
}

