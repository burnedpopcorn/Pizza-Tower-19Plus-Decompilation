if (active && sprite_index != spr_secretportal_open && ds_list_find_index(global.saveroom, id) == -1)
{
    if (sprite_index != spr_secretportal_close)
    {
        sprite_index = spr_secretportal_close
        image_index = 0
        event_play_oneshot("event:/sfx/player/entereye")
    }
    playerid = other.id
    other.x = x
    other.y = y - 30
    other.vsp = 0
    other.hsp = 0
    other.cutscene = 1
    if (!touched)
    {
        if (other.state != (18 << 0) && other.state != (13 << 0) && other.state != (115 << 0) && other.state != (5 << 0))
        {
            other.sprite_index = other.spr_hurt
            other.image_speed = 0.35
        }
        if (other.state == (13 << 0))
        {
            other.sprite_index = other.spr_knightpepfall
            other.state = (18 << 0)
            other.hsp = 0
            other.vsp = 0
        }
        other.tauntstoredstate = other.state
        other.tauntstoredmovespeed = other.movespeed
        other.tauntstoredhsp = other.hsp
        other.tauntstoredvsp = other.vsp
        other.tauntstoredsprite = other.sprite_index
        other.tauntstoredimageindex = other.image_index
        other.state = (116 << 0)
        other.enteringsecret = 1
    }
    touched = true
    with (obj_heataura)
        visible = false
    instance_destroy(obj_superchargeeffect)
}
if (sprite_index != spr_secretportal_close || (sprite_index == spr_secretportal_close && image_index < (image_number - 1)))
{
    if (global.currentbadge != (3 << 0))
        restore_combo()
}
