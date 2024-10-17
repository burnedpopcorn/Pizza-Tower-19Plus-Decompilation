if (grounded && other.sprite_index == spr_swordstone && (is_player_grabbing() || (character == "S" && state == (0 << 0))))
{
    scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/knightsword", x, y)
    momemtum = 0
    movespeed = 0
    other.image_index = 1
    image_index = 0
    image_speed = 0.35
    sprite_index = spr_knightpepstart
    state = (18 << 0)
    hsp = 0
    knightsliding = 0
    switch other.swordtype
    {
        case (0 << 0):
            knightspr = (0 << 0)
            break
        case (1 << 0):
            knightspr = (1 << 0)
            break
        case (2 << 0):
            knightspr = (2 << 0)
            break
    }

    restore_combo()
}
