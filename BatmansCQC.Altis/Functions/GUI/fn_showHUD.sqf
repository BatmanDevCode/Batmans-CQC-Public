/*
 File: fn_showHUD.sqf
 Author: FragS
 Description: Enables or disables HUD
*/

params [["_show", false, [true]]];

if (_show) then {
    if (isNull (uiNamespace getVariable ["CQC_hud", displayNull])) then {
        "CQC_hud" cutRsc ["CQC_hud", "PLAIN", 0, false];
    }; 
} else {
    if !(isNull (uiNamespace getVariable ["CQC_hud", displayNull])) then {
        "CQC_hud" cutText ["", "PLAIN"];
    };
};