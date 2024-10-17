saveid = "dragonslair3";

hidecond = function()
{
    var _unlocked;
    
    save_open();
    _unlocked = ini_read_real("GameProgress", "dragonslairunlocked", false);
    save_close();
    return _unlocked;
};
