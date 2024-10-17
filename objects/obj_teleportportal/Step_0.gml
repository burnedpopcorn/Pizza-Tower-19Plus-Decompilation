if instance_exists(obj_teleportmachine)
{
    with (obj_teleportmachine)
    {
        if (transmitterid == other.transmitterid)
            other.receiver = id
    }
}
