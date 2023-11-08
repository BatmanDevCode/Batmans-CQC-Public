/*
 File: fn_onPlayerKilled.sqf
 Author: FragS
 Description: Runs when player local unit is killed.
*/

params ["_oldUnit", "_killer", "_respawn", "_respawnDelay"];

if  !((vehicle _oldunit) isEqualTo _oldunit) then {
    UnAssignVehicle _oldunit;
    _oldunit action ["getOut", vehicle _oldunit];
    _oldunit setPosATL [(getPosATL _oldunit select 0) + 3, (getPosATL _oldunit select 1) + 1, 0];
};

// Add kill/death/headshot to player vars
if (player == _killer && player == _oldUnit) then 
{}
else
{
    if (player == _oldUnit) then 
    {
        private _deaths = localNamespace getVariable "Batman_CQC_KD_Deaths_G2";
        private _addDeaths = _deaths + 1;
        localNamespace setVariable ["Batman_CQC_KD_Deaths_G2", _addDeaths];
    };
};

// Update K/D vars in profileNamspace
private _deaths = localNamespace getVariable "Batman_CQC_KD_Deaths_G2";
profileNamespace setVariable ["Batman_CQC_KD_Deaths_G2", _deaths];
player setVariable ["Saved_Loadout",getUnitLoadout player];
removeAllWeapons player;
player setCustomAimCoef 0.0;

// Terminate activeProjectiles thread
if !(missionNamespace getVariable ["CQC_player_currentArena", ""] == "AirTank") then {
    terminate CQC_thread_activeProjectiles;
    CQC_thread_activeProjectiles = scriptNull;
};

// Delete old vehicle
private _currentVehicle = missionNamespace getVariable ["CQC_player_currentVehicle", objNull];

if !(isNull _currentVehicle) then {
    deleteVehicle _currentVehicle;
};

// Close all displays
[] call CQC_fnc_closeAllDisplays;