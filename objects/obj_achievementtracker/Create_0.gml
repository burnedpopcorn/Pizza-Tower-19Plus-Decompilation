popupstruct = 
{
    type: -1
}

popupy = 0
popuptime = 200
achievements = []
notifications = ds_list_create()
popupqueue = ds_list_create()
variables = ds_map_create()
add_achievement("entry1", function() //anon@750@gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //anon@767@gml_Object_obj_achievementtracker_Create_0
{
    var _type = argument0[0]
    var _info = argument0[1]
    if (_type == (4 << 0) && _info[0] >= 480 && global.levelname == "entry")
        achievement_get(saveid, spr_cowboytask_entry1, 1)
}
)
add_achievement("entry2", function() //anon@1022@gml_Object_obj_achievementtracker_Create_0
{
    add_achievement_variable("entry2tracker", -1, (2 << 0))
}
, function(argument0) //anon@1106@gml_Object_obj_achievementtracker_Create_0
{
    var _type = argument0[0]
    var _info = argument0[1]
    if (_type == (0 << 0) && global.levelname == "entry")
    {
        if (ds_list_find_index(get_achvariable("entry2tracker").value, _info[0]) == -1)
            set_achvariable("entry2tracker", _info[0])
        if (ds_list_size(get_achvariable("entry2tracker").value) >= 12)
            achievement_get(saveid, spr_cowboytask_entry2, 1)
    }
}
, function() //anon@1514@gml_Object_obj_achievementtracker_Create_0
{
    ds_list_destroy(get_achvariable("entry2tracker").value)
}
)
add_achievement("entry3", function() //anon@1626@gml_Object_obj_achievementtracker_Create_0
{
    add_achievement_variable("entry3tracker", -1, (2 << 0))
}
, function(argument0) //anon@1710@gml_Object_obj_achievementtracker_Create_0
{
    var _type = argument0[0]
    var _info = argument0[1]
    if (_type == (11 << 0) && global.levelname == "entry")
    {
        if (ds_list_find_index(get_achvariable("entry3tracker").value, _info[1]) == -1)
            set_achvariable("entry3tracker", _info[1])
        if (ds_list_size(get_achvariable("entry3tracker").value) >= 10)
            achievement_get(saveid, spr_cowboytask_entry3, 1)
    }
}
, function() //anon@2122@gml_Object_obj_achievementtracker_Create_0
{
    ds_list_destroy(get_achvariable("entry3tracker").value)
}
)
add_achievement("medieval1", function() //anon@2280@gml_Object_obj_achievementtracker_Create_0
{
    add_achievement_variable("medieval1tracker", false, (0 << 0))
}
, function(argument0) //anon@2370@gml_Object_obj_achievementtracker_Create_0
{
    var _type = argument0[0]
    if (global.levelname == "medieval")
    {
        if (_type == (6 << 0))
            set_achvariable("medieval1tracker", true)
        if (_type == (18 << 0) && (!get_achvariable("medieval1tracker").value))
            achievement_get(saveid, spr_cowboytask_medieval1, 1)
    }
}
)
add_achievement("medieval2", function() //anon@2736@gml_Object_obj_achievementtracker_Create_0
{
    add_achievement_variable("medieval2tracker", 0, (0 << 0))
}
, function(argument0) //anon@2822@gml_Object_obj_achievementtracker_Create_0
{
    var _type = argument0[0]
    if (_type == (9 << 0) && global.levelname == "medieval" && (!obj_music.secret))
    {
        set_achvariable("medieval2tracker", (get_achvariable("medieval2tracker").value + 1))
        if (get_achvariable("medieval2tracker").value >= 11)
            achievement_get(saveid, spr_cowboytask_medieval2, 1)
    }
}
)
add_achievement("medieval3", function() //anon@3209@gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //anon@3226@gml_Object_obj_achievementtracker_Create_0
{
    var _type = argument0[0]
    var _info = argument0[1]
    if (_type == (16 << 0) && global.levelname == "medieval" && _info[0] >= 5)
        achievement_get(saveid, spr_cowboytask_medieval3, 1)
}
)
add_achievement("ruin1", function() //anon@3533@gml_Object_obj_achievementtracker_Create_0
{
    add_achievement_variable("ruin1tracker", -1, (2 << 0))
}
, function(argument0) //anon@3616@gml_Object_obj_achievementtracker_Create_0
{
    var _type = argument0[0]
    var _info = argument0[1]
    if (_type == (1 << 0) && global.levelname == "ruin" && (!obj_music.secret))
    {
        if (ds_list_find_index(get_achvariable("ruin1tracker").value, _info[0]) == -1)
            set_achvariable("ruin1tracker", _info[0])
        if (ds_list_size(get_achvariable("ruin1tracker").value) >= global.cheeseblocknumb)
            achievement_get(saveid, spr_cowboytask_ruin1, 1)
    }
}
, function() //anon@4064@gml_Object_obj_achievementtracker_Create_0
{
    ds_list_destroy(get_achvariable("ruin1tracker").value)
}
)
add_achievement("ruin2", function() //anon@4174@gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //anon@4191@gml_Object_obj_achievementtracker_Create_0
{
    var _type = argument0[0]
    var _info = argument0[1]
    if (_type == (10 << 0) && global.levelname == "ruin" && _info[0])
        achievement_get(saveid, spr_cowboytask_ruin2, 1)
}
)
add_achievement("ruin3", function() //anon@4437@gml_Object_obj_achievementtracker_Create_0
{
    add_achievement_variable("ruin3tracker", 0, (0 << 0))
}
, function(argument0) //anon@4519@gml_Object_obj_achievementtracker_Create_0
{
    var _type = argument0[0]
    if (_type == (8 << 0) && global.levelname == "ruin")
    {
        set_achvariable("ruin3tracker", (get_achvariable("ruin3tracker").value + 1))
        if (get_achvariable("ruin3tracker").value >= 43)
            achievement_get(saveid, spr_cowboytask_ruin3, 1)
    }
}
)
add_achievement("dungeon1", function() //anon@4906@gml_Object_obj_achievementtracker_Create_0
{
    add_achievement_variable("dungeon1tracker", false, (0 << 0))
}
, function(argument0) //anon@4995@gml_Object_obj_achievementtracker_Create_0
{
    var _type = argument0[0]
    if (global.levelname == "dungeon")
    {
        if (_type == (3 << 0))
            set_achvariable("dungeon1tracker", true)
        if (_type == (18 << 0) && (!get_achvariable("dungeon1tracker").value))
            achievement_get(saveid, spr_cowboytask_dungeon1, 1)
    }
}
)
add_achievement("dungeon2", function() //anon@5356@gml_Object_obj_achievementtracker_Create_0
{
    add_achievement_variable("dungeon2tracker", 0, (0 << 0))
}
, function(argument0) //anon@5441@gml_Object_obj_achievementtracker_Create_0
{
    var _type = argument0[0]
    if (global.levelname == "dungeon")
    {
        if (_type == (14 << 0))
        {
            set_achvariable("dungeon2tracker", (get_achvariable("dungeon2tracker").value + 1))
            if (get_achvariable("dungeon2tracker").value >= 3)
                achievement_get(saveid, spr_cowboytask_dungeon2, 1)
        }
    }
}
)
add_achievement("dungeon3", function() //anon@5827@gml_Object_obj_achievementtracker_Create_0
{
    add_achievement_variable("dungeon3tracker", 0, (0 << 0))
}
, function(argument0) //anon@5912@gml_Object_obj_achievementtracker_Create_0
{
    var _type = argument0[0]
    var _info = argument0[1]
    if (global.levelname == "dungeon")
    {
        if (_type == (15 << 0) && _info[0] == obj_ancho && _info[1] == obj_fencer)
        {
            set_achvariable("dungeon3tracker", (get_achvariable("dungeon3tracker").value + 1))
            if (get_achvariable("dungeon3tracker").value >= 3)
                achievement_get(saveid, spr_cowboytask_dungeon3, 1)
        }
    }
}
)
add_achievement("dragonslair1", function() //anon@6428@gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //anon@6445@gml_Object_obj_achievementtracker_Create_0
{
    var _type = argument0[0]
    if (global.levelname == "dragonslair")
    {
        if (_type == (13 << 0))
            achievement_get(saveid, spr_cowboytask_dragonslair1, 1)
    }
}
)
add_achievement("dragonslair2", function() //anon@6690@gml_Object_obj_achievementtracker_Create_0
{
    add_achievement_variable("dragonslair2tracker", 0, (0 << 0))
}
, function(argument0) //anon@6779@gml_Object_obj_achievementtracker_Create_0
{
    var _type = argument0[0]
    if (global.levelname == "dragonslair")
    {
        if (_type == (17 << 0))
            set_achvariable("dragonslair2tracker", true)
        if (_type == (18 << 0) && (!get_achvariable("dragonslair2tracker").value))
            achievement_get(saveid, spr_cowboytask_dragonslair2, 1)
    }
}
)
add_achievement("dragonslair3", function() //anon@7157@gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //anon@7174@gml_Object_obj_achievementtracker_Create_0
{
    var _type = argument0[0]
    var _info = argument0[1]
    if (global.levelname == "dragonslair")
    {
        if (_type == (18 << 0) && _info[0] >= 120)
            achievement_get(saveid, spr_cowboytask_dragonslair3, 1)
    }
}
)
add_unlock("timetrialunlocked", function() //anon@7467@gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //anon@7484@gml_Object_obj_achievementtracker_Create_0
{
    var _type = argument0[0]
    if (_type == (19 << 0))
    {
        var _shouldunlock = true
        save_open()
        var i = 0
        while (i < 4)
        {
            if (ini_read_real("Ranks", global.levels[i], (-1 << 0)) == (-1 << 0))
            {
                _shouldunlock = false
                break
            }
            else
                i++
        }
        save_close()
        if _shouldunlock
            unlockable_unlock(saveid, spr_notif_timetrialunlock, 0)
    }
}
)
for (var i = 0; i < array_length(achievements); i++)
{
    with (achievements[i])
        self.setupfunc()
}
achievementlist = []
for (var l = 0; l < array_length(achievements); l++)
{
    if (achievements[l].type == (0 << 0))
        array_push(achievementlist, achievements[l].saveid)
}
achievements_load()
