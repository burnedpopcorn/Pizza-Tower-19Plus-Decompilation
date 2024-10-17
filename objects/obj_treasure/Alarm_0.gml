obj_player.state = (0 << 0)
with (instance_create_depth(x, y, -9999999, obj_collectparticle))
{
    sprite_index = other.sprite_index
    image_speed = other.image_speed
    image_index = other.image_index
    value = 3000
    shake = 15
}
with (instance_create_depth(x, y, 0, obj_smallnumber))
    number = "3000"
global.treasure = true
add_collect(3000)
