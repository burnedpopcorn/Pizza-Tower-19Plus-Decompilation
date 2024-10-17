if global.timetrial
    return;
draw_self()
save_open()
if ini_read_real("Treasures", level, false)
{
    var _ind = 0
    switch level
    {
        case "entry":
            _ind = 0
            break
        case "medieval":
            _ind = 1
            break
        case "ruin":
            _ind = 2
            break
        case "dungeon":
            _ind = 3
            break
        case "dragonslair":
            _ind = 4
            break
    }

    draw_sprite(spr_treasure, _ind, (x - 18), (y - 35 + (wave(-4, 4, 2, 0))))
}
save_close()
