/*
 File: fn_initPlayer.sqf
 Author: FragS
 Description: Loads events, scripts and variables for client.
*/

// Wait for game display
waitUntil {!isNull player && {player isEqualTo player} && {!isNull (findDisplay 46)} && {time > 0}};

// Start init display
endLoadingScreen;
createDialog "CQC_displayInit";

// Configure chat channels
0 enableChannel [false, false];
1 enableChannel [true, false];
2 enableChannel [false, false];
3 enableChannel [false, false];
4 enableChannel [true, true];
5 enableChannel [true, true];

// Setup variables
private _initVars = [] call CQC_fnc_initVariables;

// Setup event handlers
private _initEH = [] call CQC_fnc_initEventHandlers;

// Create player tags
[] call CQC_fnc_initPlayerTags;

// Enable jump script
[] call CQC_fnc_initJump;

// Add actions
[] call CQC_fnc_addPlayerActions;

// Remove FAKs
player removeItems "FirstAidKit";

// Disable Shooting
[true] call CQC_fnc_setUnitSpawnProtection;

// Check if player is init has completed correctly
if (_initVars && _initEH) then {
	["onInitStageChanged", [3]] call CQC_displayInit_script;
	[] spawn {
		sleep 3;
		closeDialog 0;
		"CQC_hud" cutRsc ["CQC_hud", "PLAIN", 0, false];
	};
} else {
	closeDialog 0;
	["Initialization Failed", false, 0] call BIS_fnc_endMission;
};