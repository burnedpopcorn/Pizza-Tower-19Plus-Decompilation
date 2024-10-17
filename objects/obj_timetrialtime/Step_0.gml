if (!out)
    trans += 0.065
else
    trans -= 0.065
trans = clamp(trans, 0, 1)
if (out && trans <= 0)
    instance_destroy()
