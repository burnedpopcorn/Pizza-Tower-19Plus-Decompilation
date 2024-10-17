function scr_enemy_roll() //scr_enemy_roll
{
    image_speed = 0.35
    hsp = image_xscale * movespeed
    sprite_index = spr_pizzaball_roll
    thrown = true
    if (movespeed > 0)
        movespeed -= 0.1
    if (grounded && floor(movespeed) == 0)
    {
        grav = 0.5
        if (object_index != obj_ancho && object_index != obj_pizzaboy)
            vsp = -4
        else
            vsp = 0
        image_index = 0
        sprite_index = walkspr
        state = 100
        movespeed = 1
        stunned = 0
        thrown = 0
    }
    if (place_meeting((x - image_xscale), y, obj_solid) && (!(place_meeting((x - image_xscale), y, obj_destructibles))))
    {
        with (instance_create_depth(x, y, 0, obj_bulletimpact))
            image_xscale = (-other.image_xscale)
        grav = 0.5
        image_xscale *= -1
        hsp = (-image_xscale)
    }
}

