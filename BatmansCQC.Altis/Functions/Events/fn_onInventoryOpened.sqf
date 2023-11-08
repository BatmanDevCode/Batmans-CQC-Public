/*
 File: fn_onInventoryOpened.sqf
 Author: FragS
 Description: Handles inventory display
*/

params [
    ["_unit", objNull, [objNull]],
    ["_container", objNull, [objNull]]
];

private _object = objectParent _container;

if (_object != _unit && {_object isKindOf "Man"}) exitWith {true};