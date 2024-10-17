function gamepadvibrate(argument0, argument1, argument2, argument3, argument4) //gamepadvibrate
{
    if (argument3 == undefined)
        argument3 = 0
    if (argument4 == undefined)
        argument4 = false
    if global.rumble
        input_vibrate_constant(argument0, argument1, argument2, argument3, argument4)
}

