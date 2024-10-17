var p = other.playerid
with (obj_player)
    parry()
if instance_exists(baddieID)
{
    with (baddieID)
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
        image_xscale = (-p.xscale)
        stunned = 200
        if (object_index == obj_weeniesquire)
        {
            stun = 1
            charge = 0
            chargebuffer = 80
        }
        throwhsp = p.xscale * 25
        throwvsp = -6
        if scr_solid(x, y)
        {
            x = p.x
            y = p.y
        }
    }
}
