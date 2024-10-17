function scr_player_finishingblow() //scr_player_finishingblow
{
    collide_destructibles = function(argument0, argument1) //anon@63@scr_player_finishingblow_scr_player_finishingblow
    {
        scr_destroy_horizontal(argument0)
    }

    hsp = xscale * movespeed
    if (movespeed > 0)
        movespeed -= 0.3
    if (movespeed < 0)
        movespeed += 0.3
    if (floor(image_index) == (image_number - 1))
    {
        state = (0 << 0)
        movespeed = 0
        punchedenemy = true
    }
    if (floor(image_index) == 6 && (!punchedenemy))
    {
        scr_fmod_soundeffectONESHOT("event:/sfx/enemy/punched", x, y)
        scr_fmod_soundeffectONESHOT("event:/sfx/player/killingblow", x, y)
        gamepadvibrate(0.8, 0, 7)
        with (instance_create_depth(x, y, 0, obj_swordhitbox))
            playerid = other.playerobj
        punchedenemy = true
        instance_create_depth((x + 40 * xscale), y, 0, obj_parryeffect)
        vsp = -6
        movespeed = -6
    }
    if (floor(image_index) == 0 && (!punchedenemy) && sprite_index == spr_swingdingend)
    {
        scr_fmod_soundeffectONESHOT("event:/sfx/player/killingblow", x, y)
        gamepadvibrate(0.8, 0, 7)
        with (instance_create_depth(x, y, 0, obj_swordhitbox))
            playerid = other.playerobj
        punchedenemy = true
    }
    image_speed = 0.5
    landAnim = 0
}

