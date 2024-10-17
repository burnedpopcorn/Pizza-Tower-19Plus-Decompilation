if (press >= 8 && (!drop))
{
    obj_player.image_index = 0
    obj_player.alarm[8] = 60
    obj_player.state = (50 << 0)
    drop = true
    closed = false
}
if closed
    y = obj_player.y
if (drop && (!falling))
{
    x += hsp
    y += vsp
    if (vsp < 20)
        vsp += grav
}
if falling
    scr_collide()
if (falling && scr_solid(x, (y + 1)))
    falling = false
