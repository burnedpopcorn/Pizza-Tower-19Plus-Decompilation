if (image_speed != 0 && sprite_index == spr_player_lookdoor && floor(image_index) == (image_number - 1))
{
    image_speed = 0
    alarm[1] = 120
}
if drop
    scr_collide()
if (sprite_index == spr_pepcooter && move)
{
    x += xspeed
    if (x < 250)
        xspeed = Approach(xspeed, 8, 0.4)
    else if (speeding == 0)
    {
        if (xspeed == 0 && obj_player.character == "N")
        {
            speeding = 1
            alarm[2] = 60
        }
        xspeed = Approach(xspeed, 0, 0.2)
    }
    else if (speeding == 2)
        xspeed += 0.1
}
if (sprite_index == spr_player_facehurtup && floor(image_index) == (image_number - 1))
{
    sprite_index = spr_player_facehurt
    image_index = 0
}
y = min(y, 402)
if (state == 0 && x > 1400)
{
    if global.tutorialdone
    {
        if (!instance_exists(obj_fadeout))
        {
            with (instance_create_depth(x, y, -9999, obj_sonicfadeout))
            {
                obj_player.targetRoom = hub_forcedtutorial
                obj_player.targetDoor = "C"
                obj_player.xscale = 1
            }
            event_stop(global.music.event, true)
            event_stop(global.windloop, true)
            with (obj_titlecutscene)
            {
                event_stop(taxihonksnd, true)
                event_stop(taxidrivesnd, true)
            }
        }
    }
    else if (y == 402)
    {
        sprite_index = spr_player_slipbanan3
        image_index = sprite_get_number(spr_player_slipbanan3) - 1
        image_speed = 0
        hsp = 0
        state = 1
    }
}
else if (state == 1)
{
    if (bgspd < 0)
        bgspd += 0.1706
    else
    {
        bgspd = 0
        alarm[1] = 30
        state = 2
    }
    layer_hspeed(bg2, bgspd)
    layer_hspeed(bg4, (bgspd / 2))
    layer_hspeed(bg5, 0)
    x += bgspd
}
if (sprite_index == spr_pepcooter && (!instance_exists(obj_superdashcloud)))
{
    with (instance_create_depth((x - 100), y, 0, obj_superdashcloud))
        image_xscale = other.image_xscale
}
