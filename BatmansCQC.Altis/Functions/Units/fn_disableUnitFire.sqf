/*
 File: fn_disableUnitFire.sqf
 Author: FragS
 Description: Stops unit from being able to fire weapon
*/

params [["_state", false, [false]]];

player setVariable ["CQC_player_disableFire", _state, true];