function scr_treasureroomcheck() //scr_treasureroomcheck
{
    if (room == entry_treasure || room == medieval_treasure || room == ruin_treasure || room == dungeon_treasure)
        return true;
    return false;
}

