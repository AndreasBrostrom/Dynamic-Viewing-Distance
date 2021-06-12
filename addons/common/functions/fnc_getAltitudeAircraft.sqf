#include "script_component.hpp";

private _altitude = player call CBA_fnc_getPos;
_altitude = _altitude#2;

private _return = switch (true) do {
    case (_altitude <= 0):                        {0};
    case (_altitude > 5 && _altitude <= 10):      {1500};
    case (_altitude > 10 && _altitude <= 50):     {2500};
    case (_altitude > 100 && _altitude <= 200):   {3000};
    case (_altitude > 200 && _altitude <= 300):   {4000};
    case (_altitude > 300 && _altitude <= 500):   {6000};
    case (_altitude > 500 && _altitude <= 1000):  {8000};
    case (_altitude > 1000 && _altitude <= 2000): {10000};
    case (_altitude > 2000 && _altitude <= 3000): {11000};
    case (_altitude > 3000 && _altitude <= 4000): {12000};
    case (_altitude > 5000 && _altitude <= 6000): {13000};
    case (_altitude > 6000):                      {14000};
    default {0};
};

_return