with (obj_player)
{
    if (grounded && sprite_index != spr_player_spawn && state != (54 << 0) && state != (41 << 0) && state != (39 << 0) && state != (122 << 0) && (!scr_transformationcheck()) && place_meeting(x, y, obj_uparrowhitbox))
        draw_sprite(spr_uparrow, -1, x, (y - 50))
}
