#include "script_component.hpp"

#define SELF                CQC_hints_script

disableSerialization;

params [
    ["_event", "", [""]],
    ["_args", []]
];

switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        CQC_activeHints = [];

    };
    
    case "createHint": {
        _args params [
            ["_display", displayNull, [displayNull]],
            ["_color", [], [[]], 4],
            ["_text", "", [""]],
            ["_time", 10, [0]]
        ];

        private _ctrlHint = _display ctrlCreate ["CQC_ctrlHint"];

        private _ctrlBackground = _ctrlHint controlsGroupCtrl 1010;
        private _ctrlBar = _ctrlHint controlsGroupCtrl 1020;
        private _ctrlText = _ctrlHint controlsGroupCtrl 1030;
        _ctrlBar ctrlSetBackgroundColor _color;
        _ctrlText ctrlSetStructuredText parseText _text;

        CQC_activeHints pushBack [_ctrlHint, _time];

        if (count CQC_activeHints > 1) then {};
    };

    case "onUnload": {
        removeMissionEventHandler ["Draw3D", HUD_DRAW3D_HANDLE];
        HUD_DRAW3D_HANDLE = nil;
    };
};