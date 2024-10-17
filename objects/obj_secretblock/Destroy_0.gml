if (ds_list_find_index(global.saveroom, id) == -1)
{
    var lay_id = layer_get_id("Tiles_1")
    var map_id = layer_tilemap_get_id(lay_id)
    var data = tilemap_get_at_pixel(map_id, x, y)
    var tile_id = tile_get_index(data)
    switch tile_id
    {
        case 671:
        case 672:
        case 689:
        case 690:
            with (instance_create_depth((x + 16), (y + 16), 2, obj_genericpoofeffect))
                sprite_index = spr_smallpoof
            repeat (4)
            {
                with (instance_create_depth((x + 16), (y + 16), -1, obj_debris))
                    sprite_index = spr_smallsecretdebris
            }
            break
        case 222:
        case 249:
            with (instance_create_depth((x + 16), (y + 16), 2, obj_genericpoofeffect))
                sprite_index = spr_smallpoof
            repeat (4)
            {
                with (instance_create_depth((x + 16), (y + 16), -1, obj_debris))
                    sprite_index = spr_smallruindebris1
            }
            push_notif((8 << 0), [object_index])
            break
        case 276:
        case 303:
            with (instance_create_depth((x + 16), (y + 16), 2, obj_genericpoofeffect))
                sprite_index = spr_smallpoof
            repeat (4)
            {
                with (instance_create_depth((x + 16), (y + 16), -1, obj_debris))
                    sprite_index = spr_smallruindebris2
            }
            break
        case 192:
        case 193:
            with (instance_create_depth((x + 16), (y + 16), 2, obj_genericpoofeffect))
                sprite_index = spr_smallpoof
            repeat (4)
            {
                with (instance_create_depth((x + 16), (y + 16), -1, obj_debris))
                    sprite_index = spr_dungeondebris
            }
            break
        default:
            with (instance_create_depth((x + 16), (y + 16), 2, obj_genericpoofeffect))
                sprite_index = spr_deadjohnsmoke
            repeat (2)
                instance_create_depth((x + 16), (y + 16), -1, obj_towerblockdebris)
            break
    }

    scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
    ds_list_add(global.saveroom, id)
}
delete_covered_tiles()
destroy_clips()
