if (!instance_exists(baddieID))
{
    instance_destroy()
    return;
}
x = baddieID.x
y = baddieID.y
image_xscale = baddieID.image_xscale
image_yscale = baddieID.image_yscale
persistent = baddieID.persistent
var __player = instance_nearest(x, y, obj_player)
if (__player.character == "C")
    return;
if ((!(place_meeting(x, y, __player))) || __player.cutscene)
    return;
if (__player.state == (118 << 0))
{
    with (__player)
    {
        player_pummelhit()
        return;
    }
}
if (baddieID.state != 107 && baddieID.state != 300)
{
    with (__player)
    {
        var _bid = other.baddieID
        if (character == "S" && _bid.stuntouchbuffer <= 0 && (state == (47 << 0) || state == (66 << 0)) && sprite_index != spr_jump)
        {
            instance_create_depth(_bid.x, _bid.y, 0, obj_bangeffect)
            _bid.stuntouchbuffer = 15
            _bid.image_xscale = (-xscale)
            _bid.state = 104
            _bid.stompscale = 1.3
            if (_bid.stunned < 100)
                _bid.stunned = 100
            _bid.image_index = 0
            _bid.hsp = (-_bid.image_xscale) * movespeed * 2
            repeat (2)
            {
                with (instance_create_depth(x, y, 0, obj_slapstar))
                    vsp = irandom_range(-6, -11)
            }
        }
    }
}
if (__player.state != (91 << 0) && __player.state != (50 << 0))
{
    if (baddieID.state != 107 && baddieID.state != 300)
    {
        with (__player)
        {
            playerattacked = other.object_index
            _bid = other.baddieID
            if (instakillmove && state != (87 << 0) && (!_bid.ishurt))
            {
                if ((state == (66 << 0) && (character != "S" || character == "S")) || (state == (48 << 0) && character != "S" && (sprite_index == spr_machslideboost3 || sprite_index == spr_machslideboost3end)) || state == (18 << 0) || state == (13 << 0) || (state == (105 << 0) && (sprite_index == spr_barrelroll || sprite_index == spr_barrelslipnslide)) || state == (1 << 0) || state == (96 << 0) || state == (8 << 0) || state == (4 << 0))
                {
                    with (_bid)
                    {
                        if (hp <= 0)
                            instance_create_depth(x, y, -1, obj_genericpoofeffect)
                        instance_create_depth(x, y, 1, obj_bangeffect)
                        instance_create_depth(x, y, 1, obj_parryeffect)
                        hp = 0
                        scr_enemygibs()
                        alarm[3] = 3
                        alarm[1] = 5
                        image_index = 0
                        thrown = true
                        scr_fmod_soundeffectONESHOT("event:/sfx/enemy/punched", x, y)
                    }
                    machpunchAnim = 1
                    if ((!grounded) && input_check("jump") && (!rocket))
                        vsp = -11
                    if (state == (66 << 0) && sprite_index != spr_mach3hit && sprite_index != spr_crazyrun && (!rocket) && sprite_index != spr_player_sjumpcancel)
                    {
                        sprite_index = spr_mach3hit
                        image_index = 0
                    }
                    if (state == (13 << 0))
                        _bid.killedbyknightslide = true
                    if (hitstunstoredstate == (4 << 0))
                        _bid.killedbyfireassstoredsprite = hitstunstoredsprite
                    gamepadvibrate(1, 0, 15)
                    do_hitstun(global.mach3hitstun)
                    instance_destroy(_bid)
                    return;
                }
                else
                {
                    _bid.sprite_index = _bid.stunfallspr
                    _bid.flash = 1
                    _bid.hp -= 1
                    with (_bid)
                        scr_enemygibs()
                    scr_fmod_soundeffectONESHOT("event:/sfx/enemy/punched", x, y)
                    instance_create_depth(_bid.x, _bid.y, -1, obj_parryeffect)
                    if (state == (66 << 0) && sprite_index != spr_mach3hit && (!rocket) && sprite_index != spr_player_sjumpcancel)
                    {
                        sprite_index = spr_mach3hit
                        image_index = 0
                    }
                    camera_shake(3, 3)
                    machpunchAnim = true
                    _bid.thrown = true
                    _bid.state = 104
                    _bid.stunned = 100
                    _bid.image_xscale = (-xscale)
                    if (state != (73 << 0))
                    {
                        _bid.vsp = -4
                        _bid.hsp = (-_bid.image_xscale) * 10
                        if (_bid.hitfactor < 12)
                            _bid.hitfactor += 4
                    }
                    if input_check("jump")
                    {
                        if ((!grounded) && state != (51 << 0) && state != (25 << 0) && (!rocket) && sprite_index != spr_freefall && sprite_index != spr_facestomp)
                            vsp = -11
                    }
                    else if ((!grounded) && vsp > 0 && state != (120 << 0) && state != (25 << 0) && state != (51 << 0) && state != (5 << 0) && sprite_index != spr_freefall && sprite_index != spr_facestomp)
                        vsp = 0
                    do_hitstun(global.mach2hitstun)
                    gamepadvibrate(0.7, 0, 7)
                    restore_combo()
                    _bid.ishurt = true
                    if (_bid.hp <= 0)
                    {
                        if (hitstunstoredstate == (25 << 0))
                        {
                            var _grabbedind = -4
                            with (obj_baddie)
                            {
                                if (grabbedby == other.id)
                                    _grabbedind = object_index
                            }
                            _bid.killedwithbypiledrive = _grabbedind
                        }
                    }
                    if (state == (51 << 0) || sprite_index == spr_freefall || sprite_index == spr_facestomp)
                        other.alarm[0] = 60
                    else
                        other.alarm[0] = global.mach2hitstun + 8
                    if (character == "S" || _bid.hp <= 0 || hitstunstoredstate == (51 << 0) || hitstunstoredstate == (75 << 0) || hitstunstoredstate == (25 << 0) || hitstunstoredstate == (5 << 0) || hitstunstoredstate == (88 << 0) || hitstunstoredstate == (120 << 0) || hitstunstoredsprite != spr_freefall || hitstunstoredsprite != spr_facestomp)
                    {
                        instance_create_depth(_bid.x, _bid.y, 1, obj_bangeffect)
                        instance_destroy(_bid)
                        instance_destroy(other.id)
                        return;
                    }
                }
            }
            if ((_bid.state == 104 || _bid.state == 92) && state == (0 << 0) && global.currentbadge == (1 << 0) && (!_bid.thrown) && (!_bid.ishurt))
            {
                _bid.state = 107
                _bid.grabbedby = id
                state = (119 << 0)
                scr_fmod_soundeffectONESHOT("event:/sfx/player/grabthing", x, y)
            }
            if ((!grounded) && y < _bid.y && (!attacking) && vsp > 0 && _bid.vsp >= 0 && sprite_index != spr_mach2jump && sprite_index != spr_swingding && sprite_index != spr_swingdingend && sprite_index != spr_stompprep && (state == (36 << 0) || state == (81 << 0) || state == (106 << 0) || state == (28 << 0)))
            {
                if (x != _bid.x)
                    _bid.image_xscale = (-(sign(_bid.x - x)))
                _bid.state = 104
                if (_bid.stunned < 100)
                    _bid.stunned = 100
                _bid.image_index = 0
                _bid.stompscale = 0.5
                instance_create_depth(x, (y + 50), 0, obj_stompeffect)
                stompAnim = true
                if (state != (81 << 0))
                    vsp = -9 - 5 * input_check("jump")
                else
                    vsp = 0
                if (state != (28 << 0) && state != (81 << 0))
                {
                    image_index = 0
                    if global.smallpep
                        sprite_index = spr_smallstompprep
                    else
                        sprite_index = spr_stompprep
                }
                scr_fmod_soundeffectONESHOT("event:/sfx/player/stomp", x, y)
            }
            if (_bid.state != 107 && (state == (25 << 0) || state == (51 << 0)))
            {
                _bid.sprite_index = _bid.stunfallspr
                _bid.flash = 1
                with (_bid)
                    scr_enemygibs()
                camera_shake(4, 2)
                add_combo()
                _bid.thrown = true
                _bid.state = 104
                scr_fmod_soundeffectONESHOT("event:/sfx/enemy/punched", x, y)
                _bid.hp -= 1
                if (_bid.stunned < 100)
                    _bid.stunned = 100
                instance_create_depth(x, y, 0, obj_bumpeffect)
                instance_create_depth(_bid.x, _bid.y, 0, obj_bangeffect)
                _bid.vsp = -8
                _bid.hsp = xscale * 10
                do_hitstun(global.mach2hitstun)
            }
            if (sprite_index == spr_swingding && _bid.state != 107)
            {
                if (state != (70 << 0))
                {
                    if (vsp > 0)
                        vsp = 0
                    instance_create_depth(x, y, 1, obj_parryeffect)
                    camera_shake(3, 3)
                    do_hitstun(global.mach2hitstun)
                }
                var _bbx = other.id
                with (_bid)
                {
                    sprite_index = stunfallspr
                    scr_enemygibs()
                    camera_shake(3, 3)
                    instance_destroy(_bid)
                    instance_destroy(_bbx)
                }
            }
        }
    }
}
