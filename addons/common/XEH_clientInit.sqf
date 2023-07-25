#include "script_component.hpp"

if (!hasInterface) exitWith {};

EGVAR(NEW,DISTANCEVIEW)    = 3000;
EGVAR(NEW,DISTANCEOBJECTS) = 1500;
EGVAR(OLD,DISTANCEVIEW)    = 0;
EGVAR(OLD,DISTANCEOBJECTS) = 0;

// Minimum
EGVAR(MIN,DISTANCEVIEW)    = 1500;
EGVAR(MIN,DISTANCEOBJECTS) = 300;
EGVAR(MAX,DISTANCEVIEW)    = 20000;
EGVAR(MAX,DISTANCEOBJECTS) = 20000;

[{
    if (call FUNC(allowUpdate)) then {
        call FUNC(setViewingDistance);
    };
}, 0] call CBA_fnc_addPerFrameHandler;

[{
    call FUNC(getViewChanges);
}, 0] call CBA_fnc_addPerFrameHandler;