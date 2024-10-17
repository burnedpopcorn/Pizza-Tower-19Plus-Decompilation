if (distance_to_object(obj_player) < 200)
    sprite_index = spr_player_notthrowingitback
else if (distance_to_object(obj_player) > 200)
    sprite_index = spr_player_throwitback
image_xscale = (-(sign(obj_player.x - x)))
