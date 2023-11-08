/*
 File: fn_onPlayerRespawn.sqf
 Author: FragS
 Description: Runs when local unit respawns
*/

// Reset variables
player setVariable ["god", false, true];
player setVariable ["hidden", false, true];
player setVariable ["frozen", false, true];
player setVariable ["speed", false, true];

deleteMarkerLocal CQC_combatZoneMarker;
CQC_combatZoneMarker = nil;

missionNamespace setVariable ["CQC_player_currentArena", nil];

// Adjust combat properties
player enableFatigue false;
player setCustomAimCoef 0.0;
player switchCamera "EXTERNAL";

// Add actions
[] call CQC_fnc_addPlayerActions;

// Set view distance
setViewDistance 350;

// Restore previous loadout
player setUnitLoadout (player getVariable["Saved_Loadout",[]]);
player forceWeaponFire [currentWeapon player, "FullAuto"];
player setAmmo [primaryWeapon player, 1000000];
player addMagazine (currentMagazine player);

// Disable shooting
[true] call CQC_fnc_setUnitSpawnProtection;
player setVariable ["inSpawn", true, true];

// Close all displays
[] call CQC_fnc_closeAllDisplays;

// Open displaySelectArena
createDialog "CQC_displaySelectArena";