function scr_enemy_stun() //scr_enemy_stun
{
    if ((!thrown) && (!parried))
        stunned--
    if (sprite_index != spr_dead)
        sprite_index = stunfallspr
    image_speed = 0.35
    alarm[1] = 5
    if (grounded && vsp >= 0)
    {
        thrown = 0
        grav = 0.5
    }
    if (scr_solid(x, (y - 1)) && throwvsp < 0 && thrown)
        instance_destroy()
    if (grounded && vsp >= 0 && (!thrown))
        hsp = Approach(hsp, 0, 0.4)
    if (place_meeting((x + sign(hsp)), y, obj_solid) || place_meeting((x + sign(hsp)), y, obj_hallway))
    {
        with (instance_create_depth(x, y, 0, obj_bulletimpact))
            image_xscale = (-other.image_xscale)
        instance_create_depth(x, y, 0, obj_bangeffect)
        if (thrown && (hp <= 0 || parried))
            instance_destroy()
        thrown = false
        grav = 0.5
        image_xscale *= -1
        hsp = (-image_xscale) * 4
    }
    if (stunned <= 0 && floor(image_index) == (image_number - 1))
    {
        hitfactor = 0
        vsp = 0
        image_index = 0
        sprite_index = walkspr
        state = 100
        movespeed = 1
    }
    if parried
    {
        hsp = throwhsp
        vsp = throwvsp
    }
    if killed
        instance_destroy()
    if thrown
    {
        if (hitboxID == -4)
        {
            with (instance_create_depth(x, y, 0, obj_baddiehitbox))
            {
                other.hitboxID = id
                baddieID = other.id
            }
        }
    }
}

