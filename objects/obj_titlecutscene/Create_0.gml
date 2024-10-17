image_speed = 0.35
hsp = 0
vsp = 0
grav = 0.5
drop = 0
move = 0
state = 0
xspeed = 0
alarm[0] = 25
speeding = 0
bg1 = layer_get_id("cloud")
bg2 = layer_get_id("Backgrounds_sky1")
bg3 = layer_get_id("Backgrounds_sky4")
bg4 = layer_get_id("rocks")
bg5 = layer_get_id("water")
bgspd = -20
taxihonksnd = event_instance("event:/sfx/misc/taxihonk")
taxidrivesnd = event_instance("event:/sfx/misc/taxidrive")
fmod_studio_event_instance_start(taxihonksnd)
fmod_studio_event_instance_start(taxidrivesnd)
if (obj_player.character == "peepee")
{
    y = 240
    image_xscale = -1
}
