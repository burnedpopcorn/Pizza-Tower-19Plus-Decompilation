if (array_length(texturelist) > 0)
{
    texture_prefetch(array_pop(texturelist))
    alarm[0] = 1
}
else
    room_goto(logos)
