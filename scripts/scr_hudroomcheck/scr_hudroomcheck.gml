function scr_hudroomcheck() //scr_hudroomcheck
{
    if asset_has_tags(room, "No HUD", asset_room)
        return true;
    return false;
}

