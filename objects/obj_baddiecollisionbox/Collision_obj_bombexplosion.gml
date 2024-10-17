if instance_exists(baddieID)
{
    with (baddieID)
    {
        if (object_index != obj_pizzagoblin)
        {
            state = 104
            stunned = 100
            vsp = -5
        }
    }
}
