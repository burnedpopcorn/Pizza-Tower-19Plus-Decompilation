if (!smacked)
{
    var _spd = 15 / sprite_get_width(sprite_index)
    image_xscale = Approach(image_xscale, 4, _spd)
    image_yscale = image_xscale
    y = ystart - (sin((image_xscale - 1) * pi / 3)) * 96
    if (image_xscale == 4)
    {
        smacked = true
        scr_fmod_soundeffectONESHOT("event:/sfx/player/splat", x, y)
        alarm[0] = 45
    }
}
else if godown
{
    _spd = 5
    if (alarm[1] == -1)
        y += _spd
    else
        stretch += _spd
    if (y > 1000)
        instance_create_depth(x, y, -9999, obj_hubejectfade)
}
image_index = smacked
