/*
 File: fn_hasDisplay.sqf
 Author: FragS
 Description: Checks if given display is active
*/

params [["_display", displayNull, [displayNull]]];

!isNull (uiNamespace getVariable [_display, displayNull])