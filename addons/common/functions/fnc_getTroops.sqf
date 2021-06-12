#include "script_component.hpp";

private _units = count nearestObjects [player, ["man"], 250];
private _vehicles = count nearestObjects [player, ["vehicle"], 250];
_troops = _units + _vehicles;

private _return = switch (true) do {
    case (_troops <= 20): {0};
    case (_troops > 20 && _troops <= 30): {500};
    case (_troops > 30 && _troops <= 40): {1000};
    case (_troops > 40 && _troops <= 50): {1500};
    case (_troops > 60 && _troops <= 70): {2000};
    case (_troops > 80 && _troops <= 90): {2500};
    case (_troops > 90): {3000};
    default {0};
};

_return

