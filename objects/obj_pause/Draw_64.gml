if pause
{
    if ((!instance_exists(obj_optionsmenu)) && (!instance_exists(obj_cowboytasks)))
    {
        draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, camera_get_view_width(view_camera[1]), camera_get_view_height(view_camera[1]), c_white, pausealpha)
        var _yoff = (get_game_height() - 540) / 2
        var _x = pause_pizzascoreX
        var _y = _yoff + pause_pizzascoreY
        draw_sprite(spr_pausethinkbubble, -1, _x, _y)
        draw_set_font(global.font)
        draw_set_halign(fa_center)
        draw_set_valign(fa_top)
        draw_set_color(c_white)
        var _textX = _x + 704
        var _textY = _y + 90
        var _strings = [string_get("menu/pause/resume"), string_get("menu/pause/options"), string_get("menu/pause/retry"), string_get("menu/pause/tasks"), string_get(((!inhub) ? "menu/pause/exitlevel" : "menu/pause/exittitle"))]
        for (var i = 0; i < array_length(_strings); i++)
        {
            var _textalpha = 1
            if (i == 2)
                _textalpha = 1 - 0.75 * inhub
            if (i == 3)
                _textalpha = 1 - 0.75 * (global.levelname == -4 || global.levelname == "tutorial")
            draw_text_color(_textX, floor(_textY + 310 * i / (array_length(_strings) - 1)), _strings[i], c_white, c_white, c_white, c_white, _textalpha)
        }
        cursorx = lerp(cursorx, (704 - string_width(_strings[selected]) / 2 - 60), 0.2)
        cursory = lerp(cursory, (105 + 310 * selected / (array_length(_strings) - 1)), 0.2)
        draw_sprite(spr_pausecursor, -1, floor(_x + cursorx), floor(_y + cursory))
        var _badgespr = spr_badge_none
        draw_set_font(global.thinfont)
        draw_set_color(c_white)
        draw_set_halign(fa_left)
        __draw_text_hook((_x + 144), (_y + 96), string_get("menu/pause/badge"))
        switch currentbadge
        {
            case (0 << 0):
                _badgespr = spr_badge_none
                break
            case (1 << 0):
                _badgespr = spr_badge_kungfu
                break
            case (2 << 0):
                _badgespr = spr_badge_breakdance
                break
            case (3 << 0):
                _badgespr = spr_badge_nohit
                break
        }

        draw_sprite(_badgespr, -1, (_x + 101), (_y + 106))
        draw_set_color(c_white)
        draw_set_alpha(1 - 0.75 * inhub)
        draw_sprite((secrets >= 1 ? spr_pausesecreteye_open : spr_pausesecreteye_closed), -1, (_x + 99), (_y + 202))
        draw_sprite((secrets >= 2 ? spr_pausesecreteye_open : spr_pausesecreteye_closed), -1, (_x + 188), (_y + 202))
        draw_sprite((secrets >= 3 ? spr_pausesecreteye_open : spr_pausesecreteye_closed), -1, (_x + 280), (_y + 202))
        draw_sprite_ext(shroomspr, 0, _x, _y, 1, 1, 0, c_white, 1)
        draw_sprite_ext(cheesespr, 1, _x, _y, 1, 1, 0, c_white, 1)
        draw_sprite_ext(tomatospr, 2, _x, _y, 1, 1, 0, c_white, 1)
        draw_sprite_ext(sausagespr, 3, _x, _y, 1, 1, 0, c_white, 1)
        draw_sprite_ext(pineapplespr, 4, _x, _y, 1, 1, 0, c_white, 1)
        draw_sprite(spr_treasurestand, -1, (_x + 432), (_y + 113))
        var _treasureind = 0
        switch global.levelname
        {
            case -4:
                break
            case "entry":
                _treasureind = 0
                break
            case "medieval":
                _treasureind = 1
                break
            case "ruin":
                _treasureind = 2
                break
            case "dungeon":
                _treasureind = 3
                break
            case "dragonslair":
                _treasureind = 4
                break
            default:

        }

        if treasure
            draw_sprite(spr_treasure, _treasureind, (_x + 415), (_y + 80 + (wave(-3, 3, 2, 0))))
        draw_set_alpha(1)
        pal_swap_set(pause_palette, pause_paletteselect, 0)
        draw_sprite(pausecharacterspr, -1, pause_portraitX, get_game_height())
        shader_reset()
        draw_set_color(c_white)
    }
}
