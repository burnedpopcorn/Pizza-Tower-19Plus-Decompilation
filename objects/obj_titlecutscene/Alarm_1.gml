if (sprite_index == spr_player_slipbanan3)
{
    sprite_index = spr_player_facehurtup
    image_index = 0
    image_speed = 0.35
    alarm[1] = 180
}
else if (sprite_index == spr_player_facehurt)
{
    sprite_index = spr_player_lookdoor
    image_index = 0
}
else if (sprite_index == spr_player_lookdoor)
    room_goto(intro)
