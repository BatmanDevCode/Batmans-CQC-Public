/*
 File: fn_createVehicleCar.sqf
 Author: FragS
 Description: Spawns the given ground vehicle.
*/

params [["_vehicleClass", "", [""]]];

private _emptyPos = position player findEmptyPosition [5,50, _vehicleClass];
private _vehicle = createVehicle [_vehicleClass, _emptyPos, [], 0, ""];

_vehicle addEventHandler ["HandleDamage", CQC_fnc_onVehicleHandleDamage];
_vehicle setDir (getDir player);
_vehicle setVehicleAmmo 0;
_vehicle setVehicleAmmoDef 0;

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;

player moveInAny _vehicle;

[false] call CQC_fnc_setUnitSpawnProtection;

private _currentVehicle = missionNamespace getVariable ["CQC_player_currentVehicle", objNull];

if !(isNull _currentVehicle) then {
    deleteVehicle _currentVehicle;
};

_currentVehicle = _vehicle;
missionNamespace setVariable ["CQC_player_currentVehicle", _currentVehicle];
_vehicle setVariable ["Owner", player, true];