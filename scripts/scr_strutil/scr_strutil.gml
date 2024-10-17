function string_lpad(argument0, argument1, argument2) //string_lpad
{
    if (argument2 == undefined)
        argument2 = " "
    var padsize = string_length(argument2)
    var padding = argument1 - string_length(argument0)
    if (padding <= 0)
        return argument0;
    var out = string_repeat(argument2, (padding div padsize))
    out += string_copy(argument2, 1, (padding % padsize))
    out += argument0
    out = string_copy(out, 1, argument1)
    return out;
}

function string_padzeros(argument0, argument1) //string_padzeros
{
    if (argument1 == undefined)
        argument1 = 2
    return string_lpad(string(argument0), argument1, "0");
}

