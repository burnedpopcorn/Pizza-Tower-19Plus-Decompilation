function wrap(argument0, argument1, argument2) //wrap
{
    argument0 = floor(argument0)
    var _min = floor(min(argument1, argument2))
    var _max = floor(max(argument1, argument2))
    var range = _max - _min + 1
    return (((((argument0 - _min) % range) + range) % range) + _min);
}

function wrap_angle(argument0) //wrap_angle
{
    while (argument0 < 0)
        argument0 += 360
    while (argument0 > 359)
        argument0 -= 360
    return argument0;
}

function wave(argument0, argument1, argument2, argument3, argument4) //wave
{
    if (argument4 == undefined)
        argument4 = current_time
    var a4 = (argument1 - argument0) * 0.5
    return (argument0 + a4 + (sin((argument4 * 0.001 + argument2 * argument3) / argument2 * (2 * pi))) * a4);
}

function Approach(argument0, argument1, argument2) //Approach
{
    return (argument0 + (clamp((argument1 - argument0), (-abs(argument2)), abs(argument2))));
}

function xscale_angle(argument0) //xscale_angle
{
    return point_direction(0, 0, argument0, 0);
}

