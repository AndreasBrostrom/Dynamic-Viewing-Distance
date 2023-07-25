#include "..\script_component.hpp"
/*
 * Author: CPL.Brostrom.A
 * This function print a formated rpt message.
 *
 * Arguments:
 * 0: message <STRING>
 * 1: showInChat <BOOL>
 * 2: typePrefix <STRING>
 *
 * Example:
 * ["Something is wrong here."] call FUNC(log)
 * [format["%1 is a player.", player]] call FUNC(log)
 * [format["ViewDistance %1, Object %2", _dist, _objDist], true, "INFO Change"] call EFUNC(common,log);
 *
 */

params [
    ["_message", ""],
    ["_showInChat", false, [false]],
    ["_type", "LOG", [""]]
];

private _prefix = format ["[%1] ", QUOTE(PREFIX)];
private _componant = format ["(%1) ", QUOTE(COMPONENT_BEAUTIFIED)];

_type = if (_type == "") then {format ["%1", "LOG"];} else {format ["%1", _type];}

private _logMessage = format ["%1%2%3: %4", _prefix, _componant, _type, _message];

diag_log text _logMessage;

if (_showInChat && (!isMultiplayer || {is3DENMultiplayer})) then {
    systemChat _logMessage;
};
