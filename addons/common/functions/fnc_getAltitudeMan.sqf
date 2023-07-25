#include "script_component.hpp";

private _altitude = player call CBA_fnc_getPos;
_altitude = _altitude#2;

private _return = switch (true) do {
    case (_altitude <= 2): {0};
    case (_altitude > 2 && _terrain <= 4): {1000};
    case (_altitude > 4 && _terrain <= 6): {2000};
    case (_altitude > 6 && _terrain <= 8): {3000};
    case (_altitude > 8 && _terrain <= 10): {4000};
    case (_altitude > 10): {5000};
    default {0};
};

_return