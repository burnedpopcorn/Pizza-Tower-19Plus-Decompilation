if instance_exists(obj_player)
{
    var p = obj_player
    if ((!scr_hudroomcheck()) && obj_player.state != (33 << 0))
    {
        var _tutorial = global.levelname == "tutorial"
        if global.miniboss
        {
            draw_set_font(global.smallfont)
            draw_set_halign(fa_center)
            draw_sprite(spr_minibosshealth, -1, 702, 72)
            __draw_text_colour_hook(704, 80, string_hash_to_newline(global.boxhp), 16777215, 16777215, 16777215, 16777215, alpha)
        }
        if ((!_tutorial) || scorehudvisible)
        {
            if (!global.timetrial)
            {
                var shakex = shaking * scoreshakedir
                var shakey = 0
                shader_set(shd_premultiply)
                draw_sprite_ext(scorehudspr, 0, (collectHUDX + shakex), (yshiftl + collectHUDY + shakey), 1, 1, 0, c_white, alpha)
                if (!_tutorial)
                {
                    if (global.collect >= global.crank)
                        draw_sprite_ext(scorehudspr_C, 0, (collectHUDX + shakex), (yshiftl + collectHUDY + shakey), 1, 1, 0, c_white, alpha)
                    if (global.collect >= global.brank)
                        draw_sprite_ext(scorehudspr_B, 0, (collectHUDX + shakex), (yshiftl + collectHUDY + shakey), 1, 1, 0, c_white, alpha)
                    if (global.collect >= global.arank)
                        draw_sprite_ext(scorehudspr_A, 0, (collectHUDX + shakex), (yshiftl + collectHUDY + shakey), 1, 1, 0, c_white, alpha)
                    if (global.collect >= global.srank)
                        draw_sprite_ext(scorehudspr_S, 0, (collectHUDX + shakex), (yshiftl + collectHUDY + shakey), 1, 1, 0, c_white, alpha)
                }
                draw_set_font(global.collectfont)
                draw_set_halign(fa_center)
                var _sc = global.collect
                with (obj_collectparticle)
                    _sc -= value
                _sc = max(_sc, 0)
                var _scstr = string(_sc)
                for (var i = 0; i < string_length(_scstr); i++)
                {
                    var digit = real(string_char_at(_scstr, (i + 1)))
                    if (_sc != prevcollect)
                    {
                        if (array_get_undefined(collectcolor, i) == undefined)
                            collectcolor[i] = irandom_range(1, 4)
                        if (array_get_undefined(scorey, i) == undefined)
                            scorey[i] = 0
                        if (array_get_undefined(scorebounce, i) == undefined)
                            scorebounce[i] = 0
                        if (prevcollect != -1 && string_char_at(_scstr, (i + 1)) != string_char_at(string(prevcollect), (i + 1)))
                        {
                            collectcolor[i] = irandom_range(1, 4)
                            scorey[i] = 0
                            scorebounce[i] = -4
                        }
                    }
                    scorebounce[i] += 0.5
                    scorey[i] += scorebounce[i]
                    scorey[i] = min(0, scorey[i])
                    if global.scorecolours
                        pal_swap_set(scorefontpalette, collectcolor[i], 0)
                    draw_sprite_ext(spr_font_collectshadow, digit, (collectHUDX + 40 * (i - string_length(string(_sc)) / 2) + shakex), (yshiftl + numberY + shakey), 1, 1, 0, c_white, alpha)
                    draw_sprite_ext(spr_font_collect, digit, (collectHUDX + 40 * (i - string_length(string(_sc)) / 2) + shakex), (yshiftl + numberY + shakey + floor(scorey[i])), 1, 1, 0, c_white, alpha)
                    shader_set(shd_premultiply)
                }
                if (!_tutorial)
                {
                    var _score = global.collect
                    var rx = collectHUDX + 142
                    var ry = yshiftl + collectHUDY - 22
                    var rank_ix = (0 << 0)
                    if (_score >= global.srank && (global.prank || (instance_exists(obj_endlevelfade) && global.rank == (5 << 0))))
                        rank_ix = (5 << 0)
                    else if (_score >= global.srank)
                        rank_ix = (4 << 0)
                    else if (_score >= global.arank)
                        rank_ix = (3 << 0)
                    else if (_score >= global.brank)
                        rank_ix = (2 << 0)
                    else if (_score >= global.crank)
                        rank_ix = (1 << 0)
                    if (previousrank != rank_ix)
                    {
                        previousrank = rank_ix
                        rank_scale = 3
                    }
                    rank_scale = Approach(rank_scale, 1, 0.2)
                    var spr_w = sprite_get_width(spr_rankfill)
                    var spr_h = sprite_get_height(spr_rankfill)
                    var spr_xo = sprite_get_xoffset(spr_rankfill)
                    var spr_yo = sprite_get_yoffset(spr_rankfill)
                    var perc = 0
                    switch rank_ix
                    {
                        case (5 << 0):
                        case (4 << 0):
                            perc = 1
                            break
                        case (3 << 0):
                            perc = (_score - global.arank) / (global.srank - global.arank)
                            break
                        case (2 << 0):
                            perc = (_score - global.brank) / (global.arank - global.brank)
                            break
                        case (1 << 0):
                            perc = (_score - global.crank) / (global.brank - global.crank)
                            break
                        default:
                            perc = _score / global.crank
                    }

                    var t = spr_h * perc
                    var top = spr_h - t
                    draw_sprite_ext(spr_rank, rank_ix, rx, ry, rank_scale, rank_scale, 0, c_white, alpha)
                    draw_sprite_part_ext(spr_rankfill, rank_ix, 0, top, spr_w, (spr_h - top), (rx - spr_xo * rank_scale), (ry + top * rank_scale - spr_yo * rank_scale), rank_scale, rank_scale, c_white, alpha)
                }
                prevcollect = _sc
            }
            else
            {
                var _dialx = floor((clamp(barspeed, 0, 20)) / 20 * 185 - 92)
                var _shakeamt = floor((max(0, _dialx)) / 13)
                var _shakex = irandom_range((-_shakeamt), _shakeamt)
                var _shakey = irandom_range((-_shakeamt), _shakeamt)
                if (_dialx > 92 && (!barcracked))
                {
                    barcracked = true
                    event_play_oneshot("event:/sfx/misc/speedbarbreak")
                }
                draw_sprite_ext(spr_speedbar_back, 0, (collectHUDX + _shakex), (yshiftl + collectHUDY + _shakey - 13), 1, 1, 0, c_white, alpha)
                draw_sprite_ext(spr_speedbar_dial, 0, (collectHUDX + _shakex + _dialx), (yshiftl + collectHUDY + _shakey - 13), 1, 1, 0, c_white, alpha)
                draw_sprite_ext(spr_speedbar_front, barcracked, (collectHUDX + _shakex), (yshiftl + collectHUDY + _shakey - 13), 1, 1, 0, c_white, alpha)
                var _time = global.timetrialtick
                rx = collectHUDX + 142
                ry = yshiftl + collectHUDY - 22
                rank_ix = (0 << 0)
                if (global.timetrialtick <= global.purplerank)
                    rank_ix = (3 << 0)
                else if (global.timetrialtick <= global.goldrank)
                    rank_ix = (2 << 0)
                else if (global.timetrialtick <= global.silverrank)
                    rank_ix = (1 << 0)
                else
                    rank_ix = (0 << 0)
                if (previousrank != rank_ix)
                {
                    previousrank = rank_ix
                    rank_scale = 3
                }
                rank_scale = Approach(rank_scale, 1, 0.2)
                spr_w = sprite_get_width(spr_trialranks)
                spr_h = sprite_get_height(spr_trialranks)
                spr_xo = sprite_get_xoffset(spr_trialranks)
                spr_yo = sprite_get_yoffset(spr_trialranks)
                perc = 0
                var _iconind = rank_ix
                switch rank_ix
                {
                    case (3 << 0):
                        perc = (abs(global.timetrialtick - global.purplerank)) / global.purplerank
                        break
                    case (2 << 0):
                        perc = (abs(global.timetrialtick - global.goldrank)) / (global.goldrank - global.purplerank)
                        break
                    case (1 << 0):
                        perc = (abs(global.timetrialtick - global.silverrank)) / (global.silverrank - global.goldrank)
                        break
                    case (0 << 0):
                        perc = 1
                        break
                }

                t = spr_h * perc
                top = spr_h - t
                draw_sprite_ext(spr_trialranksfill, rank_ix, rx, ry, rank_scale, rank_scale, 0, c_white, alpha)
                draw_sprite_part_ext(spr_trialranks, _iconind, 0, top, spr_w, (spr_h - top), (rx - spr_xo * rank_scale), (ry + top * rank_scale - spr_yo * rank_scale), rank_scale, rank_scale, c_white, alpha)
            }
        }
        showcombo = 1
        comboresult = global.combo
        if (!_tutorial)
        {
            if (global.currentbadge == (3 << 0))
            {
                var combox = tvX + (wave((-2 + 8 * (min(1, (combobary / -120)))), 6, 2, 0))
                var comboy = tvY + yshiftr + 120 + combobary
                var _combogalspr = spr_nohitcombo_combogal
                var _spr = asset_get_index(string_concat("spr_nohitcombo_combogalheat", (visualheat - 1)))
                if sprite_exists(_spr)
                    _combogalspr = _spr
                comboguyind += (0.35 % sprite_get_number(_combogalspr))
                combobubbleind += (0.35 % sprite_get_number(spr_nohitcombo_bubble))
                var _boardw = sprite_get_width(spr_nohitcombo_board)
                var _boardh = sprite_get_height(spr_nohitcombo_board)
                var _boardt = (-(min(0, combobary)))
                var _boardx = round(combox) - sprite_get_xoffset(spr_nohitcombo_board)
                var _boardy = round(comboy) - sprite_get_yoffset(spr_nohitcombo_board) + _boardt
                draw_sprite_part_ext(spr_nohitcombo_board, 0, 0, _boardt, _boardw, (_boardh - _boardt), _boardx, _boardy, 1, 1, c_white, alpha)
                draw_sprite_ext(_combogalspr, comboguyind, round(combox), round(comboy), 1, 1, 0, c_white, alpha)
                draw_sprite_ext(spr_nohitcombo_bubble, combobubbleind, round(combox), round(comboy), 1, 1, 0, c_white, alpha)
                draw_set_font(global.nohitfont)
                draw_set_halign(fa_center)
                draw_set_valign(fa_top)
                var combonumbx = combox - 59
                var combonumby = comboy - 24
                var shakeyshakey = comboshake * 3
                var _text = visualcombo
                var _f = ""
                if (visualcombo > 1000000000)
                {
                    _text /= 1000000000
                    _f = "b"
                }
                else if (visualcombo > 1000000)
                {
                    _text /= 1000000
                    _f = "m"
                }
                else if (visualcombo > 1000)
                {
                    _text /= 1000
                    _f = "k"
                }
                var _frac = floor(frac(_text) * 10)
                _text = floor(_text)
                if (_frac > 0)
                    _text = string("{0}.{1}{2}", _text, _frac, _f)
                else
                    _text = string("{0}{1}", _text, _f)
                pal_swap_set(spr_nohitcombo_fontpal, visualprank, 0)
                __draw_text_colour_hook(round(combonumbx + (random_range((-shakeyshakey), shakeyshakey))), round(combonumby), _text, 16777215, 16777215, 16777215, 16777215, alpha)
                pal_swap_reset()
            }
            else
            {
                pal_swap_set(spr_combobar_palette, (visualheat * 2 + 1 + visualprank), 0)
                combox = tvX + (wave((-2 + 8 * (min(1, (combobary / -120)))), 6, 2, 0))
                comboy = tvY + yshiftr + 120 + combobary
                comboguypos = lerp(comboguypos, (combox + global.combotime / 60 * 123 - 61), 0.5)
                comboguyind += (0.35 % sprite_get_number(spr_comboguy))
                var _comboguyspr = spr_comboguy
                _spr = asset_get_index(string_concat("spr_comboguyheat", visualheat))
                if sprite_exists(_spr)
                    _comboguyspr = _spr
                draw_sprite_ext(_comboguyspr, comboguyind, round(comboguypos), round(comboy - 3), 1, 1, 0, c_white, alpha)
                var _barw = sprite_get_width(spr_combobar)
                var _barh = sprite_get_height(spr_combobar)
                var _bart = lerp(0, 63, ((min(0, combobary)) / -120))
                var _barx = round(combox) - sprite_get_xoffset(spr_combobar)
                var _bary = round(comboy) - sprite_get_yoffset(spr_combobar) + _bart
                draw_sprite_part_ext(spr_combobar, 0, 0, _bart, _barw, (_barh - _bart), _barx, _bary, 1, 1, c_white, alpha)
                combonumbx = combox - 64
                combonumby = comboy - 12
                shakeyshakey = comboshake * 3
                for (i = string_length(string(visualcombo)); i > 0; i--)
                {
                    var _num = real(string_char_at(visualcombo, i))
                    draw_sprite_ext(spr_combobarfont, _num, round(combonumbx + (random_range((-shakeyshakey), shakeyshakey))), round(combonumby + (random_range((-shakeyshakey), shakeyshakey))), 1, 1, 0, c_white, alpha)
                    combonumbx -= 22
                    combonumby -= 8
                }
                pal_swap_reset()
            }
        }
        var _yoff = 0
        var _tutorialanimcheck = (_tutorial && (!((tutorialintroanimbounce && tutorialintroanim >= 0 && tutorialintroanimvsp >= 0))))
        if _tutorialanimcheck
        {
            if tutorialdrop
            {
                sprite_index = spr_hud_off
                staticind = 0
                tutorialintroanim += tutorialintroanimvsp
                if (tutorialintroanimvsp < 20)
                    tutorialintroanimvsp += 0.5
                if (tutorialintroanim >= 0)
                {
                    if (!tutorialintroanimbounce)
                    {
                        tutorialintroanim = 0
                        tutorialintroanimvsp = -4
                        tutorialintroanimbounce = true
                        event_play_oneshot("event:/sfx/misc/tvland")
                    }
                    else
                    {
                        tutorialintroanim = 0
                        tutorialintroanimvsp = 0
                    }
                }
            }
            _yoff = tutorialintroanim
        }
        draw_sprite_ext(spr_peppinohud_bg, -1, tvX, (tvY + yshiftr + _yoff), 1, 1, 0, tvbgcolor, alpha)
        input_color_set(tvbgcolor)
        pal_swap_set(p.spr_palette, p.paletteselect, 0)
        if (obj_drawcontroller.dark && sprite_index != spr_hud_start && image_number > 2)
            draw_sprite_ext(sprite_index, image_index, tvX, (tvY + yshiftr + _yoff), 1, 1, 0, make_colour_hsv(0, 0, ((1 - obj_player.darkalpha) * 255)), alpha)
        else
            draw_sprite_ext(sprite_index, image_index, tvX, (tvY + yshiftr + _yoff), 1, 1, 0, image_blend, alpha)
        shader_set(shd_premultiply)
        if (statichud && (!_tutorialanimcheck))
            draw_sprite_ext(staticspr, staticind, tvX, (tvY + yshiftr + _yoff), 1, 1, 0, image_blend, alpha)
        if (sprite_index != spr_hud_start)
            draw_sprite_ext(spr_customhud, image_index, tvX, (tvY + yshiftr + _yoff), 1, 1, 0, image_blend, alpha)
        shader_set(shd_premultiply)
        if (sprite_index != spr_hud_start && news != -1 && newspopup >= 0 && (!_tutorialanimcheck))
        {
            if (!surface_exists(newssurf))
                newssurf = surface_create(320, 32)
            surface_set_target(newssurf)
            draw_clear_alpha(c_black, 0)
            draw_set_valign(fa_middle)
            draw_set_halign(fa_left)
            draw_set_font(font_tvtext)
            draw_text_fancy((352 - newsscrl), 16, news[newsarr], 0, alpha)
            surface_reset_target()
            if (newsscrl >= (352 + string_width_fancy(news[newsarr])))
            {
                if surface_exists(newssurf)
                    surface_free(newssurf)
                newspopup = -7
            }
            else
            {
                var bubblespr = spr_tv_bubble
                if (newspopup <= 7)
                {
                    bubblespr = spr_tv_bubbleopen
                    if (!tvplayedstart)
                    {
                        event_play_oneshot("event:/sfx/misc/tvmessageon")
                        tvplayedstart = true
                    }
                }
                else
                    tvplayedstart = false
                draw_sprite_ext(bubblespr, floor(newspopup), 528, (51 + yshiftr), 1, 1, 0, c_white, (alpha * global.tvtextalpha))
                draw_surface_ext(newssurf, 352, (32 + yshiftr), 1, 1, 0, c_white, alpha)
                newsscrl += global.tvscrollspd
                newspopup += 0.35
            }
        }
        else
            tvplayedstart = false
        if (newspopup < 0)
        {
            if (!tvplayedend)
            {
                event_play_oneshot("event:/sfx/misc/tvmessageoff")
                tvplayedend = true
            }
            draw_sprite_ext(spr_tv_bubbleclose, floor(newspopup + 7), 528, (51 + yshiftr), 1, 1, 0, c_white, (alpha * global.tvtextalpha))
            newspopup = min((newspopup + 0.35), 0)
            if (newspopup == 0)
            {
                if (++newsarr != array_length(news))
                    newsscrl = 0
                else
                    news = -1
            }
        }
        else
            tvplayedend = false
        if (!_tutorial)
        {
            if (global.panic || global.miniboss)
            {
                escapetimerind += (0.35 % sprite_get_number(spr_timertv))
                draw_sprite_ext(spr_timertv, escapetimerind, 480, (get_game_height() + escapetimery), 1, 1, 0, c_white, 0.7)
                draw_set_font(global.font)
                draw_set_halign(fa_center)
                draw_set_valign(fa_top)
                var c = 16777215
                if (global.escapetime < 10)
                    c = 255
                var m = ceil(global.escapetime) div 60
                var s = string(ceil(global.escapetime) % 60)
                if (s < 10)
                    s = "0" + s
                __draw_text_colour_hook(((random_range(1, -1)) + 480), ((random_range(1, -1)) + get_game_height() + escapetimery + 30 * isnewhud), string("{0}:{1}", m, s), c, c, c, c, alpha)
            }
        }
    }
    draw_set_font(global.speedruntimerfont)
    draw_set_halign(fa_right)
    draw_set_valign(fa_bottom)
    var _milliseconds = string_padzeros(floor((((global.timer / 60) % 60) % 1) * 100))
    var _seconds = string_padzeros(floor((global.timer / 60) % 60))
    var _minutes = string_padzeros(((global.timer div 60) div 60) % 60)
    var _hours = string_padzeros(((global.timer div 60) div 60) div 60)
    var _filemilliseconds = string_padzeros(floor((((global.savetime / 60) % 60) % 1) * 100))
    var _fileseconds = string_padzeros(floor((global.savetime / 60) % 60))
    var _fileminutes = string_padzeros(((global.savetime div 60) div 60) % 60)
    var _filehours = string_padzeros(((global.savetime div 60) div 60) div 60)
    var _string = ""
    if (!(asset_has_tags(room, "No Save Timer", 3)))
    {
        if (global.timertype == 2 || global.timertype == 3)
            _string += string("{0}:{1}:{2}.{3}", _filehours, _fileminutes, _fileseconds, _filemilliseconds)
        if (global.timertype == 3)
            _string += "\n"
        if ((global.timertype == 1 && ((!(asset_has_tags(room, "No Timer", 3))) || room == rank_room || room == rank_roomtutorial)) || global.timertype == 3)
            _string += string("{0}:{1}:{2}.{3}", _hours, _minutes, _seconds, _milliseconds)
    }
    __draw_text_hook((get_game_width() - 8), (get_game_height() - 8), _string)
    draw_set_font(global.thinfont)
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    draw_text_fancy(thintextx, (thintexty + 16), thintext, 16777215, thintextalpha)
}
with (obj_giantfireball)
{
    if (!move)
    {
        var camx = camera_get_view_x(view_camera[1])
        var camy = camera_get_view_y(view_camera[1])
        if (!(bbox_in_camera(view_camera[1], obj_cheesedragon)))
        {
            var _ind = round((current_time / 300) % 1)
            draw_sprite(spr_dragonfireball_warning, _ind, clamp((obj_cheesedragon.x - camx), 50, (get_game_width() - 50)), clamp((obj_cheesedragon.y - camy), 50, (get_game_height() - 50)))
        }
    }
}
