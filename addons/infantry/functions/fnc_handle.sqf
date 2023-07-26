#include "script_component.hpp"
/*
 * Author: Brostrom.A
 * Handles infantry
 *
 * Arguments:
 * Nothing
 *
 * Return:
 * Nothing
 *
 * Example:
 * call FUNC(handle)
 * call EFUNC(infantry,handle)
 * call dvd_infantry_fnc_handle
 */

// Minmum values
private _minDist    = EGVAR(MIN,DISTANCEVIEW);
private _minObjDist = EGVAR(MIN,DISTANCEOBJECTS);
private _maxDist    = EGVAR(MAX,DISTANCEVIEW);
private _maxObjDist = EGVAR(MAX,DISTANCEOBJECTS);

//Altetude
private _altitude = call FUNC(getAltitude);

// Scope
private _zoom = call FUNC(getOptics);

// Clearing
private _clearing = call EFUNC(common,getClearTerrain);

private _bonusView = _altitude + _zoom + _clearing;


// City
private _city = call EFUNC(common,getCityTerrain);

// Forest
private _forest = call EFUNC(common,getForestTerrain);

// Units and battles
private _troops = call EFUNC(common,getTroops);

// Frames (FPS)

private _frames = call EFUNC(common,getFrameDistance);

private _penaltyView = _city + _forest + _troops + _frames;


private _dist = _bonusView - _penaltyView;
private _objDist = _dist / 4;

_dist = round _dist;
_objDist = round _objDist;

if (_dist < _minDist) then {_dist = _minDist};
if (_objDist < _minObjDist) then {_objDist = _minObjDist};
if (_dist > _maxDist) then {_dist = _maxDist};
if (_objDist > _maxObjDist) then {_objDist = _maxObjDist};

if (EGVAR(setting,debug)) then {
    private _debugTextHeader = format ["MAN (FPS: %1)", round diag_fps];
    private _debugTextDistance = format ["[dist: %1, objDist: %2]<br/>", _dist, _objDist];
    private _debugTextBonusView = format ["BonusView: %1<br/>[ALTITUDE: %2, ZOOM: %3, CLEARING: %4]<br/>", _bonusView, _altitude, _zoom, _clearing];
    private _debugTextPenaltyView = format ["PenaltyView: %1 <br/>[CITY: %2, FOREST: %3, TROOPS: %4, FPS: %5]<br/>", _penaltyView, _city, _forest, _troops, _frames];
    private _debugMessage = [_debugTextHeader, _debugTextDistance, _debugTextBonusView, _debugTextPenaltyView] joinString "<br/>";
    hintSilent parseText _debugMessage;
};

EGVAR(NEW,DISTANCEVIEW) = _dist;
EGVAR(NEW,DISTANCEOBJECTS) = _objDist;
