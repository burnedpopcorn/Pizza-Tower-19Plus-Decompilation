var _resetbindskey, _resetbindspad, _baseoptions, _datadel, _closegame;

draw_set_font(global.font);
optiontip = string_get("menu/options/tips/generic");

function MenuItem(argument0) constructor
{
    static update = function()
    {
    };
    
    static highlighted = function(argument0)
    {
    };
    
    static draw = function(argument0, argument1, argument2)
    {
        if (is_string(name))
            __draw_text_colour_hook(round(argument0), round(argument1), name, c_white, c_white, c_white, c_white, 1 / (2 - argument2));
        else if (name != -1)
            draw_sprite_ext(name, 0, round(argument0), round(argument1), 1, 1, 0, c_white, 1 / (2 - argument2));
    };
    
    static parented = function()
    {
    };
    
    static left_right = function(argument0, argument1)
    {
    };
    
    static jump = function(argument0)
    {
    };
    
    static taunt = function(argument0)
    {
    };
    
    static unlock = function(argument0)
    {
    };
    
    parent = -4;
    yspacing = 50;
    name = argument0;
    skip = false;
}

function Spacer(argument0 = "") : MenuItem(argument0) constructor
{
    skip = true;
}

function Option(argument0, argument1, argument2, argument3 = [new Selection(string_get("menu/options/generic/no"), false), new Selection(string_get("menu/options/generic/yes"), true)], argument4 = -4, argument5 = false) : MenuItem(argument0) constructor
{
    var i;
    
    static updatevar = function(argument0, argument1 = true)
    {
        variable_global_set(variable, argument0);
        
        if (argument1)
            config_set_option(section, variable, argument0);
        
        if (updateglobals != -4)
            updateglobals();
    };
    
    static update = function()
    {
        array_foreach(selections, function(argument0, argument1)
        {
            argument0.update();
        });
    };
    
    static highlighted = function(argument0)
    {
        selections[chosensel].highlighted(argument0);
    };
    
    static left_right = function(argument0, argument1)
    {
        if (!parent.locked && !alone)
            chosensel = clamp(chosensel + argument0, 0, array_length(selections) - 1);
        else
            selections[chosensel].left_right(argument0, argument1);
        
        if (!alone && auto && argument0 != 0)
        {
            updatevar(selections[chosensel].value);
            event_play_oneshot("event:/sfx/pausemenu/impact");
        }
    };
    
    static jump = function(argument0)
    {
        selections[chosensel].jump(argument0);
    };
    
    static taunt = function(argument0)
    {
        selections[chosensel].taunt(argument0);
    };
    
    static unlock = function(argument0)
    {
        selections[chosensel].unlock(argument0);
    };
    
    variable = argument1;
    section = argument2;
    selections = argument3;
    updateglobals = argument4;
    auto = argument5;
    chosensel = 0;
    alone = array_length(selections) == 1;
    
    if (variable != "")
    {
        for (i = 0; i < array_length(selections); i++)
        {
            if (selections[i].value == variable_global_get(variable))
            {
                chosensel = i;
                break;
            }
        }
    }
    
    array_foreach(selections, function(argument0, argument1)
    {
        argument0.parent = self;
        argument0.parented();
    });
}

function Selection(argument0, argument1) : MenuItem(argument0) constructor
{
    static getfolder = function()
    {
        return parent.parent;
    };
    
    static getwidth = function()
    {
        if (forcedwidth != -1)
            return forcedwidth;
        
        if (is_string(name))
            return string_width(name);
        else if (name != -1)
            return sprite_get_width(name);
    };
    
    static highlighted = function(argument0)
    {
        argument0.optiontip = string_get(parent.auto ? "menu/options/tips/selectionauto" : "menu/options/tips/selection");
    };
    
    static jump = function()
    {
        if (parent.auto)
            exit;
        
        event_play_oneshot("event:/sfx/pausemenu/impact");
        parent.updatevar(value);
    };
    
    value = argument1;
    forcedwidth = -1;
}

function VideoSelection(argument0) : Selection(-1, argument0) constructor
{
    static update = function()
    {
        name = string("{0}X{1}", global.screensizes[global.resmode][value][0], global.screensizes[global.resmode][value][1]);
    };
}

function Slider(argument0 = 0, argument1 = 1, argument2 = 0.01, argument3 = (0 << 0)) : Selection(-1, -1) constructor
{
    static parented = function()
    {
        value = variable_global_get(parent.variable);
    };
    
    static highlighted = function(argument0)
    {
        if (parent.alone)
            argument0.optiontip = string_get("menu/options/tips/slideralone");
        else if (selected)
            argument0.optiontip = string_get("menu/options/tips/slider");
    };
    
    static draw = function(argument0, argument1, argument2)
    {
        var _midwidth, _percent, _percentalt, _percentaltalt, _text;
        
        _midwidth = forcedwidth / 2;
        _percent = lerp(0, 100, (value - value_min) / (value_max - value_min));
        _percentalt = lerp(0, value_max * 100, (value - value_min) / (value_max - value_min));
        _percentaltalt = lerp(value_min * 100, value_max * 100, (value - value_min) / (value_max - value_min));
        _text = "";
        draw_sprite(spr_slidertrack, 0, round(argument0 - _midwidth), round(argument1));
        draw_sprite(spr_sliderknob, 0, round((argument0 - _midwidth) + (200 * (_percent / 100))), round(argument1));
        
        switch (visual)
        {
            case (1 << 0):
                _text = string(value);
                break;
            
            case (2 << 0):
                _text = string(int64(value));
                break;
            
            case (3 << 0):
                _text = string("{0}%", int64(_percent));
                break;
            
            case (4 << 0):
                _text = string("{0}%", int64(_percentalt));
                break;
            
            case (5 << 0):
                _text = string("{0}%", int64(_percentaltalt));
                break;
            
            case (6 << 0):
                _text = string("{0}°", round(value));
                break;
        }
        
        __draw_text_colour_hook(argument0, argument1, _text, c_white, c_white, c_white, c_white, 1 / (2 - argument2));
    };
    
    static jump = function()
    {
        if (!selected && !parent.alone)
        {
            event_play_oneshot("event:/sfx/pausemenu/impact");
            getfolder().locked++;
            selected = true;
        }
    };
    
    static left_right = function(argument0, argument1)
    {
        value = clamp(value + (argument1 * value_step), value_min, value_max);
        parent.updatevar(value, parent.alone);
    };
    
    static unlock = function(argument0)
    {
        if (selected && !alone)
        {
            selected = false;
            event_play_oneshot("event:/sfx/pausemenu/rubbersqueak");
            parent.updatevar(value);
            getfolder().locked--;
        }
    };
    
    value_min = argument0;
    value_max = argument1;
    value_step = argument2;
    visual = argument3;
    selected = false;
    forcedwidth = 200;
    alone = false;
}

function Keybinder(argument0, argument1) : Selection(-1, -1) constructor
{
    static update = function()
    {
        name = "[J]";
        forcedwidth = 76;
    };
    
    static highlighted = function(argument0)
    {
        argument0.optiontip = string_get("menu/options/tips/" + (selected ? "keybinder" : "keyconfig"));
    };
    
    static draw = function(argument0, argument1, argument2)
    {
        var i, _perc;
        
        draw_set_valign(fa_top);
        draw_set_halign(fa_left);
        
        for (i = 0; i < 2; i++)
        {
            _perc = i / 2;
            draw_input(round(argument0 - 16 - (forcedwidth * _perc)), round(argument1 - 16), 1, parent.variable, false, parent.section, i);
        }
        
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
    };
    
    static jump = function()
    {
        if (!selected)
        {
            selected = true;
            event_play_oneshot("event:/sfx/pausemenu/impact");
            getfolder().locked++;
            input_binding_scan_params_set([112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 45, 46, 44, 145, 19, 36, 35, 33, 34, (os_type == os_macosx) ? 92 : 91, (os_type == os_macosx) ? (((os_type == os_macosx || (os_type == os_ios || os_type == os_tvos)) && (0 || os_type == os_gxgames)) ? 93 : 91) : 92, ((os_type == os_macosx || (os_type == os_ios || os_type == os_tvos)) && (0 || os_type == os_gxgames)) ? 12 : 144, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 111, 107, 109, 110], undefined, filter, player);
            input_binding_scan_start(function(argument0)
            {
                var _prevbind;
                
                _prevbind = input_binding_get(parent.variable, 0, 0, parent.section);
                input_binding_set(parent.variable, argument0, player, 0, parent.section);
                
                if (!json_are_equal(argument0, _prevbind))
                    input_binding_set(parent.variable, _prevbind, player, 1, parent.section);
                
                getfolder().locked--;
                selected = false;
            }, function(argument0)
            {
                getfolder().locked--;
                selected = false;
            });
        }
    };
    
    static taunt = function()
    {
        if (!selected)
        {
            trace("fffffffff");
            event_play_oneshot("event:/sfx/pausemenu/impact");
            input_binding_set(parent.variable, input_binding_empty(), 0, 0, parent.section);
            input_binding_set(parent.variable, input_binding_empty(), 0, 1, parent.section);
        }
    };
    
    player = argument0;
    filter = argument1;
    selected = false;
}

function StackedOption(argument0, argument1, argument2, argument3 = [new Selection(string_get("menu/options/generic/off"), false), new Selection(string_get("menu/options/generic/on"), true)], argument4 = -4, argument5 = true) : Option(argument0, argument1, argument2, argument3, argument4, argument5) constructor
{
    static draw = function(argument0, argument1, argument2)
    {
        var _len, _maxwidth, _i, _offset;
        
        __draw_text_colour_hook(480, argument1, name, c_white, c_white, c_white, c_white, 1 / (2 - argument2));
        _len = array_length(selections);
        _maxwidth = 0;
        
        for (_i = 0; _i < _len; _i++)
            _maxwidth = max(selections[_i].getwidth(), _maxwidth);
        
        _maxwidth += 18;
        
        for (_i = 0; _i < _len; _i++)
        {
            _offset = ((1 - _len) / 2) + _i;
            selections[_i].draw(480 + (_maxwidth * _offset), argument1 + 50, chosensel == _i);
        }
    };
    
    yspacing = 100;
}

function SideOption(argument0, argument1, argument2, argument3 = [new Selection(string_get("menu/options/generic/off"), false), new Selection(string_get("menu/options/generic/on"), true)], argument4 = -4, argument5 = true) : Option(argument0, argument1, argument2, argument3, argument4, argument5) constructor
{
    static draw = function(argument0, argument1, argument2)
    {
        var _sel, _margin;
        
        _sel = selections[chosensel];
        _margin = 100;
        __draw_text_colour_hook(round(nameoffset + _margin), round(argument1), name, c_white, c_white, c_white, c_white, 1 / (2 - argument2));
        _sel.draw(round(get_game_width() - (_sel.getwidth() / 2) - _margin), round(argument1), true);
    };
    
    nameoffset = string_width(name) / 2;
}

function Folder(argument0, argument1 = [], argument2 = bg_options, argument3 = false) : MenuItem(argument0) constructor
{
    var _i;
    
    static enterfolder = function(argument0)
    {
        var _memyselfandi;
        
        _memyselfandi = self;
        
        with (argument0)
        {
            event_play_oneshot("event:/sfx/pausemenu/impact");
            ds_stack_push(optionstack, _memyselfandi);
            array_push(bgqueue, _memyselfandi);
        }
        
        dofade = false;
    };
    
    static exitfolder = function(argument0)
    {
        event_play_oneshot("event:/sfx/pausemenu/rubbersqueak");
        ds_stack_pop(argument0.optionstack);
        
        if (ds_stack_empty(argument0.optionstack))
            instance_destroy(argument0);
        else
            dofade = true;
    };
    
    static drawoptions = function()
    {
        var _gy, _totalspacing, _i;
        
        _gy = middlealign ? ((get_game_height() / 2) - (maxheight / 2)) : 100;
        _totalspacing = _gy;
        
        if (!middlealign)
        {
            for (_i = 0; _i <= optionselected; _i++)
                _totalspacing += options[_i].yspacing;
            
            scroll = lerp(scroll, min(0, get_game_height() - 50 - _totalspacing), 0.1);
            _gy += scroll;
        }
        
        for (_i = 0; _i < array_length(options); _i++)
        {
            options[_i].draw(480, _gy, _i == optionselected);
            _gy += options[_i].yspacing;
        }
    };
    
    static update = function()
    {
        array_foreach(options, function(argument0, argument1)
        {
            argument0.update();
        });
    };
    
    static jump = function(argument0)
    {
        enterfolder(argument0);
    };
    
    static unlock = function(argument0)
    {
        exitfolder(argument0);
    };
    
    optionselected = 0;
    options = argument1;
    background = argument2;
    middlealign = argument3;
    locked = 0;
    scroll = 0;
    dofade = false;
    fade = 0;
    array_foreach(options, function(argument0, argument1)
    {
        argument0.parent = self;
        argument0.parented();
    });
    maxheight = 0;
    
    if (middlealign)
    {
        for (_i = 0; _i < array_length(options); _i++)
            maxheight += options[_i].yspacing;
    }
}

function KeyFolder(argument0, argument1 = [], argument2 = bg_options, argument3 = false) : Folder(argument0, argument1, argument2, argument3) constructor
{
    static jump = function(argument0)
    {
        enterfolder(argument0);
        
        if (!input_profile_exists(tempprofile))
            input_profile_create(tempprofile);
        
        input_profile_copy(0, input_profile_get(0), 0, tempprofile);
        input_profile_set(tempprofile);
    };
    
    static unlock = function(argument0)
    {
        exitfolder(argument0);
        
        if (input_profile_exists(tempprofile))
            input_profile_destroy(tempprofile);
        
        config_set_option("Input", "bindings", input_system_export(false));
    };
    
    tempprofile = "pauseprofile";
}

_resetbindskey = new MenuItem(string_get("menu/options/input/resetbinds"));

_resetbindskey.jump = function()
{
    input_profile_reset_bindings("keyboard_and_mouse");
    config_set_option("Input", "bindings", input_system_export(false));
    scr_tiptext(string_get("tips/menu/options/keybindsreset"));
};

_resetbindspad = new MenuItem(string_get("menu/options/input/resetbinds"));

_resetbindspad.jump = function()
{
    input_profile_reset_bindings("gamepad");
    config_set_option("Input", "bindings", input_system_export(false));
    scr_tiptext(string_get("tips/menu/options/padbindsreset"));
};

_baseoptions = new Folder("Base", [new Folder(string_get("menu/options/input/mainname"), [new Folder(string_get("menu/options/input/keyname"), [new KeyFolder(string_get("menu/options/input/bindname"), [new SideOption(string_get("menu/options/input/up"), "up", "keyboard_and_mouse", [new Keybinder(0, __input_global().__source_keyboard)]), new SideOption(string_get("menu/options/input/down"), "down", "keyboard_and_mouse", [new Keybinder(0, __input_global().__source_keyboard)]), new SideOption(string_get("menu/options/input/left"), "left", "keyboard_and_mouse", [new Keybinder(0, __input_global().__source_keyboard)]), new SideOption(string_get("menu/options/input/right"), "right", "keyboard_and_mouse", [new Keybinder(0, __input_global().__source_keyboard)]), new Spacer(), new SideOption(string_get("menu/options/input/jump"), "jump", "keyboard_and_mouse", [new Keybinder(0, __input_global().__source_keyboard)]), new SideOption(string_get("menu/options/input/attack"), "attack", "keyboard_and_mouse", [new Keybinder(0, __input_global().__source_keyboard)]), new SideOption(string_get("menu/options/input/taunt"), "taunt", "keyboard_and_mouse", [new Keybinder(0, __input_global().__source_keyboard)]), new SideOption(string_get("menu/options/input/dash"), "dash", "keyboard_and_mouse", [new Keybinder(0, __input_global().__source_keyboard)]), new Spacer(), new SideOption(string_get("menu/options/input/superjump"), "superjump", "keyboard_and_mouse", [new Keybinder(0, __input_global().__source_keyboard)]), new SideOption(string_get("menu/options/input/groundpound"), "groundpound", "keyboard_and_mouse", [new Keybinder(0, __input_global().__source_keyboard)]), new Spacer(), new SideOption(string_get("menu/options/input/pause"), "pause", "keyboard_and_mouse", [new Keybinder(0, __input_global().__source_keyboard)])], bg_controls), _resetbindskey], bg_controls, true), new Folder(string_get("menu/options/input/padname"), [new KeyFolder(string_get("menu/options/input/bindname"), [new SideOption(string_get("menu/options/input/up"), "up", "gamepad", [new Keybinder(0, __input_global().__source_gamepad)]), new SideOption(string_get("menu/options/input/down"), "down", "gamepad", [new Keybinder(0, __input_global().__source_gamepad)]), new SideOption(string_get("menu/options/input/left"), "left", "gamepad", [new Keybinder(0, __input_global().__source_gamepad)]), new SideOption(string_get("menu/options/input/right"), "right", "gamepad", [new Keybinder(0, __input_global().__source_gamepad)]), new Spacer(), new SideOption(string_get("menu/options/input/jump"), "jump", "gamepad", [new Keybinder(0, __input_global().__source_gamepad)]), new SideOption(string_get("menu/options/input/attack"), "attack", "gamepad", [new Keybinder(0, __input_global().__source_gamepad)]), new SideOption(string_get("menu/options/input/taunt"), "taunt", "gamepad", [new Keybinder(0, __input_global().__source_gamepad)]), new SideOption(string_get("menu/options/input/dash"), "dash", "gamepad", [new Keybinder(0, __input_global().__source_gamepad)]), new Spacer(), new SideOption(string_get("menu/options/input/superjump"), "superjump", "gamepad", [new Keybinder(0, __input_global().__source_gamepad)]), new SideOption(string_get("menu/options/input/groundpound"), "groundpound", "gamepad", [new Keybinder(0, __input_global().__source_gamepad)]), new Spacer(), new SideOption(string_get("menu/options/input/pause"), "pause", "gamepad", [new Keybinder(0, __input_global().__source_gamepad)])], bg_controls), new KeyFolder(string_get("menu/options/input/deadzones/name"), [new SideOption(string_get("menu/options/input/deadzones/horizdeadzone"), "horizdeadzone", "Input", [new Slider(0, 1, 0.01, (3 << 0))], apply_inputglobals), new SideOption(string_get("menu/options/input/deadzones/vertdeadzone"), "vertdeadzone", "Input", [new Slider(0, 1, 0.01, (3 << 0))], apply_inputglobals)], bg_controls, true), _resetbindspad], bg_controls, true)], bg_controls, true), new Folder(string_get("menu/options/video/name"), [new SideOption(string_get("menu/options/video/fullscreen/name"), "fullscreen", "Video", [new Selection(string_get("menu/options/video/fullscreen/windowed"), 0), new Selection(string_get("menu/options/video/fullscreen/exclusive"), 1), new Selection(string_get("menu/options/video/fullscreen/borderless"), 2)], apply_videoglobals, false), new SideOption(string_get("menu/options/video/aspectratio"), "resmode", "Video", [new Selection("16:9", (1 << 0)), new Selection("16:10", (2 << 0))], apply_videoglobals, false), new SideOption(string_get("menu/options/video/resolution"), "resnumb", "Video", [new VideoSelection(0), new VideoSelection(1), new VideoSelection(2), new VideoSelection(3), new VideoSelection(4)], apply_videoglobals, false), new SideOption(string_get("menu/options/video/scalemode/name"), "scalemode", "Video", [new Selection(string_get("menu/options/video/scalemode/fit"), (0 << 0)), new Selection(string_get("menu/options/video/scalemode/fill"), (1 << 0)), new Selection(string_get("menu/options/video/scalemode/perfect"), (2 << 0)), new Selection(string_get("menu/options/video/scalemode/exact"), (3 << 0))], apply_videoglobals, false), new SideOption(string_get("menu/options/video/border/name"), "border", "Video", [new Selection(string_get("menu/options/video/border/none"), 0), new Selection(string_get("menu/options/video/border/entry"), 1), new Selection(string_get("menu/options/video/border/medieval"), 2), new Selection(string_get("menu/options/video/border/ruin"), 3), new Selection(string_get("menu/options/video/border/dungeon"), 4), new Selection(string_get("menu/options/video/border/90s"), 5), new Selection(string_get("menu/options/video/border/genesis"), 6), new Selection(string_get("menu/options/video/border/steam"), 7)], apply_videoglobals, false), new SideOption(string_get("menu/options/video/aa"), "antialiasing", "Video", undefined, apply_videoglobals, false), new SideOption(string_get("menu/options/video/vsync"), "vsync", "Video", undefined, apply_videoglobals, false)], bg_video, true), new Folder(string_get("menu/options/audio/name"), [new SideOption(string_get("menu/options/audio/mastervolume"), "mastervolume", "Audio", [new Slider(0, 1, 0.01, (3 << 0))]), new SideOption(string_get("menu/options/audio/musicvolume"), "musicvolume", "Audio", [new Slider(0, 1, 0.01, (3 << 0))]), new SideOption(string_get("menu/options/audio/sfxvolume"), "sfxvolume", "Audio", [new Slider(0, 1, 0.01, (3 << 0))]), new SideOption(string_get("menu/options/audio/unfocusedmute"), "unfocusedmute", "Audio")], bg_audio, true), new Folder(string_get("menu/options/access/name"), [new SideOption(string_get("menu/options/access/escapetilt"), "escapetilt", "Accessibility", [new Slider(-10, 10, 0.1, (6 << 0))]), new SideOption(string_get("menu/options/access/screenshake"), "screenshake", "Accessibility"), new SideOption(string_get("menu/options/access/rumble"), "rumble", "Accessibility"), new SideOption(string_get("menu/options/access/scorecolours"), "scorecolours", "Accessibility"), new SideOption(string_get("menu/options/access/timertype/name"), "timertype", "Accessibility", [new Selection(string_get("menu/options/access/timertype/none"), 0), new Selection(string_get("menu/options/access/timertype/perlevel"), 1), new Selection(string_get("menu/options/access/timertype/persave"), 2), new Selection(string_get("menu/options/access/timertype/both"), 3)]), new SideOption(string_get("menu/options/access/ghostalpha"), "ghostalpha", "Accessibility", [new Slider(0, 1, 0.01, (3 << 0))]), new SideOption(string_get("menu/options/access/ghostoutlinealpha"), "ghostoutlinealpha", "Accessibility", [new Slider(0, 1, 0.01, (3 << 0))]), new SideOption(string_get("menu/options/access/tvscrollspd"), "tvscrollspd", "Accessibility", [new Slider(1, 3, 0.01, (2 << 0))]), new SideOption(string_get("menu/options/access/tvtextalpha"), "tvtextalpha", "Accessibility", [new Slider(0.4, 1, 0.01, (5 << 0))]), new SideOption(string_get("menu/options/access/hatbounce"), "hatbounce", "Accessibility"), new SideOption(string_get("menu/options/access/screeneffect"), "screeneffect", "Accessibility")], bg_accessibility)], bg_options, true);

if (room == TitlescreenRoom)
{
    _datadel = new Folder(string_get("menu/options/savedelete/name"), [new StackedOption(string_get("menu/options/savedelete/question"), "", "", [new Selection(string_get("menu/options/generic/no"), 0), new Selection(string_get("menu/options/generic/yes"), 0)], -4, false)], bg_delete, true);
    
    with (_datadel.options[0].selections[0])
    {
        jump = function(argument0)
        {
            with (getfolder())
                exitfolder(argument0);
        };
    }
    
    with (_datadel.options[0].selections[1])
    {
        jump = function(argument0)
        {
            save_clear();
            save_delete();
            event_play_oneshot("event:/sfx/pausemenu/explosion");
            scr_tiptext(string_get("tips/menu/options/savedatawiped"));
            
            with (getfolder())
                exitfolder(argument0);
        };
    }
    
    array_push(_baseoptions.options, _datadel);
    _closegame = new Folder(string_get("menu/options/closegame/name"), [new StackedOption(string_get("menu/options/closegame/question"), "", "", [new Selection(string_get("menu/options/generic/no"), 0), new Selection(string_get("menu/options/generic/yes"), 0)], -4, false)], bg_close, true);
    
    with (_closegame.options[0].selections[0])
    {
        jump = function(argument0)
        {
            with (getfolder())
                exitfolder(argument0);
        };
    }
    
    with (_closegame.options[0].selections[1])
    {
        jump = function(argument0)
        {
            game_end();
        };
    }
    
    array_push(_baseoptions.options, _closegame);
}

bgqueue = [];
optionstack = ds_stack_create();
_baseoptions.jump(id);
_baseoptions.fade = 1;
bgx = 0;
bgy = 0;
depth = -11000;
