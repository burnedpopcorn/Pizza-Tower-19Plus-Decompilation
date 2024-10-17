savestate = (0 << 0)
savestr = ""
walletstr = ""
configstruct = {}
savebuff = -1
demosavebuff = -1
walletsavebuff = -1
configsavebuff = -1
loadbuff = -1
demoloadbuffs = -1
walletloadbuff = -1
asyncsaveid = -1
asyncconfigsaveid = -1
asyncloadid = -1
if file_exists("optionsData.json")
{
    var _str = ""
    var _file = file_text_open_read("optionsData.json")
    while (!file_text_eof(_file))
    {
        var _line = file_text_readln(_file)
        if ((!(string_starts_with(_line, "//"))) && _line != "" && _line != "\n")
            _str += _line
    }
    file_text_close(_file)
    configstruct = json_parse(_str)
}
global.screensizes[0] = [[640, 480], [800, 600], [1024, 768], [1280, 960], [1600, 1200]]
global.screensizes[1] = [[480, 270], [960, 540], [1280, 720], [1600, 900], [1920, 1080]]
global.screensizes[2] = [[480, 300], [960, 600], [1366, 854], [1600, 1000], [1920, 1200]]
global.borders = [-1, bg_entry4, bg_medievallibrairy1, bg_ruinmerged, bg_dungeontomato, bg_90s, bg_genesis, bg_steam]
var _highestaspectratio = array_length(global.screensizes) - 1
global.maxscreenwidth = global.screensizes[_highestaspectratio][1][0]
global.maxscreenheight = global.screensizes[_highestaspectratio][1][1]
global.resmode = config_get_option("Video", "resmode", (1 << 0))
global.resnumb = config_get_option("Video", "resnumb", 1)
global.scalemode = config_get_option("Video", "scalemode", (0 << 0))
global.fullscreen = config_get_option("Video", "fullscreen", false)
global.antialiasing = config_get_option("Video", "antialiasing", false)
global.vsync = config_get_option("Video", "vsync", false)
global.border = config_get_option("Video", "border", 0)
global.currentres = global.screensizes[global.resmode][global.resnumb]
global.currentinternalres = global.screensizes[global.resmode][1]
global.mastervolume = config_get_option("Audio", "mastervolume", 1)
global.musicvolume = config_get_option("Audio", "musicvolume", 1)
global.sfxvolume = config_get_option("Audio", "sfxvolume", 1)
global.unfocusedmute = config_get_option("Audio", "unfocusedmute", false)
var _bindings = config_get_option("Input", "bindings", -1)
if (_bindings != -1)
    input_system_import(_bindings)
global.horizdeadzone = mean(input_axis_threshold_get(32785).__mini, input_axis_threshold_get(32787).__mini)
global.vertdeadzone = mean(input_axis_threshold_get(32786).__mini, input_axis_threshold_get(32788).__mini)
global.rumble = config_get_option("Accessibility", "rumble", true)
global.escapetilt = config_get_option("Accessibility", "escapetilt", 5)
global.scorecolours = config_get_option("Accessibility", "scorecolours", true)
global.screenshake = config_get_option("Accessibility", "screenshake", true)
global.timertype = config_get_option("Accessibility", "timertype", 0)
global.ghostalpha = config_get_option("Accessibility", "ghostalpha", 0.75)
global.ghostoutlinealpha = config_get_option("Accessibility", "ghostoutlinealpha", 1)
global.tvscrollspd = config_get_option("Accessibility", "tvscrollspd", 3)
global.hatbounce = config_get_option("Accessibility", "hatbounce", true)
global.screeneffect = config_get_option("Accessibility", "screeneffect", true)
global.tvtextalpha = config_get_option("Accessibility", "tvtextalpha", 1)
apply_videoglobals()
apply_inputglobals()
global.levelname = -4
global.tutorialdone = false
global.savetime = 0
global.timetrialreplays = ds_map_create()
global.timetrialsavedsplits = ds_map_create()
global.pizzacointracker = ds_map_create()
global.levels = ["entry", "medieval", "ruin", "dungeon", "dragonslair"]
for (var i = 0; i < array_length(global.levels); i++)
{
    ds_map_set(global.timetrialreplays, global.levels[i], -1)
    ds_map_set(global.timetrialsavedsplits, global.levels[i], ds_map_create())
    ds_map_set(global.pizzacointracker, global.levels[i], ds_list_create())
}
saveiconspr = spr_saveindicator
saveiconind = 0
saveiconalpha = 0
depth = -15000
