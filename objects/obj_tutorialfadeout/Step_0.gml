if (fadealpha > fademax)
{
    fadein = 1
    scr_playerreset(0)
    scr_leavelevel()
    with (obj_player)
    {
        targetDoor = "E"
        state = (88 << 0)
        sprite_index = spr_rockethitwall
        hsp = 0
        vsp = -22
        room_goto(hub_forcedtutorial)
    }
}
if (!fadein)
    fadealpha += fadeadd
else if fadein
    fadealpha -= fadeadd
if (fadein && fadealpha < 0)
    instance_destroy()
