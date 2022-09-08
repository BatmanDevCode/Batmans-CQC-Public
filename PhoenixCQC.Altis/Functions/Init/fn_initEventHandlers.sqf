/*
 File: fn_initEventHandlers.sqf
 Author: FragS
 Description: Sets up required event handlers for the mission.
*/

private _return = true;

// Scripted Event Handlers
[missionNamespace, "OnGameInterrupt", {_display call CQC_fnc_onGameInterrupt;}] call BIS_fnc_addScriptedEventHandler;
//[missionnamespace, "arsenalOpened", {_display call CQC_fnc_arsenalOverride}] call BIS_fnc_addScriptedEventhandler;
[missionnamespace, "arsenalClosed", {[] call CQC_fnc_restrictGear;}] call BIS_fnc_addScriptedEventhandler;

// Display Event Handlers
findDisplay 46 displaySetEventHandler ["KeyDown", "_this call CQC_fnc_onKeyDown"];
findDisplay 46 displaySetEventHandler ["KeyUp", "_this call CQC_fnc_onKeyUp"];

// inGameUI Event Handlers
inGameUISetEventHandler ["Action", "_this call CQC_fnc_onAction"];

// Event Handlers
player addEventHandler ["GetInMan", CQC_fnc_onGetInMan];
player addEventHandler ["GetOutMan", CQC_fnc_onGetOutMan];
player addEventHandler ["HandleDamage", CQC_fnc_onHandleDamage];
player addEventHandler ["InventoryOpened", CQC_fnc_onInventoryOpened];
player addEventHandler ["InventoryClosed", CQC_fnc_onInventoryClosed];
player addEventHandler ["Killed", CQC_fnc_onPlayerKilled];
player addEventHandler ["Respawn", CQC_fnc_onPlayerRespawn];
player addEventHandler ["Reloaded", CQC_fnc_onReloaded];

// Multiplayer Event Handlers
player addMPEventHandler ["MPKilled", CQC_fnc_onMPKilled];

["onInitStageChanged", [2]] call CQC_displayInit_script;
_return;