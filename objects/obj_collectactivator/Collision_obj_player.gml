if (escape == 0 && self.condition())
{
    if instance_exists(obj_collectspawnarea)
    {
        with (obj_collectspawnarea)
        {
            if (other.area == areaID)
                activate = 1
        }
    }
    instance_destroy()
    obj_collectspawn.activatede = 1
}
if (escape == 1 && global.panic == 1 && self.condition())
{
    if instance_exists(obj_collectspawnarea)
    {
        with (obj_collectspawnarea)
        {
            if (other.area == areaID)
                activate = 1
        }
    }
    instance_destroy()
    obj_collectspawn.activatede = 1
}
