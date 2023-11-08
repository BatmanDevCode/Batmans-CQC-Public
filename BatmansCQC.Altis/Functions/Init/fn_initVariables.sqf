#include "..\script_component.hpp"
/*
 File: fn_initVariables.sqf
 Author: FragS
 Description: Sets client variable on mission start.
*/

private _return = true;

//Mission Path
private _root = parsingNamespace getVariable "MISSION_PATH";
missionNamespace setVariable ["MISSION_ROOT", _root];

// KD System
if (isNil {profileNamespace getVariable "Batman_CQC_KD_Kills_G2"} ) then {profileNamespace setVariable ["Batman_CQC_KD_Kills_G2", 1];};
if (isNil {profileNamespace getVariable "Batman_CQC_KD_Deaths_G2"} ) then {profileNamespace setVariable ["Batman_CQC_KD_Deaths_G2", 1];};

_Batman_CQC_KD_Kills = profileNamespace getVariable "Batman_CQC_KD_Kills_G2";
localNamespace setVariable ["Batman_CQC_KD_Kills_G2", _Batman_CQC_KD_Kills];
_Batman_CQC_KD_Deaths = profileNamespace getVariable "Batman_CQC_KD_Deaths_G2";
localNamespace setVariable ["Batman_CQC_KD_Deaths_G2", _Batman_CQC_KD_Deaths];

// Nametag System
_name = name player;
_randomIcon = selectRandom ["30k","bmav","C_date","cry","default","katheeri","lako","lol","notamuseddate","poggies","shock","sit","mikey","auto"];
_icon = format ["Data\Icons\%1.paa", _randomIcon];
_randomSubtitle = selectRandom ["CQC Fragger"];
player setVariable ["CQC_tags_Init", 1, true];
player setVariable ["CQC_tags_Title", _name, true];
player setVariable ["CQC_tags_TitleColour", [0,0.8,0,1], true];
player setVariable ["CQC_tags_Subtitle", _randomSubtitle, true];
player setVariable ["CQC_tags_SubtitleColour", [0.9,0.9,0.9,1], true];
player setVariable ["CQC_tags_Icon", _icon, true];

// Admin
if !(isNil {call (missionNamespace getVariable "CQC_adminLevel")}) exitWith {endMission "CQC_InitError"};

private _admins = getArray (CFG_ADMIN_RANKS);

{
    scopeName "admin";

    private _id = _x select 0;
    private _rank = _x select 1;
    private _alias = _x select 2;

    if (_id == getPlayerUID player) then {
        ["CQC_adminLevel", _rank] call CQC_fnc_setConstant;
        ["CQC_player_alias", _alias, true, player] call CQC_fnc_setConstant;
        breakOut "admin";
    } else {
        if (count _admins == (_forEachIndex + 1)) then {
            ["CQC_adminLevel", 0] call CQC_fnc_setConstant;
            ["CQC_player_alias", "", true, player] call CQC_fnc_setConstant;
        };
    };
} forEach _admins;

["onInitStageChanged", [1]] call CQC_displayInit_script;
_return;