#include "script_component.hpp"

#define SELF                CQC_hud_script
#define VAR_DRAW3D_HANDLE   CQC_hud_onDraw3D    
#define COLOUR_ORANGE       [0.84, 0.39, 0, 0.75]
#define COLOUR_RED          [0.69, 0.01, 0, 0.75]

disableSerialization;

params [
    ["_event", "", [""]],
    ["_args", []]
];

switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        HUD_DRAW3D_HANDLE = addMissionEventHandler ["Draw3D", {["hudDraw3D", []] call SELF}];

    };
    
    case "hudDraw3D": {
        _display = uiNamespace getVariable ["CQC_hud", displayNull];
        private _ctrlHudGroup = _display displayCtrl IDC_HUD_GROUP;

        (_ctrlHudGroup controlsGroupCtrl IDC_HUD_HEALTHBAR) progressSetPosition (1 - damage player);
        (_ctrlHudGroup controlsGroupCtrl IDC_HUD_HEALTHPERCENTAGE) ctrlSetText format ["%1%2", round ((1 - damage player) * 100), "%"];
        private _time = systemTime apply {if (_x < 10) then {"0" + str _x} else {str _x}};
        (_ctrlHudGroup controlsGroupCtrl IDC_HUD_TIME) ctrlSetText format ["%1:%2", _time select 3, _time select 4];

        _kills = localNamespace getVariable "Batman_CQC_KD_Kills_G2";
        _deaths = localNamespace getVariable "Batman_CQC_KD_Deaths_G2";
        _kdratio = parseNumber ((_kills / _deaths) toFixed 2);
        
        (_ctrlHudGroup controlsGroupCtrl IDC_HUD_K) ctrlSetText format ["%1", _kills];
        (_ctrlHudGroup controlsGroupCtrl IDC_HUD_D) ctrlSetText format ["%1", _deaths];
        (_ctrlHudGroup controlsGroupCtrl IDC_HUD_KD) ctrlSetText format ["%1", _kdratio];

        private _damage = 1 - (damage player);

        if (_damage < 0.25) then {
            (_ctrlHudGroup controlsGroupCtrl IDC_HUD_HEALTHBAR) ctrlSetTextColor COLOUR_RED;
        } else {
            if (_damage < 0.5) then {
                (_ctrlHudGroup controlsGroupCtrl IDC_HUD_HEALTHBAR) ctrlSetTextColor COLOUR_ORANGE;
            } else {
                (_ctrlHudGroup controlsGroupCtrl IDC_HUD_HEALTHBAR) ctrlSetTextColor [0.1, 0.1, 0.1, 0.75];
            };
        };
    };

    case "onUnload": {
        removeMissionEventHandler ["Draw3D", HUD_DRAW3D_HANDLE];
        HUD_DRAW3D_HANDLE = nil;
    };
};