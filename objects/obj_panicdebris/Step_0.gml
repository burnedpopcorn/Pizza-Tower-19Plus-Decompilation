if (global.panic == 1 && start == 0 && (!obj_music.secret) && global.levelname != "dragonslair")
{
    alarm[0] = 5
    start = 1
}
if (global.panic == 0 || obj_music.secret || global.levelname == "dragonslair")
{
    alarm[0] = -1
    start = 0
}
