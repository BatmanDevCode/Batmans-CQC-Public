#include "..\script_component.hpp"
/*
 File: fn_onKeyDown.sqf
 Author: FragS
 Description: Handles when a key is pressed
*/

params [
    ["_display", displayNull, [displayNull]],
    ["_dikCode", 0, [0]],
    ["_isShift", false, [false]],
    ["_isCtrl", false, [false]],
    ["_isAlt", false, [false]],
    ["_handled", false, [false]]
];

if (dialog) exitWith {};
if (_dikCode in (actionKeys "tacticalView")) exitWith {true};

switch _dikCode do {
    case DIK_F1: {
        _handled = true;
    };
};


_handled;