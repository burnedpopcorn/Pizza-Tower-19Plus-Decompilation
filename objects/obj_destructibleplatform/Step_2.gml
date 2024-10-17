if (floor(image_index) == (image_number - 1) && sprite_index == spr_cheeseblock && falling)
{
    sprite_index = spr_cheeseblock_falling
    mask_index = spr_masknull
}
if (floor(image_index) == (image_number - 1) && sprite_index == spr_moldycheese && falling)
{
    sprite_index = spr_moldycheese_falling
    mask_index = spr_masknull
}
if (sprite_index == spr_cheeseblock_falling || sprite_index == spr_moldycheese_falling)
    reset--
if (reset < 0 && (!(place_meeting(x, y, obj_player))) && (!(place_meeting(x, y, obj_junk))))
{
    reset = 100
    falling = 0
    mask_index = spr_railh2
    if (ds_list_find_index(global.saveroom, id) != -1)
        sprite_index = spr_moldycheese_reform
    else
        sprite_index = spr_cheeseblock_reform
}
if (sprite_index == spr_cheeseblock_reform && floor(image_index) == (image_number - 1))
{
    sprite_index = spr_cheeseblock
    image_speed = 0
    image_index = 0
}
if (sprite_index == spr_moldycheese_reform && floor(image_index) == (image_number - 1))
{
    sprite_index = spr_moldycheese
    image_speed = 0
    image_index = 0
}
