event_inherited()
image_speed = 0
image_index = choose(0, 1, 2)
global.breaksound = 0
depth = 1
var lay_id = layer_get_id("Tiles_1")
var map_id = layer_tilemap_get_id(lay_id)
var data = tilemap_get_at_pixel(map_id, x, y)
var tile_id = tile_get_index(data)
if (tile_id == 50)
    visible = false
