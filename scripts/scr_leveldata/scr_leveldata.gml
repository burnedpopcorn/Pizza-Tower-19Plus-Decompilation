function scr_saveleveldata(argument0) //scr_saveleveldata
{
    wallet_open()
    wallet_writecoins(argument0)
    wallet_close()
    save_open()
    if (global.secretfound > ini_read_real("Secrets", argument0, 0))
        ini_write_real("Secrets", argument0, global.secretfound)
    if (!(ini_read_real("Treasures", argument0, false)))
        ini_write_string("Treasures", argument0, global.treasure)
    for (var i = 1; i <= 5; i++)
    {
        switch i
        {
            case 1:
                var top = obj_pizzakinshroom
                break
            case 2:
                top = obj_pizzakincheese
                break
            case 3:
                top = obj_pizzakintomato
                break
            case 4:
                top = obj_pizzakinsausage
                break
            case 5:
                top = obj_pizzakinpineapple
                break
        }

        if (!(ini_read_real("Toppins", (argument0 + string(i)), false)))
            ini_write_real("Toppins", (argument0 + string(i)), there_is_follower_obj(top))
    }
    if (!global.timetrial)
    {
        var prevrank = ini_read_real("Ranks", argument0, (-1 << 0))
        if (global.rank > prevrank)
            ini_write_real("Ranks", argument0, global.rank)
        if (ini_read_real("Highscores", argument0, 0) < global.collect)
            ini_write_string("Highscores", argument0, global.collect)
    }
    else
    {
        var _prevrank = ini_read_real("TrialRanks", argument0, (-1 << 0))
        if (global.timetrialrank > _prevrank)
            ini_write_real("TrialRanks", argument0, global.timetrialrank)
    }
    save_close()
}

