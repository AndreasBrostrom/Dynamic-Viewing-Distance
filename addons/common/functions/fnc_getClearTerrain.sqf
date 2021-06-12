#include "script_component.hpp";

private _trees = count nearestTerrainObjects [player, ["Tree"], 100];
private _structures = count nearestObjects [player, ["house"], 100];
private _terrain = _trees + _structures;
_terrain = round _terrain;

private _return = switch (true) do {
    case (_terrain <= 5): {5000};
    case (_terrain > 5 && _terrain <= 10):  {4000};
    case (_terrain > 10 && _terrain <= 15): {3000};
    case (_terrain > 15 && _terrain <= 20): {2000};
    case (_terrain > 20 && _terrain <= 25): {1000};
    case (_terrain > 25): {0};
    default {0};
};

_return
