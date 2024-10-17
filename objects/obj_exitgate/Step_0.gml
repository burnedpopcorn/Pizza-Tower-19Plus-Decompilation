if global.panic
{
    image_index = 1
    cutscene = 1
    if (!instance_exists(uparrowid))
        uparrowid = create_uparrow()
}
else if instance_exists(uparrowid)
    instance_destroy(uparrowid)
if (place_meeting(x, y, obj_player) && obj_player.state == (39 << 0) && image_index == 1 && (!global.panic) && obj_player.sprite_index != obj_player.spr_lookdoor && floor(obj_player.image_index) >= 14)
{
    ds_list_add(global.saveroom, id)
    image_index = 0
    camera_shake(3, 3)
    gamepadvibrate(1, 0, 40)
    scr_fmod_soundeffectONESHOT("event:/sfx/player/groundpound", x, y)
    obj_player.state = (31 << 0)
    obj_player.image_index = 0
    obj_player.sprite_index = obj_player.spr_Timesup
    obj_player.image_blend = c_white
    obj_player.doorblend = 1
}
