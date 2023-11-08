/*
 File: fn_addPlayerAction.sqf
 Author: FragS
 Description: Adds actions to local unit.
*/

[
    player,
    "",
    "",
    "",
    [],
    {
        [] call CQC_fnc_disableUnitFireMessage;
    },
    "player getVariable 'CQC_player_disableFire';",
    0,
    [],
    -1,
    false,
    true,
    "DefaultAction"
] call CQC_fnc_addAction;

[
    player,
    "Heal",
    "\a3\ui_f\data\IGUI\Cfg\Actions\heal_ca",
    "",
    [],
    {
        ["Healing", true, {[] call CQC_fnc_healUnit}, [], 2] spawn CQC_fnc_startProgress;
    },
    "damage _target > 0 && vehicle player == player",
    0,
    [],
    0,
    true,
    true,
    ""
] call CQC_fnc_addAction;