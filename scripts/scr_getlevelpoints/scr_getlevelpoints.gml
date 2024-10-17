function scr_getlevelpoints() //scr_getlevelpoints
{
    if (global.collect >= global.srank && global.prank == 1)
        return "P";
    else if (global.collect >= global.srank && global.prank == 0)
        return "S";
    else if (global.collect > global.arank)
        return "A";
    else if (global.collect > global.brank)
        return "B";
    else if (global.collect > global.crank)
        return "C";
    else
        return "D";
}

function scr_getleveltime() //scr_getleveltime
{
    if (global.timetrialtick <= global.purplerank)
        return "Purplium";
    else if (global.timetrialtick <= global.goldrank)
        return "Gold";
    else if (global.timetrialtick <= global.silverrank)
        return "Silver";
    else
        return "Bronze";
}

