if input_check_pressed("up")
{
    instance_create_depth(other.x, other.y, -18, obj_genericpoofeffect)
    if (other.character == "P")
    {
        if (other.paletteselect < 18)
            other.paletteselect += 1
        else
            other.paletteselect = 0
    }
    if (other.character == "N")
    {
        if (other.paletteselect < 15)
            other.paletteselect += 1
        else
            other.paletteselect = 0
    }
    if (other.character == "S")
    {
        if (other.paletteselect < 9)
            other.paletteselect += 1
        else
            other.paletteselect = 0
    }
}
