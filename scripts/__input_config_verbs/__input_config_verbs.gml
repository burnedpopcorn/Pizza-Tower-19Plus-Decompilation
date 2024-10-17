// Feather disable all

//This script contains the default profiles, and hence the default bindings and verbs, for your game
//
//  Please edit this macro to meet the needs of your game!
//
//The struct return by this script contains the names of each default profile.
//Default profiles then contain the names of verbs. Each verb should be given a binding that is
//appropriate for the profile. You can create bindings by calling one of the input_binding_*()
//functions, such as input_binding_key() for keyboard keys and input_binding_mouse() for
//mouse buttons

function __input_config_verbs()
{
    return 
    {
        keyboard_and_mouse: 
        {
            up: input_binding_key(38),
            down: input_binding_key(40),
            left: input_binding_key(37),
            right: input_binding_key(39),
            jump: input_binding_key("Z"),
            attack: input_binding_key("X"),
            taunt: input_binding_key("C"),
            shoot: input_binding_key("A"),
            dash: input_binding_key(16),
            groundpound: input_binding_key(40),
            superjump: input_binding_key(38),
            pause: input_binding_key(27)
        },
        gamepad: 
        {
            up: [input_binding_gamepad_button(32781), input_binding_gamepad_axis(32786, true)],
            down: [input_binding_gamepad_button(32782), input_binding_gamepad_axis(32786, false)],
            left: [input_binding_gamepad_button(32783), input_binding_gamepad_axis(32785, true)],
            right: [input_binding_gamepad_button(32784), input_binding_gamepad_axis(32785, false)],
            jump: input_binding_gamepad_button(32769),
            attack: input_binding_gamepad_button(32771),
            taunt: input_binding_gamepad_button(32770),
            shoot: [input_binding_gamepad_button(32775), input_binding_gamepad_button(32773)],
            dash: [input_binding_gamepad_button(32776), input_binding_gamepad_button(32774)],
            groundpound: [input_binding_gamepad_button(32782), input_binding_gamepad_axis(32786, false)],
            superjump: [input_binding_gamepad_button(32781), input_binding_gamepad_axis(32786, true)],
            pause: [input_binding_gamepad_button(32778), input_binding_gamepad_button(32777)]
        }
    };
}
