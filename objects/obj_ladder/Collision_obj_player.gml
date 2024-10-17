with (other.id)
{
    if (input_check("up") && ladderbuffer == 0 && (state == (0 << 0) || state == (36 << 0) || sprite_index == spr_shoryuken || sprite_index == spr_scaredjumpstart || sprite_index == spr_scaredjump || sprite_index == spr_player_sewerjumpstart || sprite_index == spr_player_sewerjump || state == (47 << 0) || (state == (66 << 0) && sprite_index != spr_rocketdashstart && sprite_index != spr_rocketdash) || state == (120 << 0)) && state != (50 << 0) && state != (48 << 0) && state != (51 << 0) && state != (53 << 0))
    {
        mach2 = 0
        state = (37 << 0)
        x = other.x + 16
        y = floor(y)
        if ((y % 2) == 1)
            y -= 1
    }
}
