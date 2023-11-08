/*
 File: fn_onInventoryClosed.sqf
 Author: FragS
 Description: Runs when player closes inventory
*/

params [
    ["_unit", objNull, [objNull]], 
    ["_container", objNull, [objNull]]
];

[] call CQC_fnc_restrictGear;

{
    if (_x isKindOf ["Rifle", configFile >> "CfgWeapons"] || {_x isKindOf ["Pistol", configFile >> "CfgWeapons"]}) then {
        player removeItemFromVest _x;
        player removeItemFromBackpack _x;
    };
} forEach (itemsWithMagazines player);
