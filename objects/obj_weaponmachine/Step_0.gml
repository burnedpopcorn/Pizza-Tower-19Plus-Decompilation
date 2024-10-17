if (place_meeting(x, (y + 1), obj_player) && obj_player.vsp <= 1 && global.collect >= 2000)
{
    scr_fmod_soundeffectONESHOT("event:/sfx/misc/purchase", x, y)
    add_collect(-2000)
    sprite_index = spr_weaponmachine_used
    mask_index = spr_masknull
    var _ind = 0
    repeat sprite_get_number(spr_weaponmachine_debris)
    {
        var _id = instance_create_depth(x, (y - 57), 0, obj_debris)
        _id.sprite_index = spr_weaponmachine_debris
        _id.image_index = _ind
        _ind++
    }
    ds_list_add(global.saveroom, string("{0}_open", id))
}
if (shield != noone && (!instance_exists(shield)))
{
    ds_list_add(global.saveroom, string("{0}_noshield", id))
    shield = -4
}
