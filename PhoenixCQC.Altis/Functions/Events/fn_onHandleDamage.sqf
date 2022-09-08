#include "..\script_component.hpp"
/*
 File: fn_onHandleDamage.sqf
 Author: FragS
 Description: Handles player damage
*/

params [
    ["_unit", objNull, [objNull]],
    ["_hitSelection", "", [""]],
    ["_damage", 0, [0]],
    ["_source", objNull, [objNull]],
    ["_projectile", "", [""]],
    ["_hitPartIndex", 0, [0]],
    ["_instigator", objNull, [objNull]],
    ["_hitPoint", "", [""]]
];

private _oldDamage = _unit getHitIndex _hitPartIndex;

if (_hitPoint == "incapacitated") exitWith {0;};

private _sourceParent = objectParent _source;
if ( 
	_sourceParent isKindOf "Air" 
	|| { _sourceParent isKindOf "Car" } 
	|| { _sourceParent isKindOf "Boat" }
	|| { _sourceParent isKindOf "Submarine" } 
	|| { _sourceParent isKindOf "Plane"} 
	|| { _sourceParent isKindOf "Tank"} 
) then {
	if (
		_source isNotEqualTo _unit 
		&& {_instigator isNotEqualTo _unit}
		&& {time - (missionNamespace getVariable ["CQC_onHandleDamage_timeSinceVDM", 0]) > 0}
	) then {
		systemChat format ["You were run over by %1", name _source];
		CQC_onHandleDamage_timeSinceVDM = time + 5;
	};
	_damage = _oldDamage;
} else {
	if (_hitPoint in ["hithands", "hitarms", "hitlegs"]) then {
		_damage = _oldDamage;
	} else {
		private _unitParent = objectParent _unit;
		if (!isNull _unitParent) then {
			if (_projectile != "") then {
				private _value = getNumber (CFG_VEHICLE_ATTRIBUTES >> (typeOf _unitParent) >> "damageReduction");
				private _newDamage = _damage - _oldDamage;
				_damage = _newDamage - (_newDamage * _value) + _oldDamage;
			};
		};
	};
};

_damage;