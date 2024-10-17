if place_meeting(x, y, obj_player)
{
    if (sprite_index == bg_mainmenurestoff)
    {
        sprite_index = bg_mainmenureston
        image_index = 0
    }
}
else if (sprite_index == bg_mainmenureston)
{
    sprite_index = bg_mainmenurestoff
    image_index = 0
}
