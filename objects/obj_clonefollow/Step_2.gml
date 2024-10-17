event_inherited()
if instance_exists(obj_sagegateplayer)
    sprite_index = spr_player_breakdanceslide
else
    sprite_index = (obj_moved(x, xprevious) ? spr_player_move : (obj_moved(y, yprevious) ? spr_player_move : spr_player_idlecalmer))
