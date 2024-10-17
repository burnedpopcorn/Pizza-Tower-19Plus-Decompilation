saveid = "dragonslair3"
hidecond = function() //anon@37@gml_RoomCC_hub_snicksoft_15_Create
{
    save_open()
    var _unlocked = ini_read_real("GameProgress", "dragonslairunlocked", false)
    save_close()
    return _unlocked;
}

