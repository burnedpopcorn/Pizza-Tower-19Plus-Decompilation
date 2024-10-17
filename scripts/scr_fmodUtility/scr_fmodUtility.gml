/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for fmod_studio_system_set_listener_attributes

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 265
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 869
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|5_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 629
*/
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for fmod_studio_event_description_get_instance_list

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 265
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 869
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|5_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 629
*/
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for fmod_studio_event_instance_set_3d_attributes

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 265
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 869
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|5_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 629
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for fmod_studio_event_description_get_instance_list

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 265
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 869
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 157
*/
function scr_fmod_soundeffect(argument0, argument1, argument2) //scr_fmod_soundeffect
{
    fmod_studio_event_instance_start(argument0)
    event_set_3d_position(argument0, argument1, argument2, 0)
}

function scr_fmod_soundeffectONESHOT(argument0, argument1, argument2) //scr_fmod_soundeffectONESHOT
{
    var event_id = event_instance(argument0)
    fmod_studio_event_instance_start(event_id)
    event_set_3d_position(event_id, argument1, argument2, 0)
    fmod_studio_event_instance_release(event_id)
    return event_id;
}

function event_play_oneshot(argument0) //event_play_oneshot
{
    var event_id = event_instance(argument0)
    fmod_studio_event_instance_start(event_id)
    fmod_studio_event_instance_release(event_id)
    return event_id;
}

function event_isplaying(argument0) //event_isplaying
{
    var _playback = fmod_studio_event_instance_get_playback_state(argument0)
    return (_playback != (2 << 0) && _playback != (4 << 0));
}

function event_instance(argument0) //event_instance
{
    return fmod_studio_event_description_create_instance(fmod_studio_system_get_event(argument0));
}

function event_pause_all(argument0) //event_pause_all
{
    fmod_studio_bus_set_paused(fmod_studio_system_get_bus("bus:/Music/Pausable"), argument0)
    fmod_studio_bus_set_paused(fmod_studio_system_get_bus("bus:/SFX/Pausable"), argument0)
}

function event_set_3d_position(argument0, argument1, argument2, argument3) //event_set_3d_position
{
    if (argument3 == undefined)
        argument3 = 0
    if (!event_isplaying(argument0))
    {
    }
    var _attr = new Fmod3DAttributes()
    _attr.position.x = argument1
    _attr.position.y = argument2
    _attr.position.z = argument3
    _attr.forward.z = 1
    _attr.up.y = 1
    fmod_studio_event_instance_set_3d_attributes(argument0, _attr)
}

function event_set_3d_position_struct(argument0, argument1) //event_set_3d_position_struct
{
    if (!event_isplaying(argument0))
        return;
    fmod_studio_event_instance_set_3d_attributes(argument0, argument1)
}

function event_stop(argument0, argument1) //event_stop
{
    fmod_studio_event_instance_stop(argument0, (argument1 ? (1 << 0) : (0 << 0)))
}

function event_stop_description(argument0, argument1) //event_stop_description
{
    var _insts = fmod_studio_event_description_get_instance_list(fmod_studio_system_get_event(argument0))
    for (var _i = 0; _i < array_length(_insts); _i++)
        event_stop(_insts[_i], argument1)
}

function listener_setPosition(argument0, argument1, argument2, argument3) //listener_setPosition
{
    if (argument3 == undefined)
        argument3 = 0
    var _attr = new Fmod3DAttributes()
    _attr.position.x = argument1
    _attr.position.y = argument2
    _attr.position.z = argument3
    _attr.forward.z = 1
    _attr.up.y = 1
    fmod_studio_system_set_listener_attributes(argument0, _attr)
}

