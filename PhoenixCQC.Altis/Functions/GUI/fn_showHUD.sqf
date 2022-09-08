/*
 File: fn_showHUD.sqf
 Author: FragS
 Description: Enables or disables HUD
*/

params [["_event", "", [""]]];

switch _event do {
    case "show": {
        if !(isNull (uiNamespace getVariable ["CQC_hud", displayNull])) then 
        {

        } else {
            "CQC_hud" cutRsc ["CQC_hud", "PLAIN", 0, false];
        };
    };
    
    case "hide": {
        if (isNull (uiNamespace getVariable ["CQC_hud", displayNull])) then 
        {

        } else {
            "CQC_hud" cutText ["", "PLAIN"];
        };
    };
};