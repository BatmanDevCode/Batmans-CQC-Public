/*
 File: fn_getUnitByUID.sqf
 Author: FragS
 Description: Gets unit by given steamID
*/

params [["_uid", "", [""]]];

private _unit = objNull;

{
   if (getPlayerUID _x == _uid) exitWith
    {
        _unit =_x;
    }; 
} forEach ALLPLAYERSNOHC;

_unit;