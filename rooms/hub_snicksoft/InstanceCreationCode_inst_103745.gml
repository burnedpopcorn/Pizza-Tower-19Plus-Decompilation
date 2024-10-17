saveid = "dragonslair1"
hidecond = function() //anon@37@gml_RoomCC_hub_snicksoft_13_Create
{
    save_open()
    var _unlocked = ini_read_real("GameProgress", "dragonslairunlocked", false)
    save_close()
    return _unlocked;
}

