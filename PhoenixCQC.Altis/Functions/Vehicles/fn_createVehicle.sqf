/*
 File: fn_createVehicle.sqf
 Author: FragS
 Description: Spawns the given vehicle.
*/

params [
    ["_class", "", [""]], 
    ["_position", position player, [[]]],
    ["_markers", [], [[]]],
    ["_placement", 0, [0]],
    ["_special", "", [""]],
    ["_dir", 0, [0]]
    ["_moveIn" false, [true]],
    ["_template", "", [""]]
];

private _vehicle = createVehicle [_class, _position, _markers, _placement, _special];

_vehicle setDir _dir;

switch (true) do {
    case (_class isKindOf "Car"): { 

        _vehicle addEventHandler ["HandleDamage", CQC_fnc_onVehicleHandleDamage];
        _vehicle setDir (getDir player);
        _vehicle setVehicleAmmo 0;
        _vehicle setVehicleAmmoDef 0;

        clearWeaponCargoGlobal _vehicle;
        clearMagazineCargoGlobal _vehicle;
        clearItemCargoGlobal _vehicle;
        clearBackpackCargoGlobal _vehicle;

    };

    case (_class isKindOf "Air"): { 
        
        _vehicle setVariable ["BIS_enableRandomization", false];   

        clearWeaponCargoGlobal _vehicle;   
        clearMagazineCargoGlobal _vehicle;   
        clearItemCargoGlobal _vehicle;  

        _vehicle addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

        _vehicle addEventHandler ["Fired", {
	        params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

            private _projectiles = _gunner getVariable ["CQC_player_activeProjectiles", []];
    
            _projectiles pushback _projectile;

            _gunner setVariable ["CQC_player_activeProjectiles", _projectiles];
        }];
    };

    case (_class isKindOf "Tank"): { 
        
        clearWeaponCargoGlobal _vehicle;
        clearMagazineCargoGlobal _vehicle;
        clearItemCargoGlobal _vehicle;
        clearBackpackCargoGlobal _vehicle;

        _vehicle addEventHandler ["Fired", {
	        params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

            private _projectiles = _gunner getVariable ["CQC_player_activeProjectiles", []];
    
            _projectiles pushback _projectile;

            _gunner setVariable ["CQC_player_activeProjectiles", _projectiles];
        }];
    };
};

if (_moveIn) the {
    player moveInAny _vehicle;
    [false] call CQC_fnc_setUnitSpawnProtection;
};

private _currentVehicle = missionNamespace getVariable ["CQC_player_currentVehicle", objNull];

if !(isNull _currentVehicle) then {
    deleteVehicle _currentVehicle;
};

missionNamespace setVariable ["CQC_player_currentVehicle", _vehicle];
_vehicle setVariable ["Owner", player, true];