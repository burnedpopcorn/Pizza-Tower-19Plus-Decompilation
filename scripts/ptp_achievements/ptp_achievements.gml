function add_achievement_variable(argument0, argument1, argument2, argument3) //add_achievement_variable
{
    if (argument2 == undefined)
        argument2 = (0 << 0)
    if (argument3 == undefined)
        argument3 = false
    with (obj_achievementtracker)
    {
        var _varstruct = 
        {
            value: -1,
            startingval: -1,
            type: argument2,
            save: argument3
        }

        if (argument2 != (2 << 0))
        {
            _varstruct.value = argument1
            _varstruct.startingval = _varstruct.value
        }
        else
            _varstruct.value = ds_list_create()
        ds_map_set(variables, argument0, _varstruct)
    }
}

function get_achvariable(argument0) //get_achvariable
{
    with (obj_achievementtracker)
        return ds_map_find_value(variables, argument0);
}

function set_achvariable(argument0, argument1) //set_achvariable
{
    with (obj_achievementtracker)
    {
        if (ds_map_find_value(variables, argument0).type != (2 << 0))
            ds_map_find_value(variables, argument0).value = argument1
        else
            ds_list_add(ds_map_find_value(variables, argument0).value, argument1)
        if ds_map_find_value(variables, argument0).save
        {
            save_open()
            switch ds_map_find_value(variables, argument0).type
            {
                case (0 << 0):
                    ini_write_real("GameProgress", argument0, ds_map_find_value(variables, argument0).value)
                    break
                case (1 << 0):
                    ini_write_string("GameProgress", argument0, ds_map_find_value(variables, argument0).value)
                    break
                case (2 << 0):
                    var _str = ds_list_write(ds_map_find_value(variables, argument0).value)
                    ini_write_string("GameProgress", argument0, _str)
                    break
            }

            save_close()
        }
    }
}

function add_achievement(argument0, argument1, argument2, argument3) //add_achievement
{
    if (argument3 == undefined)
        argument3 = function() //anon@1341@ptp_achievements
        {
        }

    with (obj_achievementtracker)
    {
        var _achstruct = 
        {
            type: (0 << 0),
            saveid: argument0,
            setupfunc: -1,
            updatefunc: -1,
            cleanfunc: -1,
            done: false
        }

        _achstruct.setupfunc = method(_achstruct, argument1)
        _achstruct.updatefunc = method(_achstruct, argument2)
        _achstruct.cleanfunc = method(_achstruct, argument3)
        array_push(achievements, _achstruct)
    }
}

function add_unlock(argument0, argument1, argument2, argument3) //add_unlock
{
    if (argument3 == undefined)
        argument3 = function() //anon@1846@ptp_achievements
        {
        }

    with (obj_achievementtracker)
    {
        var _achstruct = 
        {
            type: (2 << 0),
            saveid: argument0,
            setupfunc: -1,
            updatefunc: -1,
            cleanfunc: -1,
            done: false
        }

        _achstruct.setupfunc = method(_achstruct, argument1)
        _achstruct.updatefunc = method(_achstruct, argument2)
        _achstruct.cleanfunc = method(_achstruct, argument3)
        array_push(achievements, _achstruct)
    }
}

function push_notif(argument0, argument1) //push_notif
{
    with (obj_achievementtracker)
        ds_list_add(notifications, [argument0, argument1])
}

function achievement_get(argument0, argument1, argument2) //achievement_get
{
    with (obj_achievementtracker)
    {
        var _popupstruct = 
        {
            type: (0 << 0),
            sprite: argument1,
            index: argument2
        }

        save_open()
        ini_write_real("Achievements", argument0, true)
        save_close()
        save_dump()
        var _ach = achievement_get_ind(argument0)
        achievements[_ach].done = true
        ds_list_add(popupqueue, _popupstruct)
    }
}

function unlockable_unlock(argument0, argument1, argument2) //unlockable_unlock
{
    with (obj_achievementtracker)
    {
        var _popupstruct = 
        {
            type: (2 << 0),
            sprite: argument1,
            index: argument2
        }

        save_open()
        ini_write_real("GameProgress", argument0, true)
        save_close()
        save_dump()
        var _ach = achievement_get_ind(argument0)
        achievements[_ach].done = true
        ds_list_add(popupqueue, _popupstruct)
    }
}

function achievement_get_ind(argument0) //achievement_get_ind
{
    with (obj_achievementtracker)
    {
        for (var i = 0; i < array_length(achievements); i++)
        {
            if (achievements[i].saveid == argument0)
                return i;
        }
    }
}

function achievements_load() //achievements_load
{
    with (obj_achievementtracker)
    {
        save_open()
        var _vars = ds_map_keys_to_array(variables)
        for (var v = 0; v < array_length(_vars); v++)
        {
            if (!(ds_map_find_value(variables, array_get(_vars, v)).save))
            {
            }
            else
            {
                switch ds_map_find_value(variables, array_get(_vars, v)).type
                {
                    case (0 << 0):
                        ds_map_find_value(variables, array_get(_vars, v)).value = ini_read_real("GameProgress", _vars[v], ds_map_find_value(variables, array_get(_vars, v)).startingval)
                        break
                    case (1 << 0):
                        ds_map_find_value(variables, array_get(_vars, v)).value = ini_read_string("GameProgress", _vars[v], ds_map_find_value(variables, array_get(_vars, v)).startingval)
                        break
                    case (2 << 0):
                        var _str = ini_read_string("GameProgress", _vars[v], "")
                        if (_str != "")
                            ds_list_read(ds_map_find_value(variables, array_get(_vars, v)).value, _str)
                        break
                }

            }
        }
        for (var a = 0; a < array_length(achievements); a++)
        {
            var _section = "GameProgress"
            if (achievements[a].type == (0 << 0))
                _section = "Achievements"
            achievements[a].done = ini_read_real(_section, achievements[a].saveid, false)
        }
        save_close()
    }
}

function achievements_reset() //achievements_reset
{
    with (obj_achievementtracker)
    {
        var _vars = ds_map_keys_to_array(variables)
        for (var v = 0; v < array_length(_vars); v++)
        {
            if ds_map_find_value(variables, array_get(_vars, v)).save
            {
            }
            else if (ds_map_find_value(variables, array_get(_vars, v)).type != (2 << 0))
                ds_map_find_value(variables, array_get(_vars, v)).value = ds_map_find_value(variables, array_get(_vars, v)).startingval
            else
                ds_list_clear(ds_map_find_value(variables, array_get(_vars, v)).value)
        }
    }
}

