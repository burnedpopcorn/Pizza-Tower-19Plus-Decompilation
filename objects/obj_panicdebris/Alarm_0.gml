if ((!obj_music.secret) && global.levelname != "dragonslair")
{
    with (instance_create_depth(irandom(room_width), -45, 0, obj_panicbricks))
    {
        image_alpha = random_range(0.5, 0.75)
        image_xscale = random_range(0.5, 1.5)
        image_yscale = image_xscale
        image_angle = random_range(0, 359)
    }
    if (global.laps < 1)
        alarm[0] = 5
    else
        alarm[0] = 4
}
