#include "script_component.hpp";

// Minmum values
private _minDist    = EGVAR(MIN,DISTANCEVIEW);
private _minObjDist = EGVAR(MIN,DISTANCEOBJECTS);
private _maxDist    = EGVAR(MAX,DISTANCEVIEW);
private _maxObjDist = EGVAR(MAX,DISTANCEOBJECTS);

//Altetude
private _altitude = call FUNC(getAltitudeAircraft);

// Scope
private _scope = if !(cameraView == "GUNNER") then { call FUNC(getOpticsVehicle)} else { 0 };

private _bonusView = _altitude + _scope;
private _penaltyView = 0;

private _dist = _bonusView - _penaltyView;

private _objDist = if (cameraView == "GUNNER") then {
    (_dist / 2) + call FUNC(getOpticsVehicle);
} else {
    _dist / 3
};

_dist = round _dist;
_objDist = round _objDist;

if (_dist < _minDist) then {_dist = _minDist};
if (_objDist < _minObjDist) then {_objDist = _minObjDist};
if (_dist > _maxDist) then {_dist = _maxDist};
if (_objDist > _maxObjDist) then {_objDist = _maxObjDist};

hintSilent str ["Aircraft", _dist, _objDist, [_bonusView, _penaltyView, _bonusView - _penaltyView]];

EGVAR(NEW,DISTANCEVIEW) = _dist;
EGVAR(NEW,DISTANCEOBJECTS) = _objDist;
