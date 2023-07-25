#include "script_component.hpp";

private _dist    = EGVAR(NEW,DISTANCEVIEW);
private _objDist = EGVAR(NEW,DISTANCEOBJECTS);

setViewDistance _dist; 
setObjectViewDistance [_objDist, 100]; 

[format["ViewDistance %1, Object %2", _dist, _objDist], true, "INFO Change"] call EFUNC(log);

EGVAR(OLD,DISTANCEVIEW)    = _dist;
EGVAR(OLD,DISTANCEOBJECTS) = _objDist;

