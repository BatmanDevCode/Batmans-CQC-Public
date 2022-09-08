/*
 File: fn_getUnitByName.sqf
 Author: FragS
 Description: Gets unit by given name
*/

params [["_name", "", [""]]];

private _unit = objNull;

{
   if (name _x == _name) exitWith
    {
        _unit = _x;
    }; 
} forEach ALLPLAYERSNOHC;

_unit;