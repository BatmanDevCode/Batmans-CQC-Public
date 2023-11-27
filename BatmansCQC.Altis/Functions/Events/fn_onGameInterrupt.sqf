/*
 File: fn_onGameInterrupt.sqf
 Author: FragS
 Description: Handles esc menu
*/

disableSerialization;

params [["_display", displayNull, [displayNull]]];

// Define Controls
private _abortButton = _display displayCtrl 104;
private _respawnButton = _display displayCtrl 103;
private _fieldManual = _display displayCtrl 122;

// Modifiy Controls 
_respawnButton ctrlEnable false;
_fieldManual ctrlEnable false;
_fieldManual ctrlShow false;
_respawnButton ctrlSetText "Batmans CQC";
_abortButton ctrlSetText "LOG OUT";
_abortButton ctrlSetEventHandler ["ButtonClick","[] spawn CQC_fnc_onAbort; (findDisplay 49) closeDisplay 2; true"];