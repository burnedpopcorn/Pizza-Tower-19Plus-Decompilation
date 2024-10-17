if (fadealpha >= fademax && get_savestate() != (0 << 0))
    return;
if (fadealpha > fademax)
{
    fadein = 1
    if instance_exists(obj_player)
    {
        if (room != obj_player.targetRoom)
            room_goto(obj_player.targetRoom)
    }
}
fadealpha += ((!fadein) ? fadeadd : (-fadeadd))
if (fadein && fadealpha < 0)
    instance_destroy()
