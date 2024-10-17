if instance_exists(ID)
{
    x = ID.x
    y = ID.y - 40
    if (ID.state != 104 || ID.stunned < 100)
    {
        ID.birdcreated = 0
        instance_destroy()
    }
}
