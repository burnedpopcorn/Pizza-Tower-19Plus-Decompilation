if (instance_exists(baddieID) && baddieID.thrown == 1)
{
    var _correctside = (other.image_xscale > 0 ? bbox_right >= other.bbox_right : bbox_left <= other.bbox_left)
    if (other.object_index != obj_onewaybigblock || _correctside)
        instance_destroy(other.id)
}
