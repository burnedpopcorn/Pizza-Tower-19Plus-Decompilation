var plrid = other.playerid
with (plrid)
    parry()
if instance_exists(ID)
{
    with (ID)
    {
        hp = 1
        parried = 1
        sprite_index = stunfallspr
        scr_enemygibs()
        camera_shake(3, 3)
        alarm[3] = 3
        restore_combo()
        alarm[1] = 5
        thrown = 1
        state = 104
        image_xscale = (-plrid.xscale)
        stunned = 200
        throwhsp = plrid.xscale * 25
        throwvsp = -6
        hsp = throwhsp
        vsp = throwvsp
        if scr_solid(x, y)
        {
            x = plrid.x
            y = plrid.y
        }
    }
}
