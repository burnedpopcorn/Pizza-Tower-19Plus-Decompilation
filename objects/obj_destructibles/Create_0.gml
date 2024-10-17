darkalpha = 1
function check_collision_generic() //check_collision_generic@gml_Object_obj_destructibles_Create_0
{
    var _correctside = true
    if (object_index == obj_onewaybigblock)
        _correctside = (image_xscale > 0 ? other.bbox_right >= bbox_right : other.bbox_left <= bbox_left)
    var _x1 = x - sprite_get_xoffset(sprite_index) + sprite_width / 2
    var _y1 = y - sprite_get_yoffset(sprite_index) + sprite_height / 2
    var _x2 = other.x - sprite_get_xoffset(other.sprite_index) + other.sprite_width / 2
    var _y2 = other.y - sprite_get_yoffset(other.sprite_index) + other.sprite_height / 2
    with (other.id)
    {
        if (_correctside && (!(fire_ray(_x1, _y1, _x2, _y2, 1, obj_destructibles).clear)))
            instance_destroy(other.id)
    }
}

