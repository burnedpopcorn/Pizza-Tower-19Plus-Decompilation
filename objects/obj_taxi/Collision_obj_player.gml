if (obj_player.state != (89 << 0) && sprite_index == spr_taxiidle)
{
    obj_player.visible = 0
    obj_player.sprite_index = obj_player.spr_idle
    obj_player.hsp = 0
    obj_player.vsp = 0
    obj_player.state = (89 << 0)
    event_play_oneshot("event:/sfx/misc/taxidrive")
    playerid = obj_player
    sprite_index = spr_taximove
    hsp = 10
}
