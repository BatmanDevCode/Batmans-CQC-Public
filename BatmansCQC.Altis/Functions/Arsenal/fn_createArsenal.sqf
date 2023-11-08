/*
 File: fn_createArsenal.sqf
 Author:
 Description:
*/

#define CFG_GEAR_(class, entry)          getArray (missionConfigFile >> "CfgGear" >> "Gear" >> class >> entry)

params [["_object", objNull, [objNull]]];

["AmmoboxInit", [_object, false, {true}]] spawn BIS_fnc_arsenal;

// Grab items from config
private _weapons = ((CFG_GEAR_("Weapons", "primary")) + (CFG_GEAR_("Weapons", "secondary")));
private _magazines = CFG_GEAR_("Magazines", "magazines");
private _attachments = ((CFG_GEAR_("Attachments", "scopes")) + (CFG_GEAR_("Attachments", "suppressors")) + (CFG_GEAR_("Attachments", "pointers")) + (CFG_GEAR_("Attachments", "bipods")));
private _accessories = CFG_GEAR_("Accessories", "accessories");
private _clothing = ((CFG_GEAR_("Clothing", "headgear")) + (CFG_GEAR_("Clothing", "facewear")) + (CFG_GEAR_("Clothing", "uniforms")) + (CFG_GEAR_("Clothing", "vests")));
private _backpacks = CFG_GEAR_("Clothing", "backpacks");

// Pushback the items to the object
[_object, _backpacks] call BIS_fnc_addVirtualBackpackCargo;
[_object, (_clothing + _attachments + _accessories)] call BIS_fnc_addVirtualItemCargo;
[_object, _magazines] call BIS_fnc_addVirtualMagazineCargo;
[_object, _weapons] call BIS_fnc_addVirtualWeaponCargo;