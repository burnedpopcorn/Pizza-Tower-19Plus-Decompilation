var targetplayer = instance_nearest(x, y, obj_player)
if (y == ystart && targetplayer.x > (x - 50) && targetplayer.x < (x + 50) && targetplayer.y > y && targetplayer.y < (y + 200) && targetplayer.state != (11 << 0))
{
    scr_fmod_soundeffectONESHOT("event:/sfx/enemy/projectile", x, y)
    grav = 0.35
    vsp = 10
    sprite_index = spr_boxcrusher_fall
}
if (grounded && sprite_index == spr_boxcrusher_fall)
{
    scr_fmod_soundeffectONESHOT("event:/sfx/player/groundpound", x, y)
    camera_shake(10, 30)
    vsp = 0
    image_index = 0
    sprite_index = spr_boxcrusher_land
}
if (sprite_index == spr_boxcrusher_land && floor(image_index) == (image_number - 1))
{
    grav = 0
    sprite_index = spr_boxcrusher_idle
    vsp = -1
}
if (y <= ystart && vsp == -1)
{
    y = ystart
    vsp = 0
}
scr_collide()
