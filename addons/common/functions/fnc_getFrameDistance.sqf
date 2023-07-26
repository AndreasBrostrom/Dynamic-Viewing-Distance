#include "script_component.hpp"
/*
 * Author: Brostrom.A
 * Return viewing idstance numbers based on the terrain
 *
 * Arguments:
 * Nothing
 *
 * Return:
 * Viewing distance number
 *
 * Example:
 * call FUNC(getFrameDistance)
 * call EFUNC(common,getFrameDistance)
 * call dvd_common_fnc_getFrameDistance
 */

if (!EGVAR(Setting,FPS)) exitWith {0};

private _fps = diag_fps;
_fps = round _fps;

private _return = switch (true) do {
    case (_fps <= 20):              {1000};
    case (_fps > 20 && _fps <= 30): {500};
    case (_fps > 40 && _fps <= 50): {0};
    case (_fps > 50 && _fps <= 60): {0};
    case (_fps > 60):               {0};
    default {0};
};

if (EGVAR(setting,debug)) then {
    [format["Return: %1 (%2)", _return, _fps], false, "INFO FPS"] call FUNC(log);
};

_return
