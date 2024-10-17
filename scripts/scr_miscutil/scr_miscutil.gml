function array_get_undefined(argument0, argument1)
{
    try
    {
        return array_get(argument0, argument1);
    }
    catch (_ex)
    {
        return undefined;
    }
}

function is_player_grabbing(argument0) //is_player_grabbing
{
    if (argument0 == undefined)
        argument0 = obj_player
    return (argument0.state == (16 << 0) || argument0.state == (73 << 0) || argument0.state == (91 << 0) || argument0.state == (118 << 0));
}

function draw_rotated_primcircle(argument0, argument1, argument2, argument3, argument4) //draw_rotated_primcircle
{
    var _add = 360 / argument4
    draw_primitive_begin(6)
    draw_vertex(argument0, argument1)
    for (var i = 0; i < argument4; i++)
        draw_vertex((argument0 + (lengthdir_x(argument2, (argument3 + _add * i)))), (argument1 + (lengthdir_y(argument2, (argument3 + _add * i)))))
    draw_primitive_end()
}

function roundlower(argument0) //roundlower
{
    if (frac(argument0) <= 0.5)
        return floor(argument0);
    if (frac(argument0) > 0.5)
        return ceil(argument0);
}

function delete_covered_tiles(argument0, argument1) //delete_covered_tiles
{
    if (argument0 == undefined)
        argument0 = id
    if (argument1 == undefined)
        argument1 = false
    with (argument0)
    {
        var _layers = layer_get_all()
        for (var i = 0; i < array_length(_layers); i++)
        {
            if (string_pos("KITY", layer_get_name(_layers[i])) > 0)
            {
            }
            else
            {
                var _layer = _layers[i]
                var _mapid = layer_tilemap_get_id(_layer)
                if (_mapid < 0)
                {
                }
                else
                {
                    var _tileset = tilemap_get_tileset(_mapid)
                    var _gridW = tilemap_get_tile_width(_mapid)
                    var _gridH = tilemap_get_tile_height(_mapid)
                    var _occupiedtilesX = sprite_width / _gridW
                    var _occupiedtilesY = sprite_height / _gridH
                    for (var _x = 0; _x < _occupiedtilesX; _x++)
                    {
                        for (var _y = 0; _y < _occupiedtilesY; _y++)
                        {
                            var _tilex = floor(x + _gridW * _x)
                            var _tiley = floor(y + _gridH * _y)
                            var _data = tilemap_get_at_pixel(_mapid, (_tilex + 1), (_tiley + 1))
                            if argument1
                            {
                                with (instance_create_depth(_tilex, _tiley, 0, obj_tiledebris))
                                {
                                    tileset = _tileset
                                    data = _data
                                }
                            }
                            _data = tile_set_empty(_data)
                            tilemap_set_at_pixel(_mapid, _data, (_tilex + 1), (_tiley + 1))
                        }
                    }
                }
            }
        }
    }
}

function destroy_clips() //destroy_clips
{
    var _checks = [[(x - 1), y], [(x + 1), y], [x, (y - 1)], [x, (y + 1)]]
    for (var _i = 0; _i < array_length(_checks); _i++)
    {
        var _pos = _checks[_i]
        for (var _inst = instance_place(_pos[0], _pos[1], obj_clipparent); _inst != -4; _inst = instance_place(_pos[0], _pos[1], obj_clipparent))
            instance_destroy(_inst)
    }
}

function object_is_parent_or_ancestor(argument0, argument1) //object_is_parent_or_ancestor
{
    if (argument1 == undefined)
        argument1 = object_index
    return (argument1 == argument0 || object_is_ancestor(argument1, argument0));
}

function reset_aspectratio() //reset_aspectratio
{
    var _width = global.currentinternalres[0]
    var _height = global.currentinternalres[1]
    var _width2 = global.currentres[0]
    var _height2 = global.currentres[1]
    var _width3 = global.maxscreenwidth
    var _height3 = global.maxscreenheight
    view_wport[0] = _width
    view_hport[0] = _height
    view_wport[1] = _width3
    view_hport[1] = _height3
    camera_set_view_size(view_camera[0], _width, _height)
    camera_set_view_size(view_camera[1], _width3, _height3)
    surface_resize(application_surface, _width2, _height2)
    if (global.fullscreen == 0 && (!gameframe_is_maximised()))
        gameframe_restore(true)
    else
        gameframe_set_fullscreen(global.fullscreen)
    if (global.fullscreen == 0 && (!gameframe_is_maximised()))
    {
        window_set_size(_width2, _height2)
        window_center()
    }
    display_reset(0, global.vsync)
}

function apply_videoglobals() //apply_videoglobals
{
    global.currentres = global.screensizes[global.resmode][global.resnumb]
    global.currentinternalres = global.screensizes[global.resmode][1]
    reset_aspectratio()
}

function apply_inputglobals() //apply_inputglobals
{
    input_axis_threshold_set(32785, global.horizdeadzone, 1)
    input_axis_threshold_set(32787, global.horizdeadzone, 1)
    input_axis_threshold_set(32786, global.vertdeadzone, 1)
    input_axis_threshold_set(32788, global.vertdeadzone, 1)
}

function array_find_pos(argument0, argument1) //array_find_pos
{
    for (var i = 0; i < array_length(argument0); i++)
    {
        if (argument0[i] == argument1)
            return i;
    }
    return -1;
}

function string_wordwrap_width(argument0, argument1, argument2, argument3) //string_wordwrap_width
{
    var pos_space = -1
    var pos_current = 1
    var text_current = argument0
    if is_real(argument2)
        argument2 = "#"
    var text_output = ""
    while (string_length(text_current) >= pos_current)
    {
        if (string_width(string_copy(text_current, 1, pos_current)) > argument1)
        {
            if (pos_space != -1)
            {
                text_output += ((string_copy(text_current, 1, pos_space)) + string(argument2))
                text_current = string_copy(text_current, (pos_space + 1), (string_length(text_current) - pos_space))
                pos_current = 1
                pos_space = -1
            }
            else if argument3
            {
                text_output += ((string_copy(text_current, 1, (pos_current - 1))) + string(argument2))
                text_current = string_copy(text_current, pos_current, (string_length(text_current) - (pos_current - 1)))
                pos_current = 1
                pos_space = -1
            }
        }
        pos_current += 1
        if (string_char_at(text_current, pos_current) == " ")
            pos_space = pos_current
    }
    if (string_length(text_current) > 0)
        text_output += text_current
    return text_output;
}

function there_is_follower_obj(argument0) //there_is_follower_obj
{
    with (argument0)
    {
        if (array_get_index(global.followers, id) != -1)
            return true;
    }
    return false;
}

function there_is_follower_id(argument0) //there_is_follower_id
{
    return (instance_exists(argument0) && array_get_index(global.followers, argument0) != -1);
}

function create_uparrow() //create_uparrow
{
    var _createdID = instance_create_depth(bbox_left, bbox_top, depth, obj_uparrowhitbox)
    _createdID.image_xscale = bbox_right - bbox_left
    _createdID.image_yscale = bbox_bottom - bbox_top
    _createdID.owner = id
    return _createdID;
}

function fire_ray(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) //fire_ray
{
    if (argument4 == undefined)
        argument4 = 1
    if (argument5 == undefined)
        argument5 = noone
    if (argument6 == undefined)
        argument6 = -4
    if (argument7 == undefined)
        argument7 = spr_1x1
    var _dist = point_distance(argument0, argument1, argument2, argument3)
    var _dir = point_direction(argument0, argument1, argument2, argument3)
    var _mask = mask_index
    var _raystruct = 
    {
        x: 0,
        y: 0,
        clear: true
    }

    var _ogx = x
    var _ogy = y
    mask_index = argument7
    if (_dist > 0)
    {
        var i = 0
        while (i < _dist)
        {
            _raystruct.x = argument0 + (lengthdir_x(i, _dir))
            _raystruct.y = argument1 + (lengthdir_y(i, _dir))
            x = _raystruct.x
            y = _raystruct.y
            _raystruct.clear = true
            if scr_solid((x + (sign(lengthdir_x(1, _dir)))), (y + (sign(lengthdir_y(1, _dir)))))
            {
                if (argument5 == noone || (!(place_meeting((x + (sign(lengthdir_x(1, _dir)))), (y + (sign(lengthdir_y(1, _dir)))), argument5))))
                {
                    _raystruct.clear = false
                    break
                }
                else
                    i += argument4
            }
            else
                i += argument4
        }
    }
    mask_index = _mask
    x = _ogx
    y = _ogy
    return _raystruct;
}

function fast_ray(argument0, argument1, argument2, argument3) //fast_ray
{
    static _il = global.instancelist

    var _y = argument3
    var _num = collision_rectangle_list(argument0, argument1, argument2, argument3, [obj_solid, obj_slope, (argument3 > argument1 ? obj_platform : noone)], false, true, _il, true)
    for (var _i = 0; _i < _num; _i++)
    {
        var _instance = ds_list_find_value(_il, _i)
        if (place_meeting(x, y, _instance) && object_is_parent_or_ancestor(obj_platform, _instance.object_index))
        {
        }
        else if object_is_parent_or_ancestor(obj_slope, _instance.object_index)
        {
            with (_instance)
            {
                var object_side = 0
                var slope_start = 0
                var slope_end = 0
                if (image_xscale > 0)
                {
                    object_side = max(argument0, argument2)
                    slope_start = bbox_bottom
                    slope_end = bbox_top
                }
                else
                {
                    object_side = min(argument0, argument2)
                    slope_start = bbox_top
                    slope_end = bbox_bottom
                }
                var m = sign(image_xscale) * (bbox_bottom - bbox_top) / (bbox_right - bbox_left)
                _y = min(clamp((slope_start - (round(m * (object_side - bbox_left)))), bbox_top, bbox_bottom), _y)
            }
        }
        else
            _y = min(_y, _instance.bbox_top)
    }
    ds_list_clear(_il)
    return (_y - 1);
}

function get_escapetime(argument0) //get_escapetime
{
    switch global.levelname
    {
        case "entry":
            return 195;
        case "medieval":
            return 165;
        case "ruin":
            return 200;
        case "dungeon":
            return 260;
        case "dragonslair":
            return 125;
        case "sewer":
            return 270;
        case "chateau":
            return 239;
        case "factory":
            return 299;
        case "etb":
            return 180;
        default:
            return 60;
    }

}

function add_ghostcollect() //add_ghostcollect
{
    if obj_music.secret
    {
        with (obj_drawcontroller)
        {
            array_push(ghostcollectibles, 
            {
                sprite_index: other.sprite_index,
                image_index: other.image_index,
                image_speed: other.image_speed,
                image_number: other.image_number,
                x: other.xstart,
                y: other.ystart
            }
)
        }
    }
}

function create_key(argument0) //create_key
{
    return 
    {
        key: argument0
    };
}

function scr_tiptext(argument0, argument1) //scr_tiptext
{
    if (argument1 == undefined)
        argument1 = noone
    var _dothing = true
    var _id = -4
    if (argument1 != noone)
    {
        save_open()
        _dothing = (!(ini_read_real("GameProgress", argument1, false)))
        ini_write_real("GameProgress", argument1, true)
        save_close()
    }
    if _dothing
    {
        instance_destroy(obj_tiptext)
        with (instance_create_depth(0, 0, -11500, obj_tiptext))
        {
            text = argument0
            _id = id
        }
    }
    return _id;
}

function draw_input(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11) //draw_input
{
    if (argument4 == undefined)
        argument4 = true
    if (argument5 == undefined)
        argument5 = input_profile_get()
    if (argument6 == undefined)
        argument6 = 0
    if (argument7 == undefined)
        argument7 = spr_controllerbuttons
    if (argument8 == undefined)
        argument8 = spr_keyboardkey
    if (argument9 == undefined)
        argument9 = spr_keyfunctions
    if (argument10 == undefined)
        argument10 = global.keyfont
    if (argument11 == undefined)
        argument11 = c_black
    if (argument3 != "any")
    {
        var _icon = input_verb_get_icon(argument3, 0, argument6, argument5)
        if (is_struct(_icon) || is_string(_icon))
        {
            draw_sprite_ext(argument8, 0, argument0, argument1, 1, 1, 0, c_white, argument2)
            if is_string(_icon)
            {
                var _prevfont = draw_get_font()
                draw_set_font(argument10)
                __draw_text_colour_hook(argument0, argument1, _icon, argument11, argument11, argument11, argument11, argument2)
                draw_set_font(_prevfont)
            }
            else
                draw_sprite_ext(argument9, _icon.key, argument0, argument1, 1, 1, 0, argument11, argument2)
        }
        else
        {
            var _ind = _icon
            if argument4
            {
                switch _ind
                {
                    case 7:
                    case 15:
                    case 20:
                        _ind = 39
                        break
                    case 5:
                    case 13:
                    case 18:
                        _ind = 37
                        break
                    case 6:
                    case 14:
                    case 19:
                        _ind = 38
                        break
                    case 4:
                    case 12:
                    case 17:
                        _ind = 36
                        break
                }

            }
            draw_sprite_ext(argument7, _ind, argument0, argument1, 1, 1, 0, c_white, argument2)
        }
    }
    else
        draw_sprite_ext(argument7, 35, argument0, argument1, 1, 1, 0, c_white, argument2)
}

function end_combo_abrupt() //end_combo_abrupt
{
    with (obj_player)
    {
        if (global.combo > 0)
        {
            global.combo = 0
            global.combotime = 0
            add_collect(global.combopoints)
            var _pizzas = (global.currentbadge == (3 << 0)) + 1
            repeat _pizzas
            {
                with (instance_create_depth((x + (irandom_range(-3, 3))), (y + (irandom_range(-3, 3))), -15000, obj_collectparticle))
                {
                    sprite_index = get_collectspr((2 << 0), obj_player.character)
                    image_speed = 0.35
                    value = global.combopoints
                    shake = 10
                }
            }
            global.combopoints = 0
        }
    }
}

function end_combopoint_abrupt() //end_combopoint_abrupt
{
    with (obj_player)
    {
        if combopointduration
        {
            add_collect(combopointstogive)
            var _pizzas = (global.currentbadge == (3 << 0)) + 1
            repeat _pizzas
            {
                with (instance_create_depth((x + (irandom_range(-3, 3))), (y + (irandom_range(-3, 3))), -15000, obj_collectparticle))
                {
                    sprite_index = get_collectspr((2 << 0), obj_player.character)
                    image_speed = 0.35
                    value = other.combopointstogive
                    shake = 10
                }
            }
            combopointstogive = 0
            global.combopoints = 0
            combopointduration = false
        }
    }
}

function json_are_equal(argument0, argument1) //json_are_equal
{
    var type = typeof(argument0)
    if (type != typeof(argument1))
        return false;
    switch type
    {
        case "array":
            var n = array_length(argument0)
            if (n != array_length(argument1))
                return false;
            for (var i = 0; i < n; i++)
            {
                if (!(json_are_equal(argument0[i], argument1[i])))
                    return false;
            }
            break
        case "struct":
            var ks = variable_struct_get_names(argument0)
            n = array_length(ks)
            var ksb = variable_struct_get_names(argument1)
            if (n != array_length(ksb))
                return false;
            for (i = 0; i < n; i++)
            {
                var k = ks[i]
                if (!((variable_struct_exists(argument1, k) && json_are_equal(variable_struct_get(argument0, k), variable_struct_get(argument1, k)))))
                    return false;
            }
            break
        default:
            if (argument0 != argument1)
                return false;
    }

}

function obj_moved(argument0, argument1) //obj_moved
{
    return abs(argument1 - argument0) >= 1;
}

function update_object_coordinates(argument0) //update_object_coordinates
{
    if (argument0 == undefined)
        argument0 = id
    if (room != rank_room && room != rank_roomtutorial)
    {
        with (obj_pizzaface)
        {
            x = argument0.x
            y = argument0.y
        }
    }
    with (obj_keyinv)
    {
        x = (argument0.xscale == 1 ? (argument0.x - 32) : (argument0.x + 32))
        y = argument0.y - 16
    }
    with (obj_cowboyhat)
    {
        if persistent
        {
            x = argument0.x
            y = argument0.y + sprite_get_bbox_top(argument0.sprite_index) - 15
        }
    }
    with (argument0)
        array_foreach(global.followers, function(argument0, argument1) //anon@14252@update_object_coordinates_scr_miscutil
        {
            with (argument0)
            {
                ds_queue_clear(followerqueue)
                x = other.x
                y = other.y
            }
        }
)
}

function get_coins() //get_coins
{
    var _coins = 0
    for (var i = 0; i < array_length(global.levels); i++)
        _coins += ds_list_size(ds_map_find_value(global.pizzacointracker, global.levels[i]))
    _coins -= ini_read_real("GameProgress", "usedcoins", 0)
    return _coins;
}

function all_badges_bought() //all_badges_bought
{
    var _badges = ["kungfu", "breakdance", "nohit"]
    for (var i = 0; i < array_length(_badges); i++)
    {
        if (!(ini_read_real("UnlockedBadges", _badges[i], false)))
            return false;
    }
    return true;
}

function badge_at_pos(argument0, argument1, argument2, argument3, argument4, argument5) //badge_at_pos
{
    if (argument4 == undefined)
        argument4 = 0
    if (argument5 == undefined)
        argument5 = 0
    var _badgewidth = 128
    var _badgeheight = 128
    var _badgeswidth = argument0 / argument1
    _badgeswidth *= _badgewidth
    var _badgesheight = argument1 * _badgeheight
    var _badgestruct = 
    {
        x: argument3,
        y: argument3,
        info: array_get_undefined(argument2, argument3)
    }

    with (_badgestruct)
    {
        x %= (argument0 / argument1)
        x *= _badgewidth
        x += (_badgewidth / 2)
        x -= (_badgeswidth / 2)
        x += argument4
        y = y / argument0 * argument1
        y = floor(y)
        y *= _badgeheight
        y += (_badgeheight / 2)
        y -= (_badgesheight / 2)
        y += argument5
    }
    return _badgestruct;
}

function get_collectspr(argument0, argument1) //get_collectspr
{
    switch argument0
    {
        case (0 << 0):
            if (argument1 == "N")
                return choose(spr_halloweencollectibles1, spr_halloweencollectibles2, spr_halloweencollectibles3, spr_halloweencollectibles4, spr_halloweencollectibles5);
            if (argument1 == "S")
                return spr_snickcollectible1;
            return choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect);
        case (1 << 0):
            return spr_pizzaslice;
        case (2 << 0):
            if (argument1 == "N")
                return choose(spr_pizzacollect1halloween, spr_pizzacollect2halloween, spr_pizzacollect3halloween);
            if (argument1 == "S")
                return spr_snickcollectible2;
            return choose(spr_pizzacollect, spr_pizzacollect2, spr_pizzacollect3, spr_pizzacollect4, spr_pizzacollect5);
        case (3 << 0):
            if (argument1 == "N")
                return spr_giantpizzahalloween;
            if (argument1 == "S")
                return spr_snickcollectible3;
            return spr_giantpizza;
        case (4 << 0):
            if (argument1 == "N")
                return spr_noisedestroyable2;
            return spr_destroyable2;
        case (5 << 0):
            if (argument1 == "N")
                return spr_noisedestroyable2dead;
            return spr_destroyable2dead;
        case (6 << 0):
            if (argument1 == "N")
                return spr_noisedestroyable2big;
            return spr_destroyable2big;
        case (7 << 0):
            if (argument1 == "N")
                return spr_noisedestroyable2bigdead;
            return spr_destroyable2bigdead;
    }

}

function get_toppincount() //get_toppincount
{
    var _toppins = [obj_pizzakinshroom, obj_pizzakincheese, obj_pizzakintomato, obj_pizzakinsausage, obj_pizzakinpineapple]
    var _num = 0
    for (var i = 0; i < array_length(_toppins); i++)
    {
        if there_is_follower_obj(_toppins[i])
            _num++
    }
    return _num;
}

function restore_combo(argument0) //restore_combo
{
    if (argument0 == undefined)
        argument0 = 60
    if (global.currentbadge == (3 << 0) && global.combogalstate != 0 && global.levelname != "tutorial")
        return;
    if (global.combo <= 0 || argument0 < 0)
        return;
    global.combotime += argument0
    global.combotime = min(60, global.combotime)
    if (global.combogalstate < 1)
        global.combogalstate = 1
}

function add_combo(argument0) //add_combo
{
    if (argument0 == undefined)
        argument0 = 1
    if (global.currentbadge == (3 << 0) && global.combogalstate == 2 && global.levelname != "tutorial")
        return;
    global.combo += argument0
    obj_player.supertauntcooldown += 1
    restore_combo()
}

function add_collect(argument0) //add_collect
{
    if (argument0 == undefined)
        argument0 = 5
    global.collect += argument0
}

function ach_perc() //ach_perc
{
    var _count = 0
    for (var i = 0; i < array_length(obj_achievementtracker.achievementlist); i++)
        _count += ini_read_real("Achievements", obj_achievementtracker.achievementlist[i], false)
    return (_count / array_length(obj_achievementtracker.achievementlist));
}

function get_levelcoincount(argument0) //get_levelcoincount
{
    return ds_list_size(ds_map_find_value(global.pizzacointracker, argument0));
}

function string_width_fancy(argument0) //string_width_fancy
{
    var _font = draw_get_font()
    var _width = 0
    argument0 = string_replace_all(argument0, "{S}", "")
    argument0 = string_replace_all(argument0, "{V}", "")
    argument0 = string_replace_all(argument0, "{W}", "")
    argument0 = string_replace_all(argument0, "{/}", "")
    var _arrays = ds_map_keys_to_array(global.inputs)
    for (var _i = 0; _i < array_length(_arrays); _i++)
    {
        _width += (global.fontextra[_font][4] * (string_count(_arrays[_i], argument0)))
        argument0 = string_replace_all(argument0, _arrays[_i], "")
    }
    _width += string_width(argument0)
    return _width;
}

function get_game_width() //get_game_width
{
    return global.currentinternalres[0];
}

function get_game_height() //get_game_height
{
    return global.currentinternalres[1];
}

function get_level_tt_time(argument0, argument1) //get_level_tt_time
{
    switch argument0
    {
        case "entry":
            if (argument1 == (3 << 0))
                return 7020;
            if (argument1 == (2 << 0))
                return 7800;
            if (argument1 == (1 << 0))
                return 10200;
            break
        case "medieval":
            if (argument1 == (3 << 0))
                return 8640;
            if (argument1 == (2 << 0))
                return 9600;
            if (argument1 == (1 << 0))
                return 12000;
            break
        case "ruin":
            if (argument1 == (3 << 0))
                return 10080;
            if (argument1 == (2 << 0))
                return 12000;
            if (argument1 == (1 << 0))
                return 14400;
            break
        case "dungeon":
            if (argument1 == (3 << 0))
                return 10800;
            if (argument1 == (2 << 0))
                return 13200;
            if (argument1 == (1 << 0))
                return 14400;
            break
        case "dragonslair":
            if (argument1 == (3 << 0))
                return 12060;
            if (argument1 == (2 << 0))
                return 13800;
            if (argument1 == (1 << 0))
                return 16200;
            break
    }

}

