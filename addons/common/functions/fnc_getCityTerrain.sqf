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
 * call FUNC(getCityTerrain)
 * call EFUNC(common,getCityTerrain)
 * call dvd_common_fnc_getCityTerrain
 */

private _terrain = count nearestObjects [player, ["house"], 50];
_terrain = round _terrain;

private _return = switch (true) do {
    case (_terrain <= 10): {0};
    case (_terrain > 10 && _terrain <= 20): {500};
    case (_terrain > 20 && _terrain <= 30): {1500};
    case (_terrain > 30 && _terrain <= 40): {2000};
    case (_terrain > 40 && _terrain <= 50): {2500};
    case (_terrain > 50 && _terrain <= 60): {3000};
    case (_terrain > 60 && _terrain <= 70): {3500};
    case (_terrain > 70 && _terrain <= 80): {4000};
    case (_terrain > 80 && _terrain <= 90): {4500};
    case (_terrain > 90): {5000};
    default {0};
};


_return

