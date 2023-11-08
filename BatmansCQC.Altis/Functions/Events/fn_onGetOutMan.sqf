/*
 File: fn_onGetOutMan.sqf
 Author: FragS
 Description: Runs on local unit when exiting a vehicle
*/

params [
    ["_unit", objNull, [objNull]],
    ["_position", "", [""]],
    ["_vehicle", objNull, [objNull]],
    ["_turret", [], [[]]]
];

// Engine off on decamp
_vehicle engineOn false;