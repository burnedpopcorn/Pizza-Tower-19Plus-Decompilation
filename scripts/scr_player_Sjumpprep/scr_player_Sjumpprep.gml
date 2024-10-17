function scr_player_Sjumpprep() //scr_player_Sjumpprep
{
    combo = 0
    mach2 = 0
    move = input_check_opposing("left", "right")
    start_running = 1
    alarm[4] = 14
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    machslideAnim = 1
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 1
    if (character != "N" || (character == "N" && (!pogo)))
    {
        if (sprite_index == spr_superjumpprep)
        {
            hsp = xscale * movespeed
            if (movespeed >= 0)
                movespeed -= 0.6
        }
        if (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpright || sprite_index == spr_superjumpleft)
        {
            hsp = move * (character != "N" ? 2 : 1)
            if (character == "S" && move != 0)
                xscale = move
        }
        if (sprite_index != spr_superjumpprep)
        {
            if (sign(hsp) == 0)
                sprite_index = spr_superjumppreplight
            if (sign(hsp) == 1)
            {
                if (xscale == 1)
                    sprite_index = spr_superjumpright
                if (xscale == -1)
                    sprite_index = spr_superjumpleft
            }
            if (sign(hsp) == -1)
            {
                if (xscale == 1)
                    sprite_index = spr_superjumpleft
                if (xscale == -1)
                    sprite_index = spr_superjumpright
            }
        }
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_superjumpprep)
            sprite_index = spr_superjumppreplight
        if (grounded && vsp >= 0 && (!input_check("superjump")) && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
        {
            if (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpleft || sprite_index == spr_superjumpright)
            {
                instance_create_depth(x, y, 0, obj_explosioneffect)
                sprite_index = spr_superjump
                state = (40 << 0)
                vsp = -17
            }
        }
    }
    image_speed = 0.35
}

