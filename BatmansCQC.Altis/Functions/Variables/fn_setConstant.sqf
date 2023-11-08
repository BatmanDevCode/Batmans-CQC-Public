/*
 File: fn_setConstant.sqf
 Author: FragS
 Description: Sets constatnt variable that cant be overwritten
*/

params [
    ["_varname", "", [""]],
    "_value",
    ["_public", false, [true]],
    ["_namespace", missionNamespace, [missionNamespace, uiNamespace, objNull, displayNull, controlNull]]
];

// Check for no variable name
if (_varname isEqualTo "") exitWith {};

// Freeze clients attempting to overwrite variables
if !(isNil (_namespace getVariable _varname)) exitWith {};

// Set value to variable and finalise
_namespace setVariable [_varname, compileFinal str _value, _public];