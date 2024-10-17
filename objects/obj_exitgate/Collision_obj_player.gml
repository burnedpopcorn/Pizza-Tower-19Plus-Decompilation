/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for fmod_studio_event_instance_set_parameter_by_name

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 261
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 864
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|5_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 624
*/
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for __input_finalize_default_profiles

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 261
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 864
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|5_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 624
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for __input_finalize_default_profiles

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 261
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 864
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 143
*/
with (obj_player)
{
    if (other.image_index == 1 && (!other.cutscene) && state != (31 << 0) && (!global.panic))
    {
        ds_list_add(global.saveroom, other.id)
        other.image_index = 0
        y = camera_get_view_y(view_camera[1]) - 100
        image_blend = c_white
        doorblend = 1
        sprite_index = spr_slipbananimpact
        state = (126 << 0)
        other.cutscene = 1
    }
    if (input_check("up") && grounded && x > (other.x - 160) && x < (other.x + 160) && (state == (0 << 0) || state == (47 << 0) || (state == (66 << 0) && (!rocket)) || state == (42 << 0)) && global.panic)
    {
        targetDoor = "none"
        obj_drawcontroller.alarm[1] = -1
        obj_drawcontroller.alarm[6] = -1
        obj_drawcontroller.givetime = 0
        push_notif((18 << 0), [global.escapetime])
        stop_music()
        if (global.levelname == "tutorial")
        {
            instance_create_depth(x, y, 0, obj_endtutorialfade)
            save_open()
            ini_write_real("GameProgress", "tutorialdone", true)
            if ((!(ini_read_real("GameProgress", "lap2unlocked", false))) && global.timer <= 4800)
            {
                ini_write_real("GameProgress", "lap2unlocked", true)
                scr_tiptext(string_get("tips/other/unlockedlap2"))
            }
            save_close()
        }
        else
        {
            var _prevattempt = global.prankattempt
            var _prevcombo = global.combo
            end_combo_abrupt()
            if (global.levelname != "dragonslair")
                global.prank = ((!_prevattempt) && global.collect >= global.srank && _prevcombo && there_is_follower_obj(obj_pizzakinshroom) && there_is_follower_obj(obj_pizzakincheese) && there_is_follower_obj(obj_pizzakintomato) && there_is_follower_obj(obj_pizzakinsausage) && there_is_follower_obj(obj_pizzakinpineapple) && global.treasure && global.lapping && (global.secretfound >= 3 || inwar))
            else
                global.prank = ((!_prevattempt) && global.collect >= global.srank && _prevcombo && global.secretfound >= 3)
            fmod_studio_event_instance_start(global.ranksnd)
            if (!global.timetrial)
            {
                if (global.collect >= global.srank && global.prank)
                    global.rank = (5 << 0)
                else if (global.collect >= global.srank)
                    global.rank = (4 << 0)
                else if (global.collect > global.arank)
                    global.rank = (3 << 0)
                else if (global.collect > global.brank)
                    global.rank = (2 << 0)
                else if (global.collect > global.crank)
                    global.rank = (1 << 0)
                else
                    global.rank = (0 << 0)
                fmod_studio_event_instance_set_parameter_by_name(global.ranksnd, "rank", global.rank, true)
            }
            else
            {
                if (global.timetrialtick <= global.purplerank)
                    global.timetrialrank = (3 << 0)
                else if (global.timetrialtick <= global.goldrank)
                    global.timetrialrank = (2 << 0)
                else if (global.timetrialtick <= global.silverrank)
                    global.timetrialrank = (1 << 0)
                else
                    global.timetrialrank = (0 << 0)
                fmod_studio_event_instance_set_parameter_by_name(global.ranksnd, "rank", (global.timetrialrank + 2), true)
            }
            scr_saveleveldata(global.levelname)
            instance_create_depth(x, y, 0, obj_endlevelfade)
        }
        image_index = 0
        global.panic = 0
        global.stoptimer = 0
        with (obj_player)
        {
            if (state != (54 << 0))
            {
                state = (54 << 0)
                sprite_index = spr_lookdoor
            }
            if (shield > 0)
                scr_fmod_soundeffectONESHOT("event:/sfx/player/killingblow", x, y)
            while (shield > 0)
            {
                shield--
                with (instance_create_depth((x + (shield - 1) * 20 * xscale), y, 0, obj_baddiedead))
                    sprite_index = spr_pizzashield_collectible
            }
        }
    }
}
