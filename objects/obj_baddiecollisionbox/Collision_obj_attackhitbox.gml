var __player = other.playerid
if instance_exists(baddieID)
{
    if (place_meeting(x, y, obj_attackhitbox) && baddieID.ishurt == 0)
    {
        with (baddieID)
        {
            ishurt = 1
            hp -= 2
            scr_enemygibs()
            instance_create_depth(x, y, -1, obj_parryeffect)
            scr_fmod_soundeffectONESHOT("event:/sfx/enemy/punched", x, y)
            scr_fmod_soundeffectONESHOT("event:/sfx/player/killingblow", x, y)
            camera_shake(3, 3)
            alarm[3] = 3
            restore_combo()
            alarm[1] = 5
            machpunchAnim = 1
            image_index = 0
            thrown = 1
            state = 104
            stunned = 200
            image_xscale = (-obj_player.xscale)
            vsp = -4
            hsp = (-image_xscale) * 8
            flash = 1
            gamepadvibrate(0.7, 0, 7)
            if (hitfactor < 10)
                hitfactor += 1
            with (obj_player)
            {
                if ((!grounded) && input_check("jump"))
                    vsp = -11
                do_hitstun(global.mach2hitstun)
            }
        }
        alarm[0] = 15
    }
}
