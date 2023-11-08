#include "..\script_component.hpp"
/*
 File: fn_setUnitLoadout.sqf
 Author: FragS
 Description: Sets pre-configured loadout on unit
*/

params [
    ["_unit", objNull, [objNull]], 
    ["_loadoutClass", "", [""]]
];

removeAllWeapons _unit;
removeAllAssignedItems _unit;
removeGoggles _unit;
removeHeadgear _unit;
removeVest _unit;
removeUniform _unit;
removeBackpack _unit;

_unit setUnitLoadout (getArray (CFG_GEAR_LOADOUTS >> _loadoutClass >> "loadout"));