var _angle = 0
switch image_index
{
    case 0:
        _angle = 0
        break
    case 1:
        _angle = 270
        break
    case 2:
        _angle = 180
        break
    case 3:
        _angle = 90
        break
}

var _gridx = (floor(x / 32)) * 32
var _gridy = (floor(y / 32)) * 32
for (var _x = 0; _x < abs(ceil(image_xscale)); _x++)
{
    for (var _y = 0; _y < abs(ceil(image_yscale)); _y++)
    {
        var _createdID = instance_create_depth((_gridx + 16 * sign(image_xscale) + _x * sprite_get_width(sprite_index)), (_gridy + 16 * sign(image_yscale) + _y * sprite_get_height(sprite_index)), depth, obj_tilecutoffVISUAL)
        _createdID.image_angle = _angle
        _createdID.image_xscale = sign(image_xscale)
        _createdID.image_yscale = sign(image_yscale)
    }
}
