/*
 File: fn_holsterUnitWeapon.sqf
 Author: FragS
 Description: Handles holstering of weapons
*/

if !(currentWeapon player isEqualTo "") then
{
  player action ["SwitchWeapon", player, player, -1];
} else {
  player action ["SwitchWeapon", player, player, 1];
};