/*
 File: fn_removeUnitLoadout.sqf
 Author: FragS
 Description: Clears player inventory
*/

params [["_unit", objNull, [objNull]]];

if (isNull _unit) exitWith {};

removeAllWeapons _unit;
removeAllAssignedItems _unit;
removeGoggles _unit;
removeHeadgear _unit;
removeVest _unit;
removeUniform _unit;
removeBackpack _unit;