if place_meeting(x, y, obj_player)
{
    if (obj_player.sprite_index != spr_player_catched)
    {
        if ((!touched) && sprite_index != spr_switchblock_gohappy && sprite_index != spr_switchblock_gosad)
        {
            if global.switchblock
            {
                global.switchblock = false
                with (obj_switch)
                    sprite_index = spr_switchblock_gohappy
            }
            else
            {
                global.switchblock = true
                with (obj_switch)
                    sprite_index = spr_switchblock_gosad
            }
            touched = true
            with (obj_switch)
                image_index = 0
        }
    }
}
else
    touched = false
if (floor(image_index) == (image_number - 1))
{
    if (sprite_index == spr_switchblock_gohappy)
        sprite_index = spr_switchblock_happy
    if (sprite_index == spr_switchblock_gosad)
        sprite_index = spr_switchblock_sad
}
