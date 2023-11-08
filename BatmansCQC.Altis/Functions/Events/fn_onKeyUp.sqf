#include "..\script_component.hpp"
/*
 File: fn_onKeyUp.sqf
 Author: FragS
 Description: Handle onKeyUp event.
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

switch _dikCode do {
    
    // (Shift) - Change Arena (Ctrl) - Return to spawn
    case DIK_T: {
        if (_isShift) then {
            createDialog "CQC_displaySelectArena";
            _handled = true;
        };
        
        if (_isCtrl) then {
            [] spawn CQC_fnc_returnToSpawn;
            _handled = true;
        };
    };

    // Admin menu
    case DIK_F1: {
        if (call CQC_adminLevel > 0) then {
            findDisplay 46 createDisplay "CQC_displayAdmin";
            _handled = true;
        };
    };

    // Earplugs
    case DIK_O: {
        if (_isShift) then {
            [] call CQC_fnc_setUnitEarplugs;
            _handled = true;
        };
    };

    // Holster weapon
    case DIK_H: {
        if (_isShift) then {
            [] call CQC_fnc_holsterUnitWeapon;
            _handled = true;
        };
    };

    // Vehicle spawn menu
    case DIK_2: {
        if (_isShift && !isNil {missionNamespace getVariable "CQC_player_currentArena"} && {[] call CQC_fnc_canSelectVehicle}) then {
            createDialog "CQC_displaySelectVehicle";
            _handled = true;
        };
    };

};

_handled;