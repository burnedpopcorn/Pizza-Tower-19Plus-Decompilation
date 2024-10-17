if (floor(image_index) == 3 && madecheese == 0)
{
    instance_create_depth((x + 32), (y + 64), 0, obj_cheeseblob)
    madecheese = 1
}
if (floor(image_index) == (image_number - 1))
    madecheese = 0
