if (room == rank_room || room == rank_roomtutorial)
{
    sprite_index = spr_pizzaface_dead
    alarm[0] = 50
    scr_fmod_soundeffectONESHOT("event:/sfx/enemy/punched", x, y)
    errors += "\nERROR!: Can't find sprite ref 526"
}
else
    image_alpha = 0
