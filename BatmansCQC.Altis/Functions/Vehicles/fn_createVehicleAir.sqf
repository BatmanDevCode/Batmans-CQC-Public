/*
 File: fn_createVehicleAir.sqf
 Author: FragS
 Description: Spawns the given air vehicle.
*/

params [["_vehicleClass", "", [""]]];

private _vehicle = createVehicle [_vehicleClass, position player, [], 0, "FLY"];  
_vehicle setVariable ["BIS_enableRandomization", false];   

clearWeaponCargoGlobal _vehicle;   
clearMagazineCargoGlobal _vehicle;   
clearItemCargoGlobal _vehicle;  

_vehicle addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

player moveInDriver _vehicle;

[false] call CQC_fnc_setUnitSpawnProtection;

private _currentVehicle = missionNamespace getVariable ["CQC_player_currentVehicle", objNull];

if !(isNull _currentVehicle) then {
    deleteVehicle _currentVehicle;
};

_currentVehicle = _vehicle;
missionNamespace setVariable ["CQC_player_currentVehicle", _currentVehicle];
_vehicle setVariable ["Owner", player, true];

_vehicle addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

    private _projectiles = _gunner getVariable ["CQC_player_activeProjectiles", []];
    
    _projectiles pushback _projectile;

    _gunner setVariable ["CQC_player_activeProjectiles", _projectiles];
}];