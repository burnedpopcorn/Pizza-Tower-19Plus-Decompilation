if (!soundsetup)
{
    soundsetup = true
    for (var i = 0; i < array_length(scenario.characters); i++)
    {
        var _charid = scenario.characters[i]
        var _charev = array_get(self.get_char(_charid), 2)
        ds_map_set(sounds, _charid, event_instance(_charev))
    }
}
switch state
{
    case (0 << 0):
        bubblescaleanim = 0
        bubblerot = 0
        bubbletilttimer = 0
        nameboxscaleanim = 0
        nameboxrot = 0
        nameslideanim = 0
        characterslide = 0
        currentline = 0
        currentchar = 0
        talkspr = 0
        nextbuttonind = 0
        break
    case (1 << 0):
        if (bubblescaleanim > 0.3)
        {
            nameboxscaleanim += 0.05
            if (nameboxscaleanim > 0.4)
                nameslideanim += 0.05
        }
        if (bubblescaleanim > 0.5)
            characterslide = Approach(characterslide, 1, 0.1)
        bubblescaleanim += 0.05
        if (bubblescaleanim >= 1 && nameboxscaleanim >= 1 && nameslideanim >= 1)
        {
            nameboxscaleanim = 1
            nameslideanim = 1
            bubblescaleanim = 1
            state = (2 << 0)
        }
        break
    case (2 << 0):
        characterslide = Approach(characterslide, 1, 0.1)
        var _str = string_wordwrap_width(scenario.lines[currentline].dialogue, 636, "\n", false)
        if (currentchar < string_length(_str))
        {
            if ((currentchar % 6.5) == 0)
            {
                fmod_studio_event_instance_start(ds_map_find_value(sounds, scenario.lines[currentline].character))
                talkspr = 7
            }
            currentchar += 0.5
        }
        if input_check_pressed("jump")
        {
            if (ceil(currentchar) < string_length(_str))
            {
                fmod_studio_event_instance_start(ds_map_find_value(sounds, scenario.lines[currentline].character))
                currentchar = string_length(_str)
            }
            else if (currentline < (array_length(scenario.lines) - 1))
            {
                var _prev = scenario.lines[currentline].character
                currentline++
                currentchar = 0
                talkspr = 0
                if (scenario.lines[currentline].character != _prev)
                {
                    characterslide = 0
                    state = (3 << 0)
                }
            }
            else
                state = (4 << 0)
        }
        bubbletilttimer++
        if (bubbletilttimer >= 65)
        {
            bubblerot = random_range(1, -1)
            nameboxrot = random_range(3, -3)
            bubbletilttimer = 0
        }
        break
    case (3 << 0):
        characterslide = Approach(characterslide, 1, 0.1)
        if (characterslide >= 1)
            state = (2 << 0)
        break
    case (4 << 0):
        characterslide = 0
        currentchar = 0
        nameslideanim = 0
        nameboxscaleanim -= 0.05
        if (nameboxscaleanim < 0.7)
            bubblescaleanim -= 0.05
        if (bubblescaleanim <= 0 && nameboxscaleanim <= 0)
        {
            state = (0 << 0)
            obj_player.state = (0 << 0)
            self.endfunc()
        }
        break
}

var _sign = (-(sign(x - obj_player.x)))
if (_sign != 0)
    image_xscale = _sign
if (talkspr > 0)
    talkspr--
