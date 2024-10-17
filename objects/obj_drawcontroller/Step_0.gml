gameframe_update()
goawaytimer = Approach(goawaytimer, 0, 1)
if ((device_mouse_x_to_gui(0) != mouse_xprev || device_mouse_y_to_gui(0) != mouse_yprev) && gameframe_mouse_in_window())
    goawaytimer = 100
if (goawaytimer == 0)
{
    global.gameframe_alpha = Approach(global.gameframe_alpha, 0, 0.1)
    global.gameframe_set_cursor = false
    window_set_cursor(cr_none)
}
else
{
    global.gameframe_alpha = Approach(global.gameframe_alpha, 1, 0.1)
    global.gameframe_set_cursor = true
}
mouse_xprev = device_mouse_x_to_gui(0)
mouse_yprev = device_mouse_y_to_gui(0)
if (obj_pause.pause && (!copyapp))
    return;
targetzoom = min(2.5, targetzoom)
var vw = camera_get_view_width(view_camera[0])
var vh = camera_get_view_height(view_camera[0])
var nw = lerp(vw, (targetzoom * get_game_width()), zoomspd)
var nh = lerp(vh, (targetzoom * get_game_height()), zoomspd)
var vw2 = camera_get_view_width(view_camera[1])
var vh2 = camera_get_view_height(view_camera[1])
var nw2 = lerp(vw2, (targetzoom * global.maxscreenwidth), zoomspd)
var nh2 = lerp(vh2, (targetzoom * global.maxscreenheight), zoomspd)
var p = obj_player
camera_set_view_size(view_camera[0], nw, nh)
camera_set_view_size(view_camera[1], nw2, nh2)
if (!instance_exists(obj_endlevelfade))
    alpha = (!scr_hudroomcheck())
if ((!global.panic) || obj_music.secret || instance_exists(obj_pizzaface))
    escapetimery = Approach(escapetimery, 64, 1)
else
    escapetimery = Approach(escapetimery, -50, 1)
p2pdistancex = 0
timestop = room == timesuproom
if (global.panic && (!obj_music.secret) && global.levelname != "tutorial" && (!global.stoptimer))
{
    if (global.escapetime <= 0 && (!ded))
    {
        if (global.levelname != "dragonslair")
        {
            if ((!instance_exists(obj_pizzaface)) && (!scr_treasureroomcheck()))
            {
                instance_create_depth(obj_player.x, obj_player.y, -5, obj_pizzaface)
                event_play_oneshot("event:/sfx/boss/pizzaface/laugh")
            }
        }
        else
        {
            global.panic = false
            obj_player.state = (94 << 0)
            with (obj_baddie)
                persistent = false
            room_goto(timesuproom)
            obj_player.image_index = 0
            obj_player.visible = true
            obj_player.vsp = 0
            obj_player.hsp = 0
            scr_fmod_soundeffectONESHOT("event:/sfx/player/groundpound2d", x, y)
            event_play_oneshot("event:/music/timesup")
            instance_destroy(obj_fadeout)
        }
        ded = true
        switch global.levelname
        {
            case "medieval":
                trigger_news(string_get("tvmessages/medieval/wait"))
                break
            case "ruin":
                trigger_news(string_get("tvmessages/ruin/uhoh"))
                break
        }

    }
    if (givetime > 0)
    {
        global.escapetime++
        givetime--
    }
    else
    {
        var _sec = 0.016666666666666666
        global.escapetime -= _sec
        pointlosstimer--
        if (pointlosstimer <= 0 && global.collect >= 5 && global.levelname != "dragonslair")
        {
            add_collect(-5)
            instance_create_depth(220, 70, -6, obj_pointloss)
            pointlosstimer = 60
        }
    }
}
else
    pointlosstimer = 60
if global.panic
{
    if ((!obj_music.secret) && global.levelname != "dragonslair")
    {
        camera_set_view_angle(view_camera[0], (round(global.escapetilt) * camangle))
        camera_set_view_angle(view_camera[1], (round(global.escapetilt) * camangle))
        camangle = Approach(camangle, 1, 0.0003)
    }
}
else
{
    camera_set_view_angle(view_camera[0], 0)
    camera_set_view_angle(view_camera[1], 0)
    camangle = 0
}
if (shake_mag > 0)
{
    shake_mag -= shake_mag_acc
    if (shake_mag < 0)
        shake_mag = 0
}
if restarted
    game_restart()
if instance_exists(obj_player)
{
    staticspr = spr_hud_static
    if (global.combo >= global.combomilestone)
    {
        evilhud = 1
        alarm[2] = 120
        global.combomilestone += 5
    }
    idleanim = Approach(idleanim, 300, 1)
    if statichud
    {
        if (floor(staticind) < sprite_get_number(staticspr))
            staticind += 0.35
        if (floor(staticind) >= sprite_get_number(staticspr))
        {
            statichud = 0
            staticind = 0
            switch hudstate
            {
                case "default":
                default:
                    sprite_index = p.spr_newhudidle1
                    image_index = 0
                    break
                case "hurt":
                    sprite_index = p.spr_newhudhurt
                    break
                case "knight":
                    sprite_index = p.spr_newhudknight
                    break
                case "ball":
                    sprite_index = p.spr_newhudball
                    break
                case "happy":
                    sprite_index = p.spr_newhudhappy
                    break
                case "panic":
                    sprite_index = p.spr_newhudpanic
                    break
                case "rage":
                    sprite_index = p.spr_newhudrage
                    break
                case "fireass":
                    sprite_index = p.spr_newhudfireass
                    break
                case "mach3":
                    sprite_index = p.spr_newhudmach3
                    break
                case "mach4":
                    sprite_index = p.spr_newhudmach4
                    break
                case "golf":
                    sprite_index = p.spr_newhudgolf
                    break
                case "evil":
                    sprite_index = p.spr_newhudevil
                    break
                case "bomb":
                    sprite_index = p.spr_newhudbomb
                    break
                case "cheeseball":
                    sprite_index = p.spr_newhudcheeseball
                    break
                case "firemove":
                    sprite_index = p.spr_newhudfiremove
                    break
                case "boxxed":
                    sprite_index = p.spr_newhudboxxed
                    break
                case "strongcoldboss":
                    sprite_index = spr_hud_strongcoldboss
                    break
                case "firemouth":
                    sprite_index = p.spr_newhudfiremouth
                    break
                case "barrel":
                    sprite_index = p.spr_newhudbarrel
                    break
                case "shotgun":
                    sprite_index = p.spr_newhudshotgun
                    break
                case "secret":
                    sprite_index = p.spr_newhudsecret
                    break
                case "scaredjump":
                    sprite_index = p.spr_newhudscaredjump
                    break
                case "sewerjump":
                    sprite_index = spr_peppinohud_sewerjump
                    break
                case "rocket":
                    sprite_index = p.spr_newhudrocket
                    break
                case "weenie":
                    sprite_index = p.spr_newhudweenie
                    break
                case "forknight":
                    sprite_index = spr_hud_forknight
                    break
                case "gerome":
                    sprite_index = spr_hud_gerome
                    break
                case "tutorial":
                    sprite_index = spr_hud_tutorialguy
                    break
                case "tutorialpanic":
                    sprite_index = spr_hud_tutorialguypanic
                    break
                case "custom":
                    sprite_index = spr_customhud
                    break
            }

            image_index = 0
            image_speed = 0.175 * (1 + (image_number > 2))
        }
    }
    if (floor(image_index) == (image_number - 1))
    {
        switch sprite_index
        {
            case spr_hud_start:
                if (!scr_hudroomcheck())
                {
                    if (global.stylethreshold < 2)
                        sprite_index = p.spr_newhudidle1
                    if (global.stylethreshold >= 2)
                        sprite_index = p.spr_newhudrage
                    image_index = 0
                }
                break
            case p.spr_newhudidle1:
                if (idleanim >= 300)
                {
                    sprite_index = choose(p.spr_newhudidle2, p.spr_newhudidle3, p.spr_newhudidle4)
                    idleanim = 0
                }
                image_index = 0
                break
            case p.spr_newhudidle2:
            case p.spr_newhudidle3:
            case p.spr_newhudidle4:
                sprite_index = p.spr_newhudidle1
                image_index = 0
                break
        }

    }
    if (sprite_index == spr_hud_start || sprite_index == spr_hud_static)
        image_speed = 0.35
    if (news != -1 && newshud != -1)
    {
        if (newshud[newsarr] != "" && hudstate != newshud[newsarr])
            scr_hud(newshud[newsarr])
    }
    else
    {
        switch p.state
        {
            case (1 << 0):
                if (sprite_index != p.spr_newhudball && hudstate != "ball")
                    scr_hud("ball")
                break
            case (18 << 0):
            case (13 << 0):
            case (115 << 0):
                if (p.sprite_index != p.spr_knightpepstart && sprite_index != p.spr_newhudknight && hudstate != "knight")
                    scr_hud("knight")
                break
            case (4 << 0):
                if (sprite_index != p.spr_newhudfireass && hudstate != "fireass" && p.sprite_index == p.spr_fireass)
                    scr_hud("fireass")
                else if ((sprite_index != p.spr_newhudscaredjump && hudstate != "scaredjump" && p.sprite_index == p.spr_scaredjump) || p.sprite_index == p.spr_scaredjumpstart)
                    scr_hud("scaredjump")
                else if ((sprite_index != spr_peppinohud_sewerjump && hudstate != "sewerjump" && p.sprite_index == spr_player_sewerjump) || p.sprite_index == spr_player_sewerjumpstart)
                    scr_hud("sewerjump")
                break
            case (19 << 0):
                if (sprite_index != p.spr_newhudbomb && hudstate != "bomb")
                    scr_hud("bomb")
                break
            case (79 << 0):
                if (sprite_index != p.spr_newhudgolf && hudstate != "golf")
                    scr_hud("golf")
                break
            case (8 << 0):
                if (sprite_index != p.spr_newhudcheeseball && hudstate != "cheeseball")
                    scr_hud("cheeseball")
                break
            case (97 << 0):
                if (sprite_index != p.spr_newhudfiremove && hudstate != "firemove")
                    scr_hud("firemove")
                break
            case (11 << 0):
                if (sprite_index != p.spr_newhudboxxed && hudstate != "boxxed")
                    scr_hud("boxxed")
                break
            case (5 << 0):
                if (sprite_index != p.spr_newhudfiremouth && hudstate != "firemouth")
                    scr_hud("firemouth")
                break
            case (105 << 0):
            case (55 << 0):
                if (sprite_index != p.spr_newhudbarrel && hudstate != "barrel")
                    scr_hud("barrel")
                break
            case (24 << 0):
                if (sprite_index != p.spr_newhudshotgun && hudstate != "shotgun")
                    scr_hud("shotgun")
                break
            case (96 << 0):
                if (sprite_index != p.spr_newhudweenie && hudstate != "weenie")
                    scr_hud("weenie")
                break
            case (66 << 0):
            case (12 << 0):
            case (23 << 0):
            case (50 << 0):
            case (34 << 0):
            case (41 << 0):
            default:
                if (p.sprite_index != p.spr_entergate && (happyhud || p.sprite_index == p.spr_levelcomplete || p.state == (34 << 0)))
                {
                    if (sprite_index != p.spr_newhudhappy && hudstate != "happy")
                        scr_hud("happy")
                    break
                }
                else if (hurthud || p.state == (50 << 0))
                {
                    if (sprite_index != p.spr_newhudhurt && hudstate != "hurt")
                        scr_hud("hurt")
                    break
                }
                else if evilhud
                {
                    if (sprite_index != p.spr_newhudevil && hudstate != "evil")
                        scr_hud("evil")
                    break
                }
                else if (!p.rocket)
                {
                    if ((p.movespeed <= 16 && (p.state == (66 << 0) || ((p.state == (12 << 0) || p.state == (23 << 0)) && p.movespeed >= 12))) || p.sprite_index == p.spr_machslideboost3 || p.sprite_index == p.spr_machslideboost3end)
                    {
                        if (sprite_index != p.spr_newhudmach3 && hudstate != "mach3" && p.sprite_index != p.spr_crazyrun)
                            scr_hud("mach3")
                        break
                    }
                    else if (p.movespeed > 16 && (p.state == (66 << 0) || p.state == (12 << 0) || p.state == (23 << 0)))
                    {
                        if (sprite_index != p.spr_newhudmach4 && hudstate != "mach4")
                            scr_hud("mach4")
                        break
                    }
                    else if obj_music.secret
                    {
                        if (sprite_index != p.spr_newhudsecret && hudstate != "secret")
                            scr_hud("secret")
                        break
                    }
                    else if global.miniboss
                    {
                        if (sprite_index != spr_hud_strongcoldboss && hudstate != "strongcoldboss")
                            scr_hud("strongcoldboss")
                        break
                    }
                    else
                        tv_defaulthud()
                }
                else if (p.state == (66 << 0) && p.rocket)
                {
                    if (hudstate != "rocket")
                        scr_hud("rocket")
                    break
                }
                else if obj_music.secret
                {
                    if (sprite_index != p.spr_newhudsecret && hudstate != "secret")
                        scr_hud("secret")
                    break
                }
                else if global.miniboss
                {
                    if (sprite_index != spr_hud_strongcoldboss && hudstate != "strongcoldboss")
                        scr_hud("strongcoldboss")
                    break
                }
                else
                    tv_defaulthud()
        }

    }
}
if obj_music.secret
    tvbgcolor = 10174456
else
{
    var _check = variable_struct_get(tvbgs, global.levelname)
    if (!is_undefined(_check))
        tvbgcolor = _check
}
switch global.levelname
{
    case "entry":
        global.srank = 22500
        global.purplerank = 7020
        global.goldrank = 7800
        global.silverrank = 10200
        break
    case "medieval":
        global.srank = 23300
        global.purplerank = 8640
        global.goldrank = 9600
        global.silverrank = 12000
        break
    case "ruin":
        global.srank = 24300
        global.purplerank = 10080
        global.goldrank = 12000
        global.silverrank = 14400
        break
    case "dungeon":
        global.srank = 24000
        global.purplerank = 10800
        global.goldrank = 13200
        global.silverrank = 14400
        break
    case "dragonslair":
        global.srank = 12500
        global.purplerank = 12060
        global.goldrank = 13800
        global.silverrank = 16200
        break
}

global.arank = global.srank - global.srank / 4
global.brank = global.srank - global.srank / 4 * 2
global.crank = global.srank - global.srank / 4 * 3
xi = 500 + (random_range(1, -1))
if showtext
{
    if (yi > 500)
        yi -= 5
}
if (!showtext)
{
    if (yi < 600)
        yi += 1
}
if instance_exists(obj_player)
{
    if (!((obj_player.state == (18 << 0) && obj_player.state == (13 << 0))))
        once = 0
    var doyshift = (p.y < 200 && (!scr_hudroomcheck()))
    if (doyshift && p.x < 250)
        yshiftl = max((yshiftl - 32), -400)
    else
        yshiftl = min((yshiftl + 32), 0)
    if (doyshift && p.x > (room_width - 250))
        yshiftr = max((yshiftr - 32), -400)
    else
        yshiftr = min((yshiftr + 32), 0)
    function hidden_tile_begin() //hidden_tile_begin
    {
        static u_Player = shader_get_uniform(shd_hiddentile, "u_Player")
        static u_Radius = shader_get_uniform(shd_hiddentile, "u_Radius")
        static u_Blend = shader_get_uniform(shd_hiddentile, "u_Blend")

        if instance_exists(obj_player)
        {
            shader_set(shd_hiddentile)
            shader_set_uniform_f(u_Player, obj_player.x, obj_player.y)
            shader_set_uniform_f(u_Radius, ds_map_find_value(obj_drawcontroller.secretlayers, layer))
            var _c = 1 - obj_drawcontroller.pummelalpha
            shader_set_uniform_f(u_Blend, _c, _c, _c, 1)
        }
    }

    function hidden_tile_inactive() //hidden_tile_inactive
    {
        static u_Blend = shader_get_uniform(shd_hiddentileinactive, "u_Blend")

        if instance_exists(obj_player)
        {
            shader_set(shd_hiddentileinactive)
            var _c = 1 - obj_drawcontroller.pummelalpha
            shader_set_uniform_f(u_Blend, _c, _c, _c, 1)
        }
    }

    function hidden_tile_end()
    {
        if (shader_current() == shd_hiddentile || shader_current() == shd_hiddentileinactive)
            shader_reset();
    }

    var _size = ds_map_size(secretlayers)
    var _key = ds_map_find_first(secretlayers)
    repeat _size
    {
        var _tm = layer_tilemap_get_id(_key)
        with (obj_player)
        {
            var _notempty = (!(tile_get_empty(tilemap_get_at_pixel(_tm, x, y))))
            ds_map_set(other.secretlayers, _key, Approach(ds_map_find_value(other.secretlayers, _key), (_notempty * 960), (960 / (60 / (1 + (!_notempty))))))
        }
        if (ds_map_find_value(secretlayers, _key) > 0)
        {
            layer_script_begin(_key, hidden_tile_begin)
            layer_script_end(_key, hidden_tile_end)
        }
        else
        {
            layer_script_begin(_key, hidden_tile_inactive)
            layer_script_end(_key, hidden_tile_end)
        }
        _key = ds_map_find_next(secretlayers, _key)
    }
}
switch global.stylethreshold
{
    case 0:
        stylecolor = 8446200
        break
    case 1:
        stylecolor = 3705040
        break
    case 2:
        stylecolor = 248
        break
    case 3:
        stylecolor = 16295984
        break
    case 4:
        stylecolor = 16273560
        break
}

if (global.hurtcounter >= global.hurtmilestone)
{
    var _chardir = ""
    if instance_exists(obj_player)
    {
        switch p.character
        {
            case "P":
                _chardir = "characternames/pep"
                break
            case "N":
                _chardir = "characternames/noise"
                break
            case "S":
                _chardir = "characternames/snick"
                break
        }

    }
    thintext = string_get("thintexts/hurtmilestone", _chardir, global.hurtmilestone)
    self.tv_thintext()
    alarm[9] = 180
    global.hurtmilestone += 10
}
thintextalpha = clamp(thintextalpha, 0, 1)
thintextx = get_game_width() / 2 + (random_range(1, -1))
thintexty = get_game_height() - 100
if thintextshow
{
    if (!thintextfade)
        thintextalpha += 0.05
    else
    {
        thintextalpha -= 0.05
        if (thintextalpha <= 0)
            thintextshow = 0
    }
}
if (shaking > 0)
    shaking = Approach(shaking, 0, 0.5)
if (global.combo > 0)
    comboendsound = 1
if (global.combo < 3)
    supertauntalpha = 0.5
else if (global.combo >= 3)
    supertauntalpha = 1
minibosshealth_y = -200
if (comboshake > 0)
    comboshake -= 0.1
if (comboshake < 0)
    comboshake = 0
switch combostate
{
    case 0:
        combobarvsp += 0.5
        combobary += combobarvsp
        if (combobary >= 16)
            combostate = 1
        break
    case 1:
        if (global.combotime < 30)
        {
            combobary += combobarvsp
            if (combobarvsp < 20)
                combobarvsp += 0.5
            if (combobary > 0)
            {
                if (global.combotime < 15)
                    combobarvsp = -2
                else
                    combobarvsp = -1
            }
        }
        else
        {
            combobary = lerp(combobary, 0, 0.05)
            combobarvsp = 0
        }
        break
    case 2:
        combobary = Approach(combobary, -120, 5)
        if (global.combo > 0)
            combostate = 0
        break
}

if (global.combo <= 0)
    combostate = 2
if (global.combo > 0)
{
    if (global.currentbadge == (3 << 0))
        visualcombo = global.combopoints
    else
        visualcombo = global.combo
}
visualprank = (!global.prankattempt)
visualheat = global.stylethreshold
if instance_exists(obj_player)
{
    if (obj_player.state != (87 << 0))
    {
        if (obj_player.hsp != 0)
            barspeed = Approach(barspeed, abs(obj_player.hsp), 1)
        else
            barspeed = max(0, (barspeed - 0.5))
    }
}
hudframe += 0.35
