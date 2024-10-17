function scr_player_barrelmach2() //scr_player_barrelmach2
{
    hsp = xscale * movespeed
    movespeed = 11
    if (vsp < 12)
        vsp += grav
    if (!grounded)
    {
        state = (60 << 0)
        image_index = 0
    }
    if ((!input_check("dash")) && grounded)
    {
        state = (61 << 0)
        image_index = 0
        mach2 = 0
    }
    if (scr_solid((x + 1), y) && xscale == 1 && (!scr_slope()) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    {
        barrel = 0
        state = (49 << 0)
        hsp = -2
        vsp = -2
        mach2 = 0
        image_index = 0
        instance_create_depth((x + 10), (y + 10), 0, obj_bumpeffect)
        instance_create_depth((x + (random_range(15, -15))), (y + (random_range(15, -15))), -1, obj_wooddebris)
        instance_create_depth((x + (random_range(15, -15))), (y + (random_range(15, -15))), -1, obj_wooddebris)
        instance_create_depth((x + (random_range(15, -15))), (y + (random_range(15, -15))), -1, obj_wooddebris)
        instance_create_depth((x + (random_range(15, -15))), (y + (random_range(15, -15))), -1, obj_wooddebris)
        instance_create_depth((x + (random_range(15, -15))), (y + (random_range(15, -15))), -1, obj_wooddebris)
        instance_create_depth((x + (random_range(15, -15))), (y + (random_range(15, -15))), -1, obj_wooddebris)
        instance_create_depth((x + (random_range(15, -15))), (y + (random_range(15, -15))), -1, obj_wooddebris)
        instance_create_depth((x + (random_range(15, -15))), (y + (random_range(15, -15))), -1, obj_wooddebris)
        instance_create_depth((x + (random_range(15, -15))), (y + (random_range(15, -15))), -1, obj_wooddebris)
        instance_create_depth((x + (random_range(15, -15))), (y + (random_range(15, -15))), -1, obj_wooddebris)
    }
    if (scr_solid((x - 1), y) && xscale == -1 && (!scr_slope()) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    {
        barrel = 0
        state = (49 << 0)
        hsp = 2
        vsp = -2
        mach2 = 0
        image_index = 0
        instance_create_depth((x - 10), (y + 10), 0, obj_bumpeffect)
        instance_create_depth((x + (random_range(15, -15))), (y + (random_range(15, -15))), -1, obj_wooddebris)
        instance_create_depth((x + (random_range(15, -15))), (y + (random_range(15, -15))), -1, obj_wooddebris)
        instance_create_depth((x + (random_range(15, -15))), (y + (random_range(15, -15))), -1, obj_wooddebris)
        instance_create_depth((x + (random_range(15, -15))), (y + (random_range(15, -15))), -1, obj_wooddebris)
        instance_create_depth((x + (random_range(15, -15))), (y + (random_range(15, -15))), -1, obj_wooddebris)
        instance_create_depth((x + (random_range(15, -15))), (y + (random_range(15, -15))), -1, obj_wooddebris)
        instance_create_depth((x + (random_range(15, -15))), (y + (random_range(15, -15))), -1, obj_wooddebris)
        instance_create_depth((x + (random_range(15, -15))), (y + (random_range(15, -15))), -1, obj_wooddebris)
        instance_create_depth((x + (random_range(15, -15))), (y + (random_range(15, -15))), -1, obj_wooddebris)
        instance_create_depth((x + (random_range(15, -15))), (y + (random_range(15, -15))), -1, obj_wooddebris)
    }
    sprite_index = spr_player_barrelmach
    image_speed = 0.35
    if ((!instance_exists(obj_dashcloud)) && grounded)
        instance_create_depth(x, y, 0, obj_dashcloud)
}

