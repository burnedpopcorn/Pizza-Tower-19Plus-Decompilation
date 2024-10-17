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
draw_sprite(sprite_index, image_index, (sprite_width / 2), (sprite_height / 2 + _gatey))
surface_reset_target()
fmod_studio_event_instance_set_parameter_by_name(unlockingsound, "state", (unlockedanim < 1 && unlocked), true)
draw_surface(gatesurf, (x - sprite_width / 2 + _gatex), (y - sprite_height / 2))
draw_set_font(global.scorefont)
draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_set_color(c_white)
if (distance_to_object(obj_player) < 50)
{
    if (level != "")
    {
        var ranky = -200
        var highscorey = ranky + 40
        save_open()
        if global.timetrial
        {
            if (ds_map_find_value(global.timetrialreplays, level) != -1)
            {
                var _time = array_get(ds_map_find_value(global.timetrialreplays, level), 0)
                var _milliseconds = string_padzeros(floor((((abs(_time) / 60) % 60) % 1) * 100))
                var _seconds = string_padzeros(floor((abs(_time) / 60) % 60))
                var _minutes = string_padzeros(((abs(_time) div 60) div 60) % 60)
                var _ranksign = ini_read_real("TrialRanks", level, (-1 << 0))
                if (_ranksign != (-1 << 0))
                {
                    draw_sprite(spr_trialranks, _ranksign, x, (y + ranky))
                    __draw_text_hook(x, (y + highscorey), string_concat(_minutes, ":", _seconds, ".", _milliseconds))
                }
            }
        }
        else
        {
            _ranksign = ini_read_real("Ranks", level, (-1 << 0))
            if (_ranksign != (-1 << 0))
            {
                draw_set_halign(fa_left)
                draw_sprite(spr_rank, _ranksign, x, (y + ranky))
                var _scorestr = string_concat(ini_read_real("Highscores", level, 0), "/")
                var _scorex = (-((string_width(_scorestr) + 32 + string_width(get_levelcoincount(level))))) / 2
                __draw_text_hook(floor(x + _scorex), (y + highscorey), _scorestr)
                _scorex += string_width(_scorestr)
                draw_sprite(spr_pizzacoin, 0, floor(x + _scorex), (y + highscorey))
                _scorex += 32
                __draw_text_hook(floor(x + _scorex), (y + highscorey), get_levelcoincount(level))
            }
        }
        save_close()
    }
}
