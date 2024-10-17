if ((!instance_exists(barrelID)) && (!(bbox_in_camera(1, id))) && obj_player.barrel == 0)
    barrelID = instance_create_depth(x, y, 0, obj_barrel)
