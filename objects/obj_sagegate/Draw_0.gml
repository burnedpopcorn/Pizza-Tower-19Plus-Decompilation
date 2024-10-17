if (currspr == -1)
    currspr = self.get_sprite("open")
if (currspr == self.get_sprite("open"))
{
    gatespd = 0
    gateind = 0
    if (place_meeting(x, y, obj_player) && (!instance_exists(obj_sagegateplayer)) && unlockedanim >= 1 && unlocked)
        currspr = self.get_sprite()
}
if (currspr == self.get_sprite())
{
    gatespd = 0.05
    gateind += gatespd
    gateind %= sprite_get_number(currspr)
    if (!(place_meeting(x, y, obj_player)))
        currspr = self.get_sprite("open")
}
if (currspr == self.get_sprite("portal"))
{
    gatespd += 0.01
    if (gatespd > 1)
        gatespd = 1
    gateind += gatespd
    gateind %= sprite_get_number(currspr)
}
if unlocked
{
    if (unlockedanim < 1)
    {
        if (!event_isplaying(unlockingsound))
            scr_fmod_soundeffect(unlockingsound, x, y)
        unlockedanim += 0.005
        if (irandom(18) == 2)
            instance_create_depth(irandom_range(bbox_left, bbox_right), bbox_bottom, (depth - 1), obj_towerblockdebris)
        if (irandom(25) == 5)
        {
            with (instance_create_depth(irandom_range(bbox_left, bbox_right), bbox_bottom, (depth - 1), obj_genericpoofeffect))
                sprite_index = spr_deadjohnsmoke
        }
    }
    else if event_isplaying(unlockingsound)
        event_stop(unlockingsound, false)
    if (unlockedanim > 1)
        unlockedanim = 1
}
else
{
    unlockedanim = 0
    if event_isplaying(unlockingsound)
        event_stop(unlockingsound, false)
}
var _gateheight = sprite_get_bbox_bottom(gatespr) - sprite_get_bbox_top(gatespr)
var _gatex = (irandom_range(-1, 1)) * (unlockedanim < 1 && unlocked)
var _gatey = (_gateheight + 1) * (1 - unlockedanim)
if (!surface_exists(gatesurf))
    gatesurf = surface_create(sprite_width, sprite_height)
surface_set_target(gatesurf)
draw_clear_alpha(c_black, 0)
draw_sprite(currspr, gateind, (sprite_width / 2), (sprite_height / 2 + _gatey))
surface_reset_target()
fmod_studio_event_instance_set_parameter_by_name(unlockingsound, "state", (unlockedanim < 1 && unlocked), true)
draw_surface(gatesurf, (x - sprite_width / 2 + _gatex), (y - sprite_height / 2))
draw_set_font(global.scorefont)
draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_set_color(c_white)
if (place_meeting(x, y, obj_player) && (!instance_exists(obj_sagegateplayer)) && unlockedanim >= 1 && unlocked)
{
    var ranky = -150
    var highscorey = ranky + 40
    save_open()
    if global.timetrial
    {
        var _ranksign = ini_read_real("TrialRanks", level, (-1 << 0))
        if (_ranksign != (-1 << 0))
        {
            if (ds_map_find_value(global.timetrialreplays, level) != -1)
            {
                var _time = array_get(ds_map_find_value(global.timetrialreplays, level), 0)
                var _milliseconds = string_padzeros(floor((((abs(_time) / 60) % 60) % 1) * 100))
                var _seconds = string_padzeros(floor((abs(_time) / 60) % 60))
                var _minutes = string_padzeros(((abs(_time) div 60) div 60) % 60)
            }
            var _yoff = 0
            if (_ranksign != (3 << 0) && ds_map_find_value(global.timetrialreplays, level) != -1)
                _yoff = -40
            draw_sprite(spr_trialranks, _ranksign, x, (y + ranky + _yoff))
            if (ds_map_find_value(global.timetrialreplays, level) != -1)
            {
                __draw_text_hook(x, (y + highscorey + _yoff), string_concat(string_get("timetrial/currenttime"), _minutes, ":", _seconds, ".", _milliseconds))
                if (_ranksign != (3 << 0))
                {
                    var _ntime = get_level_tt_time(level, min((_ranksign + 1), (3 << 0)))
                    var _nmilliseconds = string_padzeros(floor((((abs(_ntime) / 60) % 60) % 1) * 100))
                    var _nseconds = string_padzeros(floor((abs(_ntime) / 60) % 60))
                    var _nminutes = string_padzeros(((abs(_ntime) div 60) div 60) % 60)
                    __draw_text_hook(x, (y + highscorey), string_concat(string_get("timetrial/nexttime"), _nminutes, ":", _nseconds, ".", _nmilliseconds))
                }
            }
            else
                __draw_text_hook(x, (y + highscorey + _yoff), "--:--.--")
        }
    }
    else
    {
        _ranksign = ini_read_real("Ranks", level, (-1 << 0))
        if (_ranksign != (-1 << 0))
        {
            draw_sprite(spr_rank, _ranksign, x, (y + ranky - 40))
            var _pizzacoinstr = string_concat(get_levelcoincount(level), "/25")
            var _pizzacoinx = (-((32 + string_width(_pizzacoinstr)))) / 2
            __draw_text_hook(floor(x), (y + highscorey - 40), ini_read_real("Highscores", level, 0))
            draw_set_halign(fa_left)
            draw_sprite(spr_pizzacoin, 0, floor(x + _pizzacoinx), (y + highscorey))
            _pizzacoinx += 32
            __draw_text_hook(floor(x + _pizzacoinx), (y + highscorey), _pizzacoinstr)
        }
    }
    save_close()
}
