if instance_exists(obj_player)
{
    x = obj_player.x
    y = obj_player.y
}
shake_mag = 0
shake_mag_acc = 0
dark = instance_exists(obj_darkRoom)
if dark
{
    if instance_exists(obj_solid)
        obj_solid.image_blend = c_black
    if instance_exists(obj_platform)
        obj_platform.image_blend = c_black
    if instance_exists(obj_slope)
        obj_slope.image_blend = c_black
}
ghostcollectibles = array_create(0)
ds_map_clear(secretlayers)
var _layers = layer_get_all()
for (var _i = 0; _i < array_length(_layers); _i++)
{
    var _l = _layers[_i]
    if (string_pos("hidden", string_lower(layer_get_name(_l))) > 0)
        ds_map_add(secretlayers, _l, 0)
}
camera_set_view_size(view_camera[0], get_game_width(), get_game_height())
camera_set_view_size(view_camera[1], global.maxscreenwidth, global.maxscreenheight)
