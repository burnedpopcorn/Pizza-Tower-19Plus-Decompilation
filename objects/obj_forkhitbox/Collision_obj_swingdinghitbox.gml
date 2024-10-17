with (other.playerid)
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
        image_xscale = (-other.playerid.xscale)
        stunned = 200
        throwhsp = other.playerid.xscale * 25
        throwvsp = -6
        if scr_solid(x, y)
        {
            x = other.playerid.x
            y = other.playerid.y
        }
    }
}
