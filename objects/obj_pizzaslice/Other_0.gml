with (instance_create_depth(x, y, -9999999, obj_collectparticle))
{
    sprite_index = other.id.sprite_index
    image_speed = other.image_speed
    image_index = other.image_index
    value = 25
    shake = 6
}
add_collect(25)
with (instance_create_depth((x + 16), y, 0, obj_smallnumber))
    number = "25"
scr_fmod_soundeffectONESHOT("event:/sfx/player/collect/topping", x, y)
instance_destroy()
restore_combo()
