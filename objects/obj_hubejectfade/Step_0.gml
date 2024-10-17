if (fadealpha > fademax)
{
    fadein = true
    if instance_exists(obj_player)
    {
        scr_playerreset(false)
        scr_leavelevel()
        with (obj_player)
        {
            sprite_index = spr_slipbanan2
            hsp = 0
            movespeed = 0
            state = (110 << 0)
            room_goto(backtohubroom)
            targetDoor = "HUB"
        }
        hubeject = true
        with (obj_drawcontroller)
        {
            sprite_index = spr_hud_start
            image_index = 0
        }
    }
}
fadealpha += ((!fadein) ? fadeadd : (-fadeadd))
if (fadein && fadealpha < 0)
    instance_destroy()
