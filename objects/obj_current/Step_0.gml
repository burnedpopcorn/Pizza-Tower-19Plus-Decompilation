visible = 1
with (instance_place(x, (y - 1), obj_player))
{
    if (!(place_meeting(x, y, obj_pipepar)))
    {
        if (state != (64 << 0) && state != (87 << 0))
        {
            state = (64 << 0)
            sprite_index = obj_player.spr_Current
        }
    }
}
