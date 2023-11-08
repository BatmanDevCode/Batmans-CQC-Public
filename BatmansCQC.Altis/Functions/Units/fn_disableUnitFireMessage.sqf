/*
 File: fn_disableUnitFireMessage.sqf
 Author: FragS
 Description: Provides appropriate message when unit fire is attempted whilst disabled.
*/

private _arena = missionNamespace getVariable ["CQC_player_currentArena", ""];

if (time - (missionNamespace getVariable ["CQC_unit_lastClick", 0]) > 0) then {
    if (_arena == "") then {
        ["Warning", "Shooting in spawn is not allowed", "warning", 5] call CQC_fnc_notificationSystem;
    } else {
        ["Warning", "You must spawn a vehicle before shooting", "warning", 5] call CQC_fnc_notificationSystem;
    };
    CQC_unit_lastClick = time + 5;
};