if (state == 0)
{
    if (!metrequirement)
    {
        if instance_exists(uparrowid)
            instance_destroy(uparrowid)
    }
    else if (!instance_exists(uparrowid))
        uparrowid = create_uparrow()
    draw_self()
    draw_sprite(spr_gauntletsign, 0, (x - 75), (bbox_bottom - 32))
}
if (state == 1)
{
    if instance_exists(uparrowid)
        instance_destroy(uparrowid)
    treasurelerp += 0.05
    var _treasure = world - 1 + currtreasure
    var _treasurex = lerp(obj_player.x, x, treasurelerp)
    var _treasurey = lerp(obj_player.y, y, treasurelerp)
    if (treasurelerp >= 1)
    {
        treasurelerp = 0
        currtreasure++
        scr_fmod_soundeffectONESHOT("event:/sfx/player/collect/topping", (_treasurex + 16), (_treasurey + 16))
        repeat (5)
        {
            with (instance_create_depth((_treasurex + 16), (_treasurey + 16), -1, obj_debris))
                sprite_index = spr_treasuredebris
        }
    }
    if (currtreasure > 3)
    {
        obj_player.hsp = 0
        obj_player.vsp = 0
        obj_player.movespeed = 0
        obj_player.state = (0 << 0)
        self.create_func()
        instance_destroy()
    }
    draw_sprite(spr_treasure, _treasure, _treasurex, _treasurey)
}
