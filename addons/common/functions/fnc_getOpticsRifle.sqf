#include "script_component.hpp";

private _zoom = call CBA_fnc_getFov select 1;
private _troops = call FUNC(getTroops);

private _return = if (_troops > 2500) then {
    if (cameraView == "GUNNER") then {
        switch (true) do {
            case (_zoom <= 5):                {500};
            case (_zoom > 5 && _zoom <= 10):  {1000};
            case (_zoom > 10 && _zoom <= 20): {1500};
            case (_zoom > 20 && _zoom <= 30): {2000};
            case (_zoom > 30): {2500};
            default {0};
        };
    } else {
        if (_zoom > 2) then {1000} else {0};
    };
} else {
    if (cameraView == "GUNNER") then {
        switch (true) do {
            case (_zoom <= 5):                {1000};
            case (_zoom > 5 && _zoom <= 10):  {2000};
            case (_zoom > 10 && _zoom <= 20): {3000};
            case (_zoom > 20 && _zoom <= 30): {4000};
            case (_zoom > 30): {6000};
            default {0};
        };
    } else {
        if (_zoom > 2) then {1000} else {0};
    };
};

_return