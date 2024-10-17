if place_meeting((x + 1), y, obj_pizzaball)
{
    if (instance_place((x + 1), y, obj_pizzaball).state == 104)
        instance_destroy()
}
if place_meeting((x - 1), y, obj_pizzaball)
{
    if (instance_place((x - 1), y, obj_pizzaball).state == 104)
        instance_destroy()
}
