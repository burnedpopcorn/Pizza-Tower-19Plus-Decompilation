var targetplayer = instance_nearest(x, y, obj_player)
if instance_exists(obj_grabbiehanddropspot)
{
    with (obj_grabbiehanddropspot)
    {
        if (grabbieid == other.grabbieid)
        {
            other.dropspotx = x
            other.dropspoty = y
        }
    }
}
if (floor(image_index) == (image_number - 1) && sprite_index == spr_grabbiehand_hifive)
{
    sprite_index = spr_grabbiehand_idle
    thumbingup = 0
    image_xscale = 1
    mask_index = spr_grabbiehand_idle
}
if (x <= (xstarte + 6) && x >= (xstarte - 6) && y <= (ystarte + 6) && y >= (ystarte - 6) && targetplayer.x > (x - 50) && targetplayer.x < (x + 50) && targetplayer.y > y && targetplayer.y < (y + 400) && thumbingup == 0)
{
    delay--
    if (delay <= 0)
    {
        scr_fmod_soundeffectONESHOT("event:/sfx/enemy/projectile", x, y)
        grav = 0.35
        vsp = 10
        sprite_index = spr_grabbiehand_fall
        delay = 5
        mask_index = spr_grabbiehand_idle
    }
}
if (scr_solid(x, (y + 1)) && sprite_index == spr_grabbiehand_fall && grabbing == 0)
{
    grav = 0
    sprite_index = spr_grabbiehand_idle
    vsp = -3
    mask_index = spr_grabbiehand_idle
}
if (y <= (ystarte + 6) && y >= (ystarte - 6) && vsp == -3 && grabbing == 0)
    vsp = 0
if (sprite_index == spr_grabbiehand_catch && released == 0 && grabbing == 1)
{
    var distance = point_distance(x, y, dropspotx, dropspoty)
    var dir = (distance <= (distance / 3) ? -2 : 1)
    dropspd += (0.25 * dir)
    dropspd = clamp(dropspd, 5, 20)
    x = round(Approach(x, dropspotx, dropspd))
    y = round(Approach(y, dropspoty, dropspd))
    mask_index = spr_emptyplayer
}
if (x <= (dropspotx + 5) && x >= (dropspotx - 5) && y <= (dropspoty + 5) && y >= (dropspoty - 5) && released == 0 && grabbing == 1)
{
    with (targetplayer)
    {
        state = (51 << 0)
        sprite_index = spr_bodyslamfall
        vsp += 14
    }
    dropspd = 0
    image_index = 0
    sprite_index = spr_grabbiehand_release
    released = 1
    mask_index = spr_emptyplayer
}
if (sprite_index == spr_grabbiehand_release && floor(image_index) == (image_number - 1) && released == 1 && grabbing == 1)
    sprite_index = spr_grabbiehand_idle
if (sprite_index == spr_grabbiehand_idle && released == 1 && grabbing == 1)
{
    dropspd = 0
    x = lerp(x, xstarte, 0.03)
    y = lerp(y, ystarte, 0.03)
    mask_index = spr_emptyplayer
}
if (x <= (xstarte + 6) && x >= (xstarte - 6) && y <= (ystarte + 6) && y >= (ystarte - 6) && grabbing == 1 && sprite_index == spr_grabbiehand_idle)
{
    grabbing = 0
    released = 0
    mask_index = spr_grabbiehand_idle
}
if (sprite_index == spr_grabbiehand_catch)
{
    targetplayer.vsp = vsp
    targetplayer.hsp = hsp
    targetplayer.state = (49 << 0)
    targetplayer.sprite_index = spr_player_catched
    targetplayer.x = x
    targetplayer.y = y
}
scr_collide()
