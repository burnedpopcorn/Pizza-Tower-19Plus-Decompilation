var _i = array_get_index(global.followers, id)
if (_i != -1)
    array_delete(global.followers, _i, 1)
ds_queue_destroy(followerqueue)
