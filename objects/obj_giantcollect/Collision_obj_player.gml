with (instance_create_depth(x, y, -9999999, obj_collectparticle))
{
    sprite_index = other.id.sprite_index
    image_speed = other.image_speed
    image_index = other.image_index
    value = 1000
    shake = 10
}
add_collect(1000)
with (instance_create_depth((x + 16), y, 0, obj_smallnumber))
    number = "1000"
scr_fmod_soundeffectONESHOT("event:/sfx/player/collect/giantpizza", x, y)
instance_destroy()
restore_combo()
with (obj_drawcontroller)
{
    happyhud = 1
    alarm[10] = 120
}
with (other.id)
    voice_collect(obj_player)
