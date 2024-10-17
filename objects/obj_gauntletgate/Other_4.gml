save_open()
var _startingpos = 4 * (world - 1) + world - 1
var i = _startingpos
while (i < (_startingpos + 4))
{
    if (!(ini_read_real("Treasures", global.levels[i], false)))
    {
        metrequirement = false
        break
    }
    else
        i++
}
if ini_read_real("GameProgress", string_concat(level, "unlocked"), false)
{
    self.create_func(true)
    instance_destroy()
}
save_close()
