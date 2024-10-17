function scr_collide_player()
{
    var vy, v, vx, cDefault, skipCollision, snapPrecision, maxSnapDown, snap, ogY;
    
    vy = vsp;
    
    repeat (ceil(abs(vy)))
    {
        v = clamp(vy, -1, 1);
        scr_collide_destructibles(0, v);
        
        if (!step_vertical(v))
            break;
        
        if (!scr_solid_player(x, y + v))
        {
            if (v < 0)
            {
                grounded = false;
                grinding = false;
            }
            
            y += v;
            vy -= v;
        }
        else
        {
            vsp = 0;
            hit_vertical(v);
            test_ground(true);
            break;
        }
    }
    
    vx = hsp;
    
    if (place_meeting(x, y + 1, obj_railh))
        vx -= 5;
    else if (place_meeting(x, y + 1, obj_railh2))
        vx += 5;
    
    repeat (ceil(abs(vx)))
    {
        v = clamp(vx, -1, 1);
        scr_collide_destructibles(v, 0);
        cDefault = scr_solid_player(x + v, y);
        skipCollision = false;
        snapPrecision = 0.25;
        maxSnapDown = 3;
        snap = 0;
        ogY = y;
        
        if (cDefault)
        {
            while (scr_solid_player(x + v, y))
            {
                skipCollision = true;
                y -= snapPrecision;
                snap += snapPrecision;
                
                if (snap > maxSnapUp)
                {
                    skipCollision = false;
                    y = ogY;
                    break;
                }
            }
        }
        else
        {
            skipCollision = true;
            
            while (!scr_solid_player(x + v, y + snapPrecision))
            {
                y += snapPrecision;
                snap += snapPrecision;
                
                if (snap > maxSnapDown)
                {
                    y = ogY;
                    break;
                }
            }
        }
        
        test_ground();
        
        if (!step_horizontal(v))
            break;
        
        if (skipCollision)
        {
            x += v;
            vx -= v;
        }
        else
        {
            hsp = 0;
            hit_horizontal(v);
            break;
        }
    }
    
    if (vsp < 20)
        vsp += (grav * gravityflip);
    
    test_ground();
}

function test_ground(argument0 = false)
{
    var g;
    
    if (argument0 || vsp >= 0)
    {
        if (state != (8 << 0) && state != (9 << 0) && state != (10 << 0) && state != (11 << 0) && state != (18 << 0) && state != (19 << 0) && state != (25 << 0) && state != (40 << 0) && state != (49 << 0))
        {
            g = instance_place(x, y + 1, obj_grindrail);
            
            if (g)
            {
                if (g.object_index == obj_grindrailslope)
                    grinding = check_slope_player(g, x, y + 1) && !check_slope_player(g);
                else if (g.object_index == obj_grindrail)
                    grinding = !instance_place(x, y, obj_grindrail);
            }
        }
        
        grounded = grinding || scr_solid_player(x, y + 1);
    }
}