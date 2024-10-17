if (sprite_index != spr_gerome_intro && sprite_index != spr_gerome_openingdoor && sprite_index != spr_gerome_openingdoorloop && there_is_follower_id(id))
    event_inherited()
if (!taunting)
{
    taunted = false
    if (sprite_index != spr_gerome_openingdoor && sprite_index != spr_gerome_openingdoorloop && there_is_follower_id(id))
    {
        image_speed = 0.35
        if (sprite_index == spr_gerome_intro && floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_gerome_idle
            spaceb = 0
            x = obj_player.x
            y = obj_player.y
        }
        if (sprite_index != spr_gerome_intro)
            sprite_index = (obj_moved(x, xprevious) ? spr_gerome_movewithkey : spr_gerome_key)
    }
}
