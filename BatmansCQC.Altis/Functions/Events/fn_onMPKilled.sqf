/*
 File: fn_onMPKilled.sqf
 Author: FragS
 Description: Runs on all clients when a unit is killed.
*/

if (!hasInterface) exitWith {};

params [
    ["_unit", objNull, [objNull]],
    ["_killer", objNull, [objNull]],
    ["_instigator", objNull, [objNull]],
    ["_useEffects", false, [false]]
];

// Add kill to player
if (player == _instigator && {player != _unit}) then 
{
  _kills = localNamespace getVariable "Batman_CQC_KD_Kills_G2";
  _addKill = _kills + 1;

  localNamespace setVariable ["Batman_CQC_KD_Kills_G2", _addKill];

  _kills = localNamespace getVariable "Batman_CQC_KD_Kills_G2";
  profileNamespace setVariable ["Batman_CQC_KD_Kills_G2", _kills];
};

//["", format ["<t color='#00a2ff'>%2</t> was fragged by <t color='#00cf22'>%1</t> with <t color='#b8001c'>%3%4</t> health remaining", name _killer, name _unit, round((1 - (damage _killer)) * 100), "%"] , 10] remoteExecCall ["CQC_fnc_kill_notification", allPlayers, false];