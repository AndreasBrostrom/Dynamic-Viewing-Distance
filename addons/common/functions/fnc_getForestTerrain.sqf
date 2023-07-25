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
 * call FUNC(getForestTerrain)
 * call EFUNC(common,getForestTerrain)
 * call dvd_common_fnc_getForestTerrain
 */
private _terrain = count nearestTerrainObjects [player, ["Tree"], 50];
_terrain = round _terrain;

private _return = switch (true) do {
    case (_terrain <= 50): {0};
    case (_terrain > 50 && _terrain <= 100): {500};
    case (_terrain > 100 && _terrain <= 150): {1500};
    case (_terrain > 150 && _terrain <= 200): {2000};
    case (_terrain > 200 && _terrain <= 250): {2500};
    case (_terrain > 250 && _terrain <= 300): {3000};
    case (_terrain > 300): {4000};
    default {0};
};

_return

