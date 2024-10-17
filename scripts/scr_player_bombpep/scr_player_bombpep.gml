/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for __input_finalize_default_profiles

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 265
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 869
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|5_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 629
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for __input_finalize_default_profiles

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 265
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 869
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 157
*/
function scr_player_bombpep() //scr_player_bombpep
{
    collide_destructibles = function(argument0, argument1) //anon@57@scr_player_bombpep_scr_player_bombpep
    {
        if (state != (19 << 0))
            return;
        if scr_destroy_horizontal(argument0, (240 << 0))
        {
            instance_create_depth(x, y, 0, obj_bombexplosion2)
            movespeed = 4
            vsp = -10
            grounded = false
            state = (124 << 0)
            bombpeptimer = 0
        }
    }

    hit_horizontal = function(argument0) //anon@405@scr_player_bombpep_scr_player_bombpep
    {
        if (sign(argument0) == xscale && state == (19 << 0))
        {
            instance_create_depth((x + 10), (y + 10), 0, obj_bumpeffect)
            xscale *= -1
        }
    }

    if input_check_pressed("jump")
        input_buffer_jump = 0
    if ((!input_check("jump")) && (!jumpstop) && vsp < 0.5 && (!stompAnim))
    {
        vsp /= 2
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    mach2 = 0
    landAnim = 0
    if (sprite_index == spr_bombpepintro && floor(image_index) == (image_number - 1))
    {
        scr_tiptext(string_get("tips/transfo/bombpep"), "bombtip")
        sprite_index = spr_bombpeprun
    }
    if (sprite_index == spr_bombpeprun || sprite_index == spr_bombpeprunabouttoexplode)
    {
        if (movespeed <= 8)
            movespeed += 0.2
        move = input_check_opposing("left", "right")
        if grounded
        {
            if (move != 0 && (!instance_exists(obj_bumpeffect)))
                xscale = move
        }
        hsp = floor(xscale * movespeed)
    }
    else
    {
        hsp = 0
        movespeed = 0
    }
    if (bombpeptimer < 20 && bombpeptimer != 0)
        sprite_index = spr_bombpeprunabouttoexplode
    if (sprite_index == spr_bombpepend && floor(image_index) == (image_number - 1))
    {
        alarm[5] = 2
        alarm[7] = 60
        hurted = 1
        state = (0 << 0)
        sprite_index = spr_idle
        image_index = 0
    }
    if (bombpeptimer == 0 && sprite_index == spr_bombpeprunabouttoexplode)
    {
        scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/bombpepexplode", x, y)
        instance_create_depth(x, y, 0, obj_bombexplosion)
        sprite_index = spr_bombpepend
    }
    if (bombpeptimer > 0)
        bombpeptimer -= 0.5
    if (input_buffer_jump < 8 && grounded && hsp != 0)
        vsp = -10.2
    if (movespeed < 4)
        image_speed = 0.35
    else if (movespeed > 4 && movespeed < 8)
        image_speed = 0.45
    else
        image_speed = 0.6
    if (hsp != 0 && (floor(image_index) == 0 || floor(image_index) == 2) && steppy == 0 && grounded)
        steppy = 1
    if (floor(image_index) != 0 && floor(image_index) != 2)
        steppy = 0
    if (input_buffer_attack < 8 && sprite_index != spr_bombpepend && state == (19 << 0))
    {
        input_buffer_attack = 8
        scr_fmod_soundeffectONESHOT("event:/sfx/player/mach/rollgetup", x, y)
        scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/bombpepexplode", x, y)
        move = input_check_opposing("left", "right")
        if (sprite_index == spr_bombpepintro && move != 0)
            xscale = move
        if input_check("up")
        {
            image_index = 6
            sprite_index = spr_uppercutfinishingblow
        }
        else
        {
            image_index = 0
            sprite_index = spr_throw
        }
        state = (21 << 0)
        with (instance_create_depth((x - 3), y, 0, obj_bomb))
        {
            drop = 1
            if (!input_check("up"))
            {
                hsp = other.xscale * 10
                vsp = -10
            }
            else
                vsp = -22
            countdown = 100
            spawner = other.bombspawnerid
        }
    }
    if ((!instance_exists(obj_dashcloud)) && grounded && hsp != 0)
    {
        with (instance_create_depth(x, y, 0, obj_dashcloud))
            image_xscale = other.xscale
    }
}

