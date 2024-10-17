if (ds_list_find_index(global.baddieroom, id) == -1 && (!important))
{
    scr_fmod_soundeffectONESHOT("event:/sfx/enemy/die", x, y)
    scr_enemygibs()
    instance_create_depth(x, y, -100, obj_genericpoofeffect)
    camera_shake(3, 3)
    scr_enemycorpse()
}
else if (ds_list_find_index(global.baddieroom, id) == -1 && important)
{
    scr_enemygibs()
    instance_create_depth(x, y, -100, obj_genericpoofeffect)
    camera_shake(3, 3)
    scr_enemycorpse()
}
