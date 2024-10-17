if instance_exists(grabbedby)
{
    if (grabbedby.state == (28 << 0) || grabbedby.state == (119 << 0) || grabbedby.state == (7 << 0) || grabbedby.state == (2 << 0) || grabbedby.sprite_index == grabbedby.spr_piledriver || grabbedby.sprite_index == grabbedby.spr_piledriverland)
        grabbedby.state = (0 << 0)
    grabbedby = noone
}
