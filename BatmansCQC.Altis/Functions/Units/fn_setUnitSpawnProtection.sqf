#include "..\script_component.hpp"
/*
 File: fn_setUnitSpawnProtection.sqf
 Author: FragS
 Description: Enable/Disable weapon fire and godmode.
*/

params [["_state", false, [true]]];

[_state] call CQC_fnc_disableUnitFire;

player allowDamage !(_state);

player setVariable ["god", _state, true];