scr_fmod_soundeffectONESHOT("event:/sfx/enemy/die", x, y)
scr_enemygibs()
with (instance_create_depth(x, y, -8, obj_baddiedead))
    sprite_index = spr_pizzaface_dead
instance_destroy()
