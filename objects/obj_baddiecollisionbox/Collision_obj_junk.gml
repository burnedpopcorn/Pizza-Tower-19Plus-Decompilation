with (other.id)
{
    if (instance_exists(other.baddieID) && other.baddieID != other.id)
    {
        if (grabbedby == -4 && abs(hsp) > 0)
        {
            instance_destroy(other.baddieID)
            instance_destroy(other.id)
        }
    }
}
