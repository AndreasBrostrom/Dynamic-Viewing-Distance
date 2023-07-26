#include "script_component.hpp";
/*
 * Author: Brostrom.A
 * Handles infantry
 *
 * Arguments:
 * Nothing
 *
 * Return:
 * Nothing
 *
 * Example:
 * call FUNC(getAltitude)
 * call EFUNC(infantry,getAltitude)
 * call dvd_infantry_fnc_getAltitude
 */

private _altitude = getPosATL player;
_altitude = _altitude#2;
_altitude = round _altitude;

private _return = switch (true) do {
    case (_altitude <= 2): {0};
    case (_altitude > 2 && _terrain <= 4):  {1000};
    case (_altitude > 4 && _terrain <= 6):  {2000};
    case (_altitude > 6 && _terrain <= 8):  {3000};
    case (_altitude > 8 && _terrain <= 10): {4000};
    case (_altitude > 10): {5000};
    default {0};
};

if (EGVAR(setting,debug)) then {
    [format["Return: %1 (%2)", _return, _altitude], false, "INFO Altitude"] call FUNC(log);
};


_return