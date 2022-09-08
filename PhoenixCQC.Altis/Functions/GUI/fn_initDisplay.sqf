/*
 File: fn_initDisplay.sqf
 Author:
 Description: 
*/

params [
    ["_displayName", "", [""]],
    ["_display", displayNull, [displayNull]]
];

uiNamespace setVariable [_displayName, _display];
private _scriptName = (_displayName + "_script");

private _missionDisplays = call (missionNamespace getVariable "CQC_missionDisplays");
if !(_displayName in _missionDisplays) exitWith {disableUserInput true};

["onLoad", [_display]] call (missionNamespace getVariable _scriptName);

_display displayAddEventHandler ["Unload", format ["['onUnload', []] call %1;", _scriptName]];