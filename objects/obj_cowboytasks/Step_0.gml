bgx += 0.5
bgy += 0.5
var _move = input_check_opposing_pressed("up", "down")
if (_move != 0 && (select + _move) < 3 && (select + _move) > -1)
    event_play_oneshot("event:/sfx/pausemenu/move")
select = clamp((select + _move), 0, 2)
if input_check_pressed("attack")
{
    event_play_oneshot("event:/sfx/pausemenu/rubbersqueak")
    instance_destroy()
}
