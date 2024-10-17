with (other.id)
{
    treasure_x = x
    treasure_y = y
    treasure_room = room
    ds_list_add(global.saveroom, other.id)
    hsp = 0
    vsp = 0
    if (!other.got)
    {
        other.alarm[0] = 150
        state = (17 << 0)
        event_play_oneshot("event:/sfx/misc/secretfound")
    }
    other.got = true
    other.x = x
    other.y = y - 35
    obj_drawcontroller.showtext = 1
    obj_drawcontroller.message = "YOU GOT A TOWER SECRET TREASURE!!!"
    obj_drawcontroller.alarm[9] = 30
}
