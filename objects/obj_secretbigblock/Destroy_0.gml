if (ds_list_find_index(global.saveroom, id) == -1)
{
    var lay_id = layer_get_id("Tiles_1")
    var map_id = layer_tilemap_get_id(lay_id)
    var data = tilemap_get_at_pixel(map_id, x, y)
    var tile_id = tile_get_index(data)
    switch tile_id
    {
        case 667:
        case 669:
        case 703:
            with (instance_create_depth((x + sprite_width / 2), (y + sprite_width / 2), 2, obj_genericpoofeffect))
                sprite_index = spr_smallpoof
            repeat (7)
            {
                with (instance_create_depth((x + (random_range(0, sprite_width))), (y + (random_range(0, sprite_width))), -1, obj_debris))
                    sprite_index = spr_bigsecretdebris
            }
            break
        case 272:
        case 274:
            with (instance_create_depth((x + sprite_width / 2), (y + sprite_width / 2), 2, obj_genericpoofeffect))
                sprite_index = spr_smallpoof
            repeat (7)
            {
                with (instance_create_depth((x + (random_range(0, sprite_width))), (y + (random_range(0, sprite_width))), -1, obj_debris))
                    sprite_index = spr_bigruindebris1
            }
            push_notif((8 << 0), [object_index])
            break
        case 218:
        case 220:
            with (instance_create_depth((x + sprite_width / 2), (y + sprite_width / 2), 2, obj_genericpoofeffect))
                sprite_index = spr_smallpoof
            repeat (7)
            {
                with (instance_create_depth((x + (random_range(0, sprite_width))), (y + (random_range(0, sprite_width))), -1, obj_debris))
                    sprite_index = spr_bigruindebris2
            }
            break
        case 135:
        case 137:
            with (instance_create_depth((x + sprite_width / 2), (y + sprite_width / 2), 2, obj_genericpoofeffect))
                sprite_index = spr_smallpoof
            repeat (7)
            {
                with (instance_create_depth((x + (random_range(0, sprite_width))), (y + (random_range(0, sprite_width))), -1, obj_debris))
                    sprite_index = spr_dungeondebris
            }
            break
        default:
            repeat (4)
            {
                with (instance_create_depth((x + (random_range(0, sprite_width))), (y + (random_range(0, sprite_width))), 2, obj_genericpoofeffect))
                    sprite_index = spr_deadjohnsmoke
            }
            repeat (7)
                instance_create_depth((x + (random_range(0, sprite_width))), (y + (random_range(0, sprite_width))), -1, obj_towerblockdebris)
            break
    }

    scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
    ds_list_add(global.saveroom, id)
}
delete_covered_tiles()
destroy_clips()
