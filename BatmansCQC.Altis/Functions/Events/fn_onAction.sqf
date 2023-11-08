/*
 File: fn_onAction.sqf
 Author:
 Description:
*/

params [
    ["_target", objNull, [objNull]],
    ["_caller", objNull, [objNull]],
    ["_index", 0, [0]],
    ["_action", "", [""]]
];

private _handled = false;

switch _action do {
    case "GearOpen": {
        if (_target isNotEqualTo _caller) then {
            _handled = true;
        };
    };
    
    case "OpenBag": {
        if (_target isNotEqualTo _caller) then {
            _handled = true;
        };
    };
};

_handled;