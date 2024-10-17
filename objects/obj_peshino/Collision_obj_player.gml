if (obj_player.state != (50 << 0) && (!there_is_follower_id(id)))
{
    ds_list_add(global.saveroom, id)
    panic = 0
}
