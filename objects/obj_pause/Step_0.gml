if instance_exists(obj_player)
{
    with (obj_player)
    {
        other.pause_palette = spr_palette
        other.pause_paletteselect = paletteselect
        other.backtohubroom = backtohubroom
        other.pausecharacterspr = spr_pause
    }
    shroomspr = (there_is_follower_obj(obj_pizzakinshroom) ? spr_pausetoppins : spr_pausetoppinsmissing)
    cheesespr = (there_is_follower_obj(obj_pizzakincheese) ? spr_pausetoppins : spr_pausetoppinsmissing)
    tomatospr = (there_is_follower_obj(obj_pizzakintomato) ? spr_pausetoppins : spr_pausetoppinsmissing)
    sausagespr = (there_is_follower_obj(obj_pizzakinsausage) ? spr_pausetoppins : spr_pausetoppinsmissing)
    pineapplespr = (there_is_follower_obj(obj_pizzakinpineapple) ? spr_pausetoppins : spr_pausetoppinsmissing)
    currentbadge = global.currentbadge
    secrets = global.secretfound
    treasure = global.treasure
}
prank = global.prank
srank = global.srank
arank = global.arank
brank = global.brank
crank = global.crank
panic = global.panic
pause_collect = global.collect
inhub = asset_has_tags(room, "Goto Titlescreen", 3)
bgxspd += 0.3
bgyspd += 0.3
pause_portraitX = lerp(pause_portraitX, ((-get_game_width()) * (!pause)), 0.2)
pause_portraitY = lerp(pause_portraitY, ((-get_game_height()) * (!pause)), 0.2)
pause_toppinsX = lerp(pause_toppinsX, ((-get_game_width()) * (!pause)), 0.2)
pause_toppinsY = lerp(pause_toppinsY, (get_game_height() * (!pause)), 0.2)
pause_pizzascoreX = lerp(pause_pizzascoreX, (get_game_width() * (!pause)), 0.2)
pause_pizzascoreY = lerp(pause_pizzascoreY, (get_game_height() * (!pause)), 0.2)
pause_textX = lerp(pause_textX, (get_game_width() * (!pause)), 0.2)
pause_textY = lerp(pause_textY, ((-get_game_height()) * (!pause)), 0.2)
pausealpha = Approach(pausealpha, (0.5 * pause), 0.1)
input_vibrate_set_pause(pause)
if pause
{
    if ((!instance_exists(obj_optionsmenu)) && (!instance_exists(obj_cowboytasks)))
    {
        var move = input_check_opposing_pressed("up", "down")
        if (move != 0 && (selected + move) < 5 && (selected + move) > -1)
            event_play_oneshot("event:/sfx/pausemenu/move")
        selected = clamp((selected + move), 0, 4)
        if input_check_pressed("jump")
        {
            switch selected
            {
                case 0:
                    scr_pause_activate_objects()
                    pause_unpause_music()
                    event_stop(pausemusicID, true)
                    break
                case 1:
                    instance_create_depth(x, y, -9999, obj_optionsmenu)
                    break
                case 2:
                    var gotoroom = -1
                    switch global.levelname
                    {
                        case "tutorial":
                            gotoroom = newtutorial_1
                            break
                        case "entry":
                            gotoroom = entry_1
                            break
                        case "medieval":
                            gotoroom = medieval_1
                            break
                        case "ruin":
                            gotoroom = ruin_1
                            break
                        case "dungeon":
                            gotoroom = dungeon_1
                            break
                        case "dragonslair":
                            gotoroom = dragonslair_1
                            break
                        case "kungfu":
                            gotoroom = kungfu_1
                            break
                        case "abandoned":
                            gotoroom = abandonedtutorial_1
                            break
                        case "golf":
                            gotoroom = golf_1
                            break
                        case "factory":
                            gotoroom = factory_1
                            break
                        case "sewer":
                            gotoroom = sewer_1
                            break
                        default:
                            event_play_oneshot("event:/sfx/pausemenu/buzzer")
                    }

                    if (gotoroom != -1)
                    {
                        pause_unpause_music()
                        scr_pause_stop_sounds()
                        scr_pause_activate_objects()
                        instance_destroy(obj_fadeparent)
                        room_goto(gotoroom)
                        stop_music()
                        scr_playerreset(0)
                        if (global.levelname == "tutorial")
                        {
                            with (obj_player)
                            {
                                targetDoor = "A"
                                state = (88 << 0)
                                sprite_index = spr_rockethitwall
                            }
                        }
                        else
                        {
                            with (obj_player)
                            {
                                targetDoor = "A"
                                state = (54 << 0)
                            }
                            with (obj_drawcontroller)
                            {
                                sprite_index = spr_hud_start
                                image_index = 0
                            }
                        }
                    }
                    break
                case 3:
                    if (global.levelname != -4 && global.levelname != "tutorial")
                    {
                        instance_create_depth(x, y, -9999, obj_cowboytasks)
                        event_play_oneshot("event:/sfx/pausemenu/impact")
                    }
                    else
                        event_play_oneshot("event:/sfx/pausemenu/buzzer")
                    break
                case 4:
                    if (!(asset_has_tags(room, "Goto Titlescreen", 3)))
                    {
                        if (backtohubroom != TitlescreenRoom)
                        {
                            pause_unpause_music()
                            scr_pause_stop_sounds()
                            scr_pause_activate_objects()
                            instance_destroy(obj_fadeparent)
                            event_stop(pausemusicID, true)
                            stop_music()
                            scr_playerreset(0)
                            scr_leavelevel()
                            save_dump()
                            global.miniboss = 0
                            with (obj_player)
                            {
                                x = 0
                                y = 0
                                sprite_index = spr_slipbanan2
                                hsp = 0
                                movespeed = 0
                                state = (110 << 0)
                                room_goto(backtohubroom)
                                targetDoor = "HUB"
                            }
                            hubeject = true
                            with (obj_drawcontroller)
                            {
                                sprite_index = spr_hud_start
                                image_index = 0
                            }
                            break
                        }
                        else
                        {
                            if (room != TitlescreenRoom)
                            {
                                pause_unpause_music()
                                scr_pause_activate_objects()
                                instance_destroy(obj_fadeparent)
                                scr_pause_stop_sounds()
                                with (obj_cowboyhat)
                                    persistent = false
                                room_goto(TitlescreenRoom)
                                with (obj_player)
                                {
                                    character = "P"
                                    scr_characterspr()
                                    paletteselect = 1
                                    titlescreenstart = 0
                                }
                                global.timetrial = false
                                stop_music()
                                scr_playerreset(0)
                                save_clear()
                                scr_leavelevel()
                                obj_player.state = (6 << 0)
                                obj_player.sprite_index = spr_player_title
                                obj_player.targetDoor = "A"
                            }
                            else
                                event_play_oneshot("event:/sfx/enemy/projectile")
                            break
                        }
                    }
                    else
                    {
                        if (room != TitlescreenRoom)
                        {
                            pause_unpause_music()
                            scr_pause_activate_objects()
                            instance_destroy(obj_fadeparent)
                            scr_pause_stop_sounds()
                            with (obj_cowboyhat)
                                persistent = false
                            room_goto(TitlescreenRoom)
                            with (obj_player)
                            {
                                character = "P"
                                scr_characterspr()
                                paletteselect = 1
                                titlescreenstart = 0
                            }
                            global.timetrial = false
                            stop_music()
                            scr_playerreset(0)
                            save_clear()
                            scr_leavelevel()
                            obj_player.state = (6 << 0)
                            obj_player.sprite_index = spr_player_title
                            obj_player.targetDoor = "A"
                        }
                        else
                            event_play_oneshot("event:/sfx/enemy/projectile")
                        break
                    }
                case 5:
                    if (room != TitlescreenRoom)
                    {
                        pause_unpause_music()
                        scr_pause_activate_objects()
                        instance_destroy(obj_fadeparent)
                        scr_pause_stop_sounds()
                        with (obj_cowboyhat)
                            persistent = false
                        room_goto(TitlescreenRoom)
                        with (obj_player)
                        {
                            character = "P"
                            scr_characterspr()
                            paletteselect = 1
                            titlescreenstart = 0
                        }
                        global.timetrial = false
                        stop_music()
                        scr_playerreset(0)
                        save_clear()
                        scr_leavelevel()
                        obj_player.state = (6 << 0)
                        obj_player.sprite_index = spr_player_title
                        obj_player.targetDoor = "A"
                    }
                    else
                        event_play_oneshot("event:/sfx/enemy/projectile")
                    break
            }

        }
    }
}
