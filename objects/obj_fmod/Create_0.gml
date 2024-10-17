/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for fmod_path_bundle

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 261
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 864
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|5_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModToolCE\UndertaleModToolCE\UndertaleModLib\Decompiler\Decompiler.cs:line 624
*/
var _max_channels = 1024
var _flags_core = (0 << 0)
var _flags_studio = (0 << 0)
fmod_studio_system_create()
show_debug_message("fmod_studio_system_create: " + string(fmod_last_result()))
fmod_studio_system_init(_max_channels, _flags_studio, _flags_core)
show_debug_message("fmod_studio_system_init: " + string(fmod_last_result()))
fmod_main_system = fmod_studio_system_get_core_system()
var banks = ["Data/Audio/Master.strings.bank", "Data/Audio/Master.bank", "Data/Audio/Music.bank", "Data/Audio/SFX.bank"]
for (var i = array_length(banks) - 1; i >= 0; i--)
{
    bank[i] = fmod_studio_system_load_bank_file(fmod_path_bundle(banks[i]), (0 << 0))
    fmod_studio_bank_load_sample_data(bank[i])
}
z = 0
show_debug_message(string("Listener Status: {0}; Position: {1}, {2}, {3}", listener_setPosition(0, x, y, z), x, y, z))
global.sound_map = ds_map_create()
