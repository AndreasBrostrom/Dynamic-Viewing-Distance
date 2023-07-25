#include "script_component.hpp";

private _dist    = EGVAR(NEW,DISTANCEVIEW);
private _objDist = EGVAR(NEW,DISTANCEOBJECTS);

setViewDistance _dist; 
setObjectViewDistance [_objDist, 100]; 

[formatText["ViewDistance %1, Object %2", _dist, _objDist], "Change", true] call FUNC(info);

EGVAR(OLD,DISTANCEVIEW)    = _dist;
EGVAR(OLD,DISTANCEOBJECTS) = _objDist;

