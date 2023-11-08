/*
 File: fn_addAction.sqf
 Author: FragS
 Description: Creates an action on given object.
*/

params [
    ["_object", objNull, [objNull]],
    ["_displayName", "", [""]],
    ["_icon", "", [""]],
    ["_prefix", "", [""]],
    ["_prefixColor", [], [[]]],
    ["_script", "", ["", {}]],
    ["_condition", "", [""]],
    ["_radius", 0, [0]],
    ["_arguments", []],
    ["_priority", 1.5, [0]],
    ["_showWindow", true, [true]],
    ["_hideOnUse", true, [true]],
    ["_shortcut", "", [""]],
    ["_unconscious", false, [true]],
    ["_selection", "", [""]],
    ["_memoryPoint", "", [""]]
];

// Format prefix
private _prefixed = "";

if !(_prefix == "") then {
_prefixed = format ["<t color='%1'>[%2] </t>", _prefixColor call BIS_fnc_colorRGBtoHTML, _prefix]
};

// Add Action
private _addedAction = _object addAction [
    _displayName,
    _script,
    _arguments,
    _priority,
    _showWindow,
    _hideOnUse,
    _shortcut,
    _condition,
    _radius,
    _unconscious,
    _selection,
    _memoryPoint
];

// Add icon and apply prefix
_object setUserActionText [_addedAction , (_prefixed + _displayName), format ["<img size='2' image='%1'/>", _icon]];