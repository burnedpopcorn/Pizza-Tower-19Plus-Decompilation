/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for fmod_studio_event_instance_set_parameter_by_name

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 265
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 869
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|5_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 629
*/
function scr_hurtplayer(argument0, argument1) //scr_hurtplayer
{
    if (argument0 == undefined)
        argument0 = other.id
    if (argument1 == undefined)
        argument1 = true
    with (argument0)
    {
        var _hurttype = 0
        if argument1
        {
            switch other.object_index
            {
                case obj_baddiecollisionbox:
                    _hurttype = obj_baddiecollisionbox.baddieID.hurttype
                    break
                default:
                    _hurttype = other.hurttype
                    break
            }

        }
        if ((state == (18 << 0) || state == (13 << 0) || state == (115 << 0)) && (!cutscene))
            return false;
        if (state == (19 << 0) && (!hurted))
            return false;
        if (state == (8 << 0))
            return false;
        if (state == (96 << 0))
            return false;
        if (state == (108 << 0))
            return false;
        if (state == (1 << 0))
            return false;
        if (state == (88 << 0))
            return false;
        if instance_exists(obj_parryhitbox)
            return false;
        if ((state == (106 << 0) || state == (107 << 0)) && (!hurted) && (!cutscene))
        {
            mariodeathid = event_play_oneshot("event:/sfx/player/retrodeath")
            state = (108 << 0)
            push_notif((2 << 0), [_hurttype])
            return true;
        }
        if (state == (11 << 0))
        {
            scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/detransfo", x, y)
            repeat (5)
            {
                with (instance_create_depth(x, y, -1, obj_boxxeddebris))
                    image_index = 0
            }
            if (x != other.x)
                obj_player.hsp = (sign(x - other.x)) * 5
            else
                obj_player.hsp = 5
            vsp = -3
            image_index = 0
            obj_player.image_index = 0
            obj_player.flash = 1
            state = (49 << 0)
            push_notif((2 << 0), [_hurttype])
            return true;
        }
        if (state == (9 << 0) || state == (10 << 0))
        {
            scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/detransfo", x, y)
            obj_player.grav = 0.5
            repeat (8)
                instance_create_depth(x, y, -1, obj_slimedebris)
            if (x != other.x)
                obj_player.hsp = (sign(x - other.x)) * 5
            else
                obj_player.hsp = 5
            vsp = -3
            image_index = 0
            obj_player.image_index = 0
            obj_player.flash = 1
            state = (49 << 0)
            push_notif((2 << 0), [_hurttype])
            return true;
        }
        if (shield == 0 && state != (50 << 0) && state != (4 << 0) && state != (11 << 0) && state != (49 << 0) && state != (70 << 0) && state != (78 << 0) && state != (5 << 0) && state != (88 << 0) && state != (8 << 0) && state != (96 << 0) && (!hurted) && (!cutscene))
        {
            var fmodhurtsound = scr_fmod_soundeffectONESHOT("event:/sfx/player/hurt", x, y)
            fmod_studio_event_instance_set_parameter_by_name(fmodhurtsound, "hurttype", _hurttype, true)
            voice_hurt()
            hurted = 1
            alarm[7] = 50
            alarm[8] = 600
            if global.smallpep
            {
                sprite_index = spr_smallhurt
                movespeed = -8
            }
            else if (character != "S")
            {
                if (xscale == other.image_xscale)
                {
                    sprite_index = spr_hurtjumpstart
                    movespeed = 8
                }
                else
                {
                    sprite_index = spr_hurt
                    movespeed = -8
                }
            }
            else
            {
                sprite_index = spr_hurt
                movespeed = -8
            }
            with (obj_drawcontroller)
            {
                hurthud = 1
                alarm[11] = 120
            }
            vsp = -12
            timeuntilhpback = 300
            instance_create_depth(x, y, 0, obj_spikehurteffect)
            state = (50 << 0)
            image_index = 0
            flash = 1
            if (global.currentbadge != (3 << 0))
            {
                global.combotime -= 25
                if (global.combotime < 0)
                    global.combotime = 0
            }
            else
                global.combotime = 0
            global.hurtcounter += 1
            add_collect(-50)
            if (global.collect > 0)
            {
                instance_create_depth(x, (y - 20), 0, obj_minus50)
                repeat (12)
                    instance_create_depth(x, y, 0, obj_pizzaloss)
            }
            push_notif((2 << 0), [_hurttype])
            return true;
        }
        if (shield > 0 && state != (35 << 0) && (!hurted))
        {
            state = (35 << 0)
            flash = 1
            hurted = 1
            alarm[7] = 50
            instance_create_depth(x, y, 0, obj_spikehurteffect)
            scr_fmod_soundeffectONESHOT("event:/sfx/player/killingblow", x, y)
            sprite_index = spr_player_punchblock
            image_index = 0
            movespeed = -10
            vsp = 0
            shieldhurt = 1
            shieldhealth -= 1
            shieldblocking = false
            if (shieldhealth > 0)
            {
                shieldblocking = true
                shieldind = 0
            }
            if (shield > 0 && shieldhealth <= 0)
            {
                shield -= 1
                shieldhealth = 3
                with (instance_create_depth((x + (shield - 1) * 20 * xscale), y, 0, obj_baddiedead))
                    sprite_index = spr_pizzashield_collectible
            }
            push_notif((2 << 0), [_hurttype])
            return true;
        }
    }
}

