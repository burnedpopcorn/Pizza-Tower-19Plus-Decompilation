var _soundsourcepos = 
{
    x: (x + 64),
    y: (y + 112)
}

save_open()
var _unlocked = ini_read_real("GameProgress", "timetrialunlocked", false)
save_close()
if (!_unlocked)
{
    if instance_exists(uparrowid)
        instance_destroy(uparrowid)
    return;
}
else if (!instance_exists(uparrowid))
    uparrowid = create_uparrow()
if (place_meeting(x, y, obj_player) && obj_player.state == (0 << 0) && obj_player.grounded && input_check_pressed("up") && (clockspr == spr_timetrialactivator_clock || clockspr == spr_timetrialactivator_clockopened) && clonespr == -4)
{
    global.timetrial = (!global.timetrial)
    save_open()
    if (!(ini_read_real("GameProgress", "turnedontimetrial", false)))
    {
        instance_create_depth(x, y, 0, obj_timetrialexplanation)
        obj_player.state = (122 << 0)
    }
    ini_write_real("GameProgress", "turnedontimetrial", true)
    save_close()
    if global.timetrial
    {
        clockspr = spr_timetrialactivator_clockopen
        clockind = 0
        scr_fmod_soundeffect(clockopen, _soundsourcepos.x, _soundsourcepos.y)
    }
    else
    {
        instance_destroy(obj_clonefollow)
        clonespr = spr_timetrialactivator_clonegoback
        cloneind = 0
    }
}
clockind += image_speed
clockind %= sprite_get_number(clockspr)
if (clonespr != -4)
{
    cloneind += image_speed
    cloneind %= sprite_get_number(clonespr)
}
if (clockspr == spr_timetrialactivator_clockopen && floor(clockind) == (sprite_get_number(clockspr) - 1))
{
    clockspr = spr_timetrialactivator_clockopened
    clonespr = spr_timetrialactivator_clonecomeout
    cloneind = 0
    scr_fmod_soundeffect(cloneexit, _soundsourcepos.x, _soundsourcepos.y)
}
if (clockspr == spr_timetrialactivator_clockclosing && floor(clockind) == (sprite_get_number(clockspr) - 1))
    clockspr = spr_timetrialactivator_clock
if (clonespr == spr_timetrialactivator_clonecomeout && floor(cloneind) == (sprite_get_number(clonespr) - 1))
{
    instance_create_depth((x + 64), (y + 178), (depth - 1), obj_clonefollow)
    clonespr = -4
}
if (clonespr == spr_timetrialactivator_clonegoback)
{
    if (floor(cloneind) == 4 && (!event_isplaying(clonejump)))
        scr_fmod_soundeffect(clonejump, _soundsourcepos.x, _soundsourcepos.y)
    if (floor(cloneind) == 7 && (!event_isplaying(clonestruggle)))
        scr_fmod_soundeffect(clonestruggle, _soundsourcepos.x, _soundsourcepos.y)
    if (floor(cloneind) == 12 && (!event_isplaying(clonegetin)))
        scr_fmod_soundeffect(clonegetin, _soundsourcepos.x, _soundsourcepos.y)
    if (floor(cloneind) == (sprite_get_number(clonespr) - 1))
    {
        clonespr = -4
        clockspr = spr_timetrialactivator_clockclosing
        clockind = 0
        scr_fmod_soundeffect(clockclose, _soundsourcepos.x, _soundsourcepos.y)
    }
}
