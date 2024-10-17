visible = 1
with (obj_player)
{
    if ((place_meeting((x + hsp), y, other.id) || place_meeting((x + xscale), y, other.id)) && (obj_player.state == (13 << 0) || (obj_player.state == (66 << 0) && obj_player.sprite_index == obj_player.spr_rocketdash) || (obj_player.state == (66 << 0) && obj_player.sprite_index == obj_player.spr_rocketdashstart) || (obj_player.state == (66 << 0) && obj_player.sprite_index == spr_player_rocketrun)))
    {
        instance_create_depth((other.id.x + 32), (other.id.y + 32), -100, obj_genericpoofeffect)
        instance_destroy(other.id)
    }
}
if (place_meeting(x, (y + 1), obj_player) || place_meeting(x, (y - 1), obj_player) || place_meeting((x - 1), y, obj_player) || place_meeting((x + 1), y, obj_player))
{
    if (obj_player.state == (18 << 0) || (obj_player.state == (51 << 0) && obj_player.sprite_index == spr_player_firemoveend))
    {
        if place_meeting(x, (y - 1), obj_player)
        {
            instance_create_depth((x + 32), (y + 32), -100, obj_genericpoofeffect)
            instance_destroy()
        }
    }
}
