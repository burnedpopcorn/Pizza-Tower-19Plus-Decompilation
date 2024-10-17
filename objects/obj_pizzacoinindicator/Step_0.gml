if (show <= 0)
{
    if (image_alpha > 0)
        image_alpha -= 0.05
}
if (show > 0)
{
    show -= 1
    if (image_alpha < 1)
        image_alpha += 0.05
}
squishspd = lerp(squishspd, ((0 - squish) * 0.5), 0.2)
squish += squishspd
