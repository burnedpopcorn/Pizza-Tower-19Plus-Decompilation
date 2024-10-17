if global.timetrial
{
    clockspr = spr_timetrialactivator_clockopened
    clockind = 0
    clonespr = -4
    cloneind = 0
    instance_create_depth(obj_player.x, obj_player.y, (obj_player.depth + 1), obj_clonefollow)
}
else
{
    clockspr = spr_timetrialactivator_clock
    clockind = 0
    clonespr = -4
    cloneind = 0
    instance_destroy(obj_clonefollow)
}
