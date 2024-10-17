event_inherited()
save_open()
if (!(ini_read_real("NPCProgression", "talkedtoincog", false)))
    exclemationframe = 0
save_close()
scenarioupdatefunc = function() //anon@152@gml_Object_obj_mrincognitonpc_Create_0
{
    save_open()
    exclemationframe = -1
    if (!all_badges_bought())
    {
        switch ini_read_real("NPCProgression", "talkedtoincog", 0)
        {
            case 0:
                scenario = dialogue_get(string("incog/firsttime{0}", (get_coins() > 0 ? "COIN" : "NOCOIN")))
                break
            case 1:
                scenario = dialogue_get(string("incog/secondtime{0}", (get_coins() > 0 ? "COIN" : "NOCOIN")))
                break
            case 2:
                scenario = dialogue_get(string("incog/secondtimeSHOP{0}", (get_coins() > 0 ? "COIN" : "NOCOIN")))
                break
        }

    }
    else
        scenario = dialogue_get("incog/allbought")
    save_close()
}

endfunc = function() //anon@725@gml_Object_obj_mrincognitonpc_Create_0
{
    save_open()
    if (!all_badges_bought())
    {
        ini_write_real("NPCProgression", "talkedtoincog", (1 + (get_coins() > 0)))
        if (get_coins() > 0)
        {
            obj_player.state = (110 << 0)
            instance_create_depth(x, y, -999, obj_badgeshop)
        }
    }
    save_close()
}

self.scenarioupdatefunc()
