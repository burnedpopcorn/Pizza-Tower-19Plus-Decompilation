var _maxAngles = 8
for (var _i = 0; _i < _maxAngles; _i++)
{
    var _dir = 360 / _maxAngles * _i
    var _x = lengthdir_x(16, _dir)
    var _y = lengthdir_y(16, _dir)
    instance_create_depth((x + _x), (y + _y), (depth + 1), obj_debris).sprite_index = spr_fireparticle
    instance_create_depth((x + _x), (y + _y), (depth + 1), obj_fireballparryeffect).image_angle = _dir
}
scr_fmod_soundeffectONESHOT("event:/sfx/misc/dragonfireballdestroy", x, y)
