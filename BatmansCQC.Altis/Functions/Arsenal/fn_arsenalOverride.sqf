/*
 File: fn_arsenalOverride.sqf
 Author:
 Description:
*/

params [["_display", displayNull, [displayNull]]];


['buttonLoad',[_display]] call bis_fnc_arsenal;[_display] call CQC_fnc_loadInventoryOverride;