event_inherited()
var _i = array_get_index(global.followers, id)
if (_i != -1)
    array_delete(global.followers, _i, 1)
persistent = false
tauntid = -4
taunted = false
sprite_index = choose(spr_gerome_idle, spr_gerome_sandwich, spr_gerome_sleeping)
image_speed = 0.35
entrydialogue = 0
