event_inherited()
levelcount = 0
save_open()
for (var i = 0; i < 5; i++)
{
    if (ini_read_real("Ranks", global.levels[i], (-1 << 0)) != (-1 << 0))
        levelcount++
}
if (ini_read_real("NPCProgression", "snicklevel", -1) != levelcount)
{
    exclemationframe = 0
    if (levelcount > 0)
        scr_tiptext(string_get("tips/other/generictalk", "characternames/snick"))
}
save_close()
scenarioupdatefunc = function() //anon@407@gml_Object_obj_snicknpc_Create_0
{
    save_open()
    if (frac(ini_read_real("NPCProgression", "snicklevel", -1)) == 0.5)
        scenario = dialogue_get("snick/pizzaface")
    else
        scenario = dialogue_get(string("snick/{0}beat", levelcount))
    save_close()
}

endfunc = function() //anon@638@gml_Object_obj_snicknpc_Create_0
{
    save_open()
    exclemationframe = -1
    ini_write_real("NPCProgression", "snicklevel", levelcount)
    save_close()
}

scenarioupdatefunc();
