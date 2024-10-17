if (scene == 1 && floor(image_index) == (image_number - 1))
{
    scene = 2
    peppino = spr_intro_snicksoftmap
    background = spr_intro_sky
    tower = spr_intro_snicksoft
    alarm[1] = 480
    alarm[2] = 80
    event_stop(global.windloop, false)
}
switch scene
{
    case 1:
        peppinoshakeX = random_range(3, -3)
        peppinoshakeY = random_range(3, -3)
        peppino = spr_intro_peppinosnicksoft1
        background = spr_intro_grass
        tower = spr_intro_snicksoftshadow
        if (floor(image_index) >= 22 && (!playedpocketsound))
        {
            playedpocketsound = true
            event_play_oneshot("event:/sfx/misc/intropocket")
        }
        if (floor(image_index) >= 25 && (!playedpulloutsound))
        {
            playedpulloutsound = true
            event_play_oneshot("event:/sfx/misc/intropaper")
        }
        break
    case 2:
        pan += 0.01
        if (pan > 1)
            pan = 1
        if (pan >= 0 && (!playedmusic))
        {
            event_play_oneshot("event:/music/intromusic")
            playedmusic = true
        }
        cloudsX += 0.1
        peppinoshakeX = 0
        peppinoshakeY = 0
        peppino = spr_intro_snicksoftmap
        background = spr_intro_sky
        tower = spr_intro_snicksoft
        break
}

sprite_index = peppino
