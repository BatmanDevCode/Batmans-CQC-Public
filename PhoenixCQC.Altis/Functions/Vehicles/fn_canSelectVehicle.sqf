#include "..\script_component.hpp"
/*
 File: fn_canSelectVehicle.sqf
 Author: FragS
 Description: Check if the vehicle menu can be opened.
*/

private _return = true;
private _arena = missionNamespace getVariable ["CQC_player_currentArena", ""];
private _vehicles = getText (CFG_SPAWNS_REGULAR >> _arena >> "vehicles");

if (_vehicles isEqualTo "None" || (!isNull (objectParent player)) || (dialog)) exitWith {false};

_return;