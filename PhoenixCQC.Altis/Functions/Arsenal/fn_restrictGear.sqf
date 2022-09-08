/*
 File: fn_restrictGear.sqf
 Author:
 Description:
*/
player removePrimaryWeaponItem "10Rnd_50BW_Mag_F";

private _uniform = uniform player;
private _vest = vest player;
private _uniName = getText (configfile >> "CfgWeapons" >> _uniform >> "displayName");
private _armorValue = getNumber (configfile >> "CfgWeapons" >> _vest >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Body" >> "passThrough");
private _uniforms = ["U_B_Wetsuit","U_O_Wetsuit","U_I_Wetsuit","U_O_CombatUniform_ocamo","U_O_CombatUniform_oucamo","U_O_T_Soldier_F","U_O_R_Gorka_01_F","U_O_R_Gorka_01_brown_F	","U_O_R_Gorka_01_camo_F","U_O_R_Gorka_01_black_F","U_O_PilotCoveralls"];

if  (_uniform in _uniforms && {_armorValue <= 0.9} && {_vest != ""}) then {
  removeUniform player;
  ["Warning", format ["<t font='RobotoCondensedBold'>%1</t> cannot be worn with vests that provide ballistic protection.", _uniName], "warning", 10] call CQC_fnc_notificationSystem;
};