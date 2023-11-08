/*
 File: fn_addVendorActions.sqf
 Author:
 Description:
*/

params [["_object", objNull, [objNull]]];

//[_object] call CQC_fnc_createArsenal;

[
    _object,
    "Select Arena",
    "",
    "CQC",
    [1,0,0,1],
    {
        createDialog "CQC_displaySelectArena";
    },
    "",
    3,
    [],
    0,
    true,
    true,
    ""
] call CQC_fnc_addAction;