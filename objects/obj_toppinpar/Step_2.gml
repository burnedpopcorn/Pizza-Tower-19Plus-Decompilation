if (sprite_index != introspr)
    event_inherited()
if (!taunting)
{
    taunted = false
    image_speed = 0.35
    if (sprite_index == introspr && floor(image_index) == (image_number - 1))
    {
        sprite_index = idlespr
        spaceb = 0
        x = obj_player.x
        y = obj_player.y
    }
    if (sprite_index != introspr)
        sprite_index = (obj_moved(x, xprevious) ? movespr : (global.panic ? panicspr : idlespr))
}
