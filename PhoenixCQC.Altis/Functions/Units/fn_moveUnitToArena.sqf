#include "..\script_component.hpp"
/*
 File: fn_moveUnitToArena.sqf
 Author: FragS
 Description: Send player to arena with given parameters.
*/

params [
    ["_marker", "", [""]],
    ["_spawnProtection", 0, [0]],
    ["_forceLoadout", "", [""]]
];

private _currentArena = missionNamespace getVariable ["CQC_player_currentArena", ""];

if (_currentArena != "") then {
    private _currentArenaMarkers = getArray (CFG_SPAWNS_REGULAR >> _currentArena >> "markers");
    if (_marker in _currentArenaMarkers) exitWith {};
};

player setPos (getMarkerPos _marker);
player setDir (markerDir _marker);

if (_spawnProtection > 0) then {
    [true] call CQC_fnc_setUnitSpawnProtection;

    [{if ([] call CQC_fnc_canSelectVehicle) then {createDialog "CQC_displaySelectVehicle"};}, [], 1.5] call CQC_fnc_waitAndExecute;

} else {
    [false] call CQC_fnc_setUnitSpawnProtection;
};

if (_forceLoadout != "") then {
    [player, _forceLoadout] call CQC_fnc_setUnitLoadout;
};

if (_currentArena == "Pawnee") then {["B_Heli_Light_01_dynamicLoadout_F"] call CQC_fnc_createVehicleAir};
if (_currentArena == "AirTank") then {
    setViewDistance 3500; 
    CQC_thread_activeProjectiles = [] spawn {
        while {true} do {
            call CQC_fnc_activeProjectiles; 
            sleep 3;
        };
    };
};