bomb = false
with (obj_bomb)
{
    if (spawner == other.id)
        bomb = true
}
if ((!instance_exists(spawnedobject)) && (!((content == obj_bomb && (bomb || (obj_player.state == (19 << 0) && obj_player.bombspawnerid == id))))))
    cooldown--
if (cooldown <= 0 && sprite_index != spr_baddiespawnerspit)
{
    sprite_index = spr_baddiespawnerspit
    image_index = 0
}
if (sprite_index == spr_baddiespawnerspit)
{
    if (floor(image_index) == 4 && cooldown <= 0)
    {
        scr_fmod_soundeffectONESHOT("event:/sfx/misc/baddiespawnerspit", x, y)
        with (instance_create_depth((x + 32 * sign(image_xscale)), (y - 46), 0, content))
        {
            vsp = -5
            other.spawnedobject = id
            important = true
            if (other.content == obj_bomb)
                spawner = other.id
            image_xscale = other.image_xscale
        }
        cooldown = 100
    }
    if (floor(image_index) == (image_number - 1))
        sprite_index = spr_baddiespawneridle
}
