var _set;
function ease(argument0, argument1) //ease
{
    if (argument1 == undefined)
        argument1 = "linear"
    return variable_struct_get(__easings(), argument1)(clamp(argument0, 0, 1));
}

function tween(argument0, argument1, argument2, argument3) //tween
{
    if (argument3 == undefined)
        argument3 = "linear"
    return (argument0 + (argument1 - argument0) * (ease(argument2, argument3)));
}

function __easings()
{
    static __instance = new function() constructor
    {
        var _set;
        
        _set = function(argument0, argument1, argument2 = self)
        {
            variable_struct_set(argument2, argument0, argument1);
            return variable_struct_get(argument2, argument0);
        };
        
        __sqrt = function(argument0)
        {
            return (sign(argument0) == 1) ? sqrt(argument0) : 0;
        };
        
        _set("linear", function(argument0)
        {
            return argument0;
        });
        _set("in quad", function(argument0)
        {
            return power(argument0, 2);
        });
        _set("in cubic", function(argument0)
        {
            return power(argument0, 3);
        });
        _set("in quart", function(argument0)
        {
            return power(argument0, 4);
        });
        _set("in quint", function(argument0)
        {
            return power(argument0, 5);
        });
        _set("out quad", function(argument0)
        {
            return 1 - power(1 - argument0, 2);
        });
        _set("out cubic", function(argument0)
        {
            return 1 - power(1 - argument0, 3);
        });
        _set("out quart", function(argument0)
        {
            return 1 - power(1 - argument0, 4);
        });
        _set("out quint", function(argument0)
        {
            return 1 - power(1 - argument0, 5);
        });
        _set("in out quad", function(argument0)
        {
            return (argument0 < 0.5) ? (power(argument0, 2) * 2) : (1 - (power((-2 * argument0) + 2, 2) / 2));
        });
        _set("in out cubic", function(argument0)
        {
            return (argument0 < 0.5) ? (power(argument0, 3) * 4) : (1 - (power((-2 * argument0) + 2, 3) / 2));
        });
        _set("in out quart", function(argument0)
        {
            return (argument0 < 0.5) ? (power(argument0, 4) * 8) : (1 - (power((-2 * argument0) + 2, 4) / 2));
        });
        _set("in out quint", function(argument0)
        {
            return (argument0 < 0.5) ? (power(argument0, 5) * 16) : (1 - (power((-2 * argument0) + 2, 5) / 2));
        });
        _set("in sine", function(argument0)
        {
            return 1 - cos((argument0 * pi) / 2);
        });
        _set("out sine", function(argument0)
        {
            return sin((argument0 * pi) / 2);
        });
        _set("in out sine", function(argument0)
        {
            return -(cos(argument0 * pi) - 1) / 2;
        });
        _set("in expo", function(argument0)
        {
            return (argument0 == 0) ? 0 : power(2, (10 * argument0) - 10);
        });
        _set("out expo", function(argument0)
        {
            return (argument0 == 1) ? 1 : (1 - power(2, -10 * argument0));
        });
        _set("in out expo", function(argument0)
        {
            if (argument0 == 0)
                return 0;
            
            if (argument0 == 1)
                return 1;
            
            if (argument0 >= 0.5)
                return (2 - power(2, (-20 * argument0) + 10)) / 2;
            
            return power(2, (20 * argument0) - 10) / 2;
        });
        __out_bounce = _set("out bounce", function(argument0)
        {
            if (argument0 < 0.36363636363636365)
            {
                return 7.5625 * argument0 * argument0;
            }
            else if (argument0 < 0.7272727272727273)
            {
                argument0 -= 0.5454545454545454;
                return (7.5625 * argument0 * argument0) + 0.75;
            }
            else if (argument0 < 0.9090909090909091)
            {
                argument0 -= 0.8181818181818182;
                return (7.5625 * argument0 * argument0) + 0.9375;
            }
            
            argument0 -= 0.9545454545454546;
            return (7.5625 * argument0 * argument0) + 0.984375;
        });
        _set("in out bounce", function(argument0)
        {
            if (argument0 < 0.5)
                return (1 - __out_bounce(1 - (2 * argument0))) / 2;
            
            return (1 + __out_bounce((2 * argument0) - 1)) / 2;
        });
        _set("in bounce", function(argument0)
        {
            return 1 - __out_bounce(1 - argument0);
        });
        _set("in circ", function(argument0)
        {
            return 1 - __sqrt(1 - power(argument0, 2));
        });
        _set("out circ", function(argument0)
        {
            return __sqrt(1 - power(argument0 - 1, 2));
        });
        _set("in out circ", function(argument0)
        {
            if (argument0 >= 0.5)
                return (1 + __sqrt(1 - power((-2 * argument0) + 2, 2))) / 2;
            
            return (1 - __sqrt(1 - power(2 * argument0, 2))) / 2;
        });
        _set("in back", function(argument0)
        {
            return (2.70158 * power(argument0, 3)) - (1.70158 * power(argument0, 2));
        });
        _set("out back", function(argument0)
        {
            return 1 + (2.70158 * power(argument0 - 1, 3)) + (1.70158 * power(argument0 - 1, 2));
        });
        _set("in out back", function(argument0)
        {
            if (argument0 >= 0.5)
                return ((power((2 * argument0) - 2, 2) * ((3.5949095 * ((argument0 * 2) - 2)) + 2.5949095)) + 2) / 2;
            
            return (power(2 * argument0, 2) * ((3.5949095 * (argument0 * 2)) - 2.5949095)) / 2;
        });
        _set("in elastic", function(argument0)
        {
            static __c = 2.0943951023931953;
            
            if (argument0 == 0)
                return 0;
            
            if (argument0 == 1)
                return 1;
            
            return -power(2, (10 * argument0) - 10) * sin(((argument0 * 10) - 10.75) * __c);
        });
        _set("out elastic", function(argument0)
        {
            static __c = 2.0943951023931953;
            
            if (argument0 == 0)
                return 0;
            
            if (argument0 == 1)
                return 1;
            
            return (power(2, -10 * argument0) * sin(((argument0 * 10) - 0.75) * __c)) + 1;
        });
        _set("in out elastic", function(argument0)
        {
            static __c = 1.3962634015954636;
            
            if (argument0 == 0)
                return 0;
            
            if (argument0 == 1)
                return 1;
            
            if (argument0 >= 0.5)
                return ((power(2, (-20 * argument0) + 10) * sin(((20 * argument0) - 11.125) * __c)) / 2) + 1;
            
            return -(power(2, (20 * argument0) - 10) * sin(((20 * argument0) - 11.125) * __c)) / 2;
        });
        _set("smootheststep", function(argument0)
        {
            return (((-20 * power(argument0, 7)) + (70 * power(argument0, 6))) - (84 * power(argument0, 5))) + (35 * power(argument0, 4));
        });
        _set("smootherstep", function(argument0)
        {
            return argument0 * argument0 * argument0 * ((argument0 * ((argument0 * 6) - 15)) + 10);
        });
        _set("smoothstep", function(argument0)
        {
            return argument0 * argument0 * (3 - (2 * argument0));
        });
    }();
    
    return __instance;
}

