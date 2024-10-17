var _id = ds_map_find_value(async_load, "id")
switch savestate
{
    case (1 << 0):
        if (_id == asyncsaveid)
        {
            buffer_delete(savebuff)
            buffer_delete(walletsavebuff)
            if buffer_exists(demosavebuff)
                buffer_delete(demosavebuff)
            savestate = (0 << 0)
            trace("Game Save Status: ", ds_map_find_value(async_load, "status"))
        }
        break
    case (2 << 0):
        if (_id == asyncloadid)
        {
            var _ini = buffer_read(loadbuff, buffer_string)
            ini_open_from_string(_ini)
            global.tutorialdone = ini_read_real("GameProgress", "tutorialdone", false)
            global.savetime = ini_read_real("GameProgress", "saveage", 0)
            savestr = ini_close()
            achievements_load()
            buffer_delete(loadbuff)
            var _walletuncomp = buffer_decompress(walletloadbuff)
            if (_walletuncomp != -1)
            {
                var _wallet = buffer_read(_walletuncomp, buffer_string)
                ini_open_from_string(_wallet)
                var _walletver = ini_read_string("Version", "version", 0)
                if (_walletver == 0)
                    wallet_readcoins()
                walletstr = ini_close()
                buffer_delete(_walletuncomp)
            }
            buffer_delete(walletloadbuff)
            if (!ds_map_empty(demoloadbuffs))
            {
                var _demos = ds_map_keys_to_array(demoloadbuffs)
                for (var i = 0; i < array_length(_demos); i++)
                {
                    var _uncompbuff = buffer_decompress(ds_map_find_value(demoloadbuffs, array_get(_demos, i)))
                    var _demoversion = buffer_read(_uncompbuff, buffer_u8)
                    if (_demoversion == 1)
                    {
                        var _buffsize = buffer_read(_uncompbuff, buffer_u64)
                        var _tick = buffer_read(_uncompbuff, buffer_u64)
                        ds_map_set(global.timetrialreplays, array_get(_demos, i), [_tick, buffer_create((_buffsize - 17), buffer_fixed, 1)])
                        buffer_copy(_uncompbuff, 17, (_buffsize - 17), array_get(ds_map_find_value(global.timetrialreplays, array_get(_demos, i)), 1), 0)
                        buffer_seek(_uncompbuff, buffer_seek_start, _buffsize)
                        while (buffer_tell(_uncompbuff) != buffer_get_size(_uncompbuff))
                        {
                            var _key = buffer_read(_uncompbuff, buffer_string)
                            var _value = buffer_read(_uncompbuff, buffer_f64)
                            ds_map_set(ds_map_find_value(global.timetrialsavedsplits, array_get(_demos, i)), _key, _value)
                        }
                    }
                    buffer_delete(ds_map_find_value(demoloadbuffs, array_get(_demos, i)))
                    buffer_delete(_uncompbuff)
                }
            }
            ds_map_destroy(demoloadbuffs)
            demoloadbuffs = -1
            savestate = (0 << 0)
            trace("Game Load Status: ", ds_map_find_value(async_load, "status"))
        }
        break
    case (3 << 0):
        if (_id == asyncconfigsaveid)
        {
            buffer_delete(configsavebuff)
            savestate = (0 << 0)
            trace("Config Save Status: ", ds_map_find_value(async_load, "status"))
        }
        break
}

