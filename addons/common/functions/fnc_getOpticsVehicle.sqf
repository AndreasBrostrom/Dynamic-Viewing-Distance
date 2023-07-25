#include "script_component.hpp";

private _zoom = call CBA_fnc_getFov select 1;

private _return = if (cameraView == "GUNNER") then {
    switch (true) do {
        case (_zoom <= 5):                {1000};
        case (_zoom > 5 && _zoom <= 10):  {2000};
        case (_zoom > 10 && _zoom <= 20): {3000};
        case (_zoom > 20 && _zoom <= 30): {4000};
        case (_zoom > 30): {6000};
        default {0};
    };
} else {
    switch (true) do {
        case (_zoom <= 0):              {1000};
        case (_zoom > 0 && _zoom <= 2): {2000};
        case (_zoom > 2):               {3000};
        default {1000};
    };
};

_return