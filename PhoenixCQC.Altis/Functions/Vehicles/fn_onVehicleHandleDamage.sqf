/*
 File: fn_canSelectVehicle.sqf
 Author: FragS
 Description: Handles the damage of vehicles
*/

params [
    ["_vehicle", objNull, [objNull]],
    ["_hitSelection", "", [""]],
    ["_damage", 0, [0]],
    ["_source", objNull, [objNull]],
    ["_projectile", "", [""]],
    ["_hitPartIndex", 0, [0]],
    ["_instigator", objNull, [objNull]],
    ["_hitPoint", "", [""]]
];

_oldDamage = _vehicle getHitPointDamage _hitPoint;

if (_projectile isEqualTo "") then {   
    if (_hitPoint in ["hitEngine", "hitFuel"]) then {
        _damage = _oldDamage;
    };
};

_damage;