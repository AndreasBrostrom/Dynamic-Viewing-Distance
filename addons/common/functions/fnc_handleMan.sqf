#include "script_component.hpp";

// Minmum values
private _minDist    = EGVAR(MIN,DISTANCEVIEW);
private _minObjDist = EGVAR(MIN,DISTANCEOBJECTS);
private _maxDist    = EGVAR(MAX,DISTANCEVIEW);
private _maxObjDist = EGVAR(MAX,DISTANCEOBJECTS);

//Altetude
private _altitude = call FUNC(getAltitudeMan);

// Scope
private _zoom = call FUNC(getOpticsRifle);

// Clearing
private _clearing = call FUNC(getClearTerrain);

private _bonusView = _altitude + _zoom + _clearing;


// City
private _city = call FUNC(getCityTerrain);

// Forest
private _forest = call FUNC(getForestTerrain);

// Units and battles
private _troops = call FUNC(getTroops);

private _penaltyView = _city + _forest + _troops;


private _dist = _bonusView - _penaltyView;
private _objDist = _dist / 4;

_dist = round _dist;
_objDist = round _objDist;

if (_dist < _minDist) then {_dist = _minDist};
if (_objDist < _minObjDist) then {_objDist = _minObjDist};
if (_dist > _maxDist) then {_dist = _maxDist};
if (_objDist > _maxObjDist) then {_objDist = _maxObjDist};

hintSilent str ["Man", _dist, _objDist, [_bonusView, _penaltyView, _bonusView - _penaltyView]];

EGVAR(NEW,DISTANCEVIEW) = _dist;
EGVAR(NEW,DISTANCEOBJECTS) = _objDist;
