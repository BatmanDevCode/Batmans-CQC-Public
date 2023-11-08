/*
 File: fn_onReloaded.sqf
 Author: FragS
 Description: Runs when player reloads a weapon
*/

params [
  ["_unit", objNull, [objNull]],
  ["_weapon", "", [""]],
  ["_muzzle", "", [""]],
  ["_newMagazine", [], [[]]],
  ["_oldMagazine", [], [[]]]
];

// Infinite Mags
_magType = currentMagazine player;
player removeMagazines _magType;
player addMagazine _magType;