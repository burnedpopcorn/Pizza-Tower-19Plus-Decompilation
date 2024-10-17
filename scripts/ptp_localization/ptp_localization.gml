function strings_read(argument0) //strings_read
{
    var _stringsfile = buffer_load(argument0)
    var _strings = buffer_read(_stringsfile, buffer_string)
    obj_pause.stringsstruct = json_parse(_strings)
    buffer_delete(_stringsfile)
}

function dialogue_read(argument0) //dialogue_read
{
    var _folders = []
    for (var _folder = file_find_first((argument0 + "/*"), 16); _folder != ""; _folder = file_find_next())
        array_push(_folders, _folder)
    file_find_close()
    for (var i = 0; i < array_length(_folders); i++)
    {
        for (var _dialogue = file_find_first(string("{0}/{1}/*", argument0, _folders[i]), 0); _dialogue != ""; _dialogue = file_find_next())
            ds_map_add(obj_pause.dialoguemap, string("{0}/{1}", _folders[i], string_replace(_dialogue, ".psn", "")), parse_dialogue(string("{0}/{1}/{2}", argument0, _folders[i], _dialogue)))
        file_find_close()
    }
}

function string_get(argument0) //string_get
{
    var _vars = string_split(argument0, "/")
    var _prevvar = obj_pause.stringsstruct
    for (var i = 0; i < array_length(_vars); i++)
        _prevvar = variable_struct_get(_prevvar, _vars[i])
    if is_undefined(_prevvar)
        _prevvar = "UNDEFINED STRING"
    for (var p = 1; p < argument_count; p++)
    {
        var _replace = argument[p]
        var _isdirectory = true
        if is_string(_replace)
        {
            var _adir = string_split(_replace, "/")
            var _aroot = obj_pause.stringsstruct
            var l = 0
            while (l < array_length(_adir))
            {
                var _founddir = variable_struct_get(_aroot, _adir[l])
                if is_undefined(_founddir)
                {
                    _isdirectory = false
                    break
                }
                else
                {
                    _aroot = _founddir
                    l++
                }
            }
        }
        else
            _isdirectory = false
        _replace = (_isdirectory ? _aroot : string(_replace))
        if is_array(_prevvar)
        {
            for (i = 0; i < array_length(_prevvar); i++)
                _prevvar[i] = string_replace(_prevvar[i], string("{{0}}", (p - 1)), _replace)
        }
        else
            _prevvar = string_replace(_prevvar, string("{{0}}", (p - 1)), _replace)
    }
    return _prevvar;
}

function dialogue_get(argument0) //dialogue_get
{
    var _dialogue = ds_map_find_value(obj_pause.dialoguemap, argument0)
    if is_undefined(_dialogue)
        _dialogue = parse_dialogue("{PP;SK;MR}\n\n[PP_Normal] ???\n[SK_Normal] ???\n[MR_Normal] Well this sucks.")
    return _dialogue;
}

function parse_dialogue(argument0) //parse_dialogue
{
    if (argument0 == undefined)
        argument0 = -1
    var _str = ""
    if (file_exists(argument0) && argument0 != -1)
    {
        var _txtbuff = buffer_load(argument0)
        _str = buffer_read(_txtbuff, buffer_string)
        buffer_delete(_txtbuff)
    }
    else
        _str = "{PP;SK;MR}\n\n[PP_Normal] ???\n[SK_Normal] ???\n[MR_Normal] Well this sucks."
    _str = string_replace_all(_str, "\r\n", "\n")
    var _lines = string_split(_str, "\n", true)
    var _array = array_create(0)
    var _characterline = array_shift(_lines)
    _characterline = string_copy(_characterline, 2, (string_length(_characterline) - 2))
    var _characters = string_split(_characterline, ";")
    for (var i = 0; i < array_length(_lines); i++)
    {
        var _guidepos = string_pos("]", _lines[i])
        var _guide = string_copy(_lines[i], 2, (_guidepos - 2))
        var _seppos = string_pos("_", _guide)
        var _character = string_copy(_guide, 1, (_seppos - 1))
        var _expression = string_copy(_guide, (_seppos + 1), (string_length(_guide) - _seppos))
        var _dialogue = string_copy(_lines[i], (_guidepos + 2), (string_length(_lines[i]) - _guidepos - 1))
        array_push(_array, 
        {
            character: _character,
            expression: _expression,
            dialogue: _dialogue
        }
)
    }
    return 
    {
        characters: _characters,
        lines: _array
    };
}

