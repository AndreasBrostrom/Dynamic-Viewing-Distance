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
 * call FUNC(getClearTerrain)
 * call EFUNC(common,getClearTerrain)
 * call dvd_common_fnc_getClearTerrain
 */

private _trees = count nearestTerrainObjects [player, ["Tree"], 75];
private _structures = count nearestObjects [player, ["house"], 100];
private _terrain = _trees + _structures;
_terrain = round _terrain;


private _return = switch (true) do {
    case (_terrain <= 10):                    {5000};
    case (_terrain > 10 && _terrain <= 40):   {4500};
    case (_terrain > 40 && _terrain <= 70):   {4000};
    case (_terrain > 70 && _terrain <= 100):  {3500};
    case (_terrain > 100 && _terrain <= 130): {3000};
    case (_terrain > 130 && _terrain <= 160): {2500};
    case (_terrain > 160 && _terrain <= 190): {2000};
    case (_terrain > 190 && _terrain <= 220): {1500};
    case (_terrain > 220 && _terrain <= 250): {1000};
    case (_terrain > 250 && _terrain <= 300): {500};
    case (_terrain > 300):                    {0};
    default {0};
};

if (EGVAR(setting,debug)) then {
    [format["[Trees %1, Structures %2, Terrain: %3], Return: %4", _trees, _structures, _terrain, _return], false, "INFO ClearTerrain"] call FUNC(log);
};

_return
