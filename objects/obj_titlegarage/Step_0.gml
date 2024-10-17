if (place_meeting(x, y, obj_player) && get_savestate() == (0 << 0))
{
    if (sprite_index == bg_mainmenugarageclosed)
    {
        sprite_index = bg_mainmenugarageopen
        image_index = 0
    }
}
else if (sprite_index == bg_mainmenugarageopened)
{
    sprite_index = bg_mainmenugarageclose
    image_index = 0
}
if (sprite_index == bg_mainmenugarageclose && floor(image_index) == (image_number - 1))
    sprite_index = bg_mainmenugarageclosed
if (sprite_index == bg_mainmenugarageopen && floor(image_index) == (image_number - 1))
    sprite_index = bg_mainmenugarageopened
