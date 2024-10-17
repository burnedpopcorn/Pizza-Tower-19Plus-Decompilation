if (wantrespawn == 1 && (!(place_meeting(x, y, obj_player))))
{
    instance_create_depth(x, y, depth, obj_bigdoughblock)
    instance_create_depth((x + 32), (y + 32), -100, obj_genericpoofeffect)
    instance_destroy()
}
