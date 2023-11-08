#include "script_component.hpp"
/*
 File: displayProgress.sqf
 Author: FragS
 Description: Handles progress bar animation
*/

#define SELF                    CQC_displayProgress_script
#define VAR_EACHFRAME_HANDLE    "CQC_displayProgress_onEachFrame"
#define VAR_STARTTIME           CQC_displayProgress_startTime
#define VAR_RUNTIME             CQC_displayProgress_runTime
#define VAR_CANPROGRESS         CQC_displayProgress_canProgress
#define VAR_TEXT                CQC_displayProgress_actionText
#define VAR_EXITANIM            CQC_displayProgress_exitAnim
#define VAR_CODE                CQC_displayProgress_codeComplete
#define VAR_ARGS                CQC_displayProgress_codeArguments

disableSerialization;

params [
    ["_event", "", [""]],
    ["_args", [], [[]]]
];

switch _event do {
    case "onLoad": {
        _display = uiNamespace getVariable ["CQC_displayProgress", displayNull];
        private _ctrlPicture = _display displayCtrl IDC_DISPLAYPROGRESS_PICTURESTATUSICON;
        private _ctrlActionText = _display displayCtrl IDC_DISPLAYPROGRESS_STATICACTION;
        private _ctrlProgress = _display displayCtrl IDC_DISPLAYPROGRESS_PROGRESS;
        
        // EachFrame EH
        uiNamespace setVariable [VAR_EACHFRAME_HANDLE, addMissionEventHandler ["EachFrame", {["onEachFrame"] call SELF;}]];

        // Set action text and status picture
        _ctrlPicture ctrlSetText "a3\ui_f\data\gui\cfg\communicationmenu\transport_ca.paa";
        _ctrlActionText ctrlSetText VAR_TEXT;
        _ctrlProgress ctrlSetTextColor [0.8, 0, 0, 0.9];
    };

    case "onEachFrame": {
        private _display = uiNamespace getVariable ["CQC_displayProgress", displayNull];
        private _ctrlPercentage = _display displayCtrl IDC_DISPLAYPROGRESS_STATICPERCENTAGE;
        private _ctrlProgress = _display displayCtrl IDC_DISPLAYPROGRESS_PROGRESS;

        if (VAR_CANPROGRESS) then {
            private _newProgress = (diag_tickTime - VAR_STARTTIME) / VAR_RUNTIME;
            _ctrlProgress progressSetPosition _newProgress;
            _ctrlPercentage ctrlSetText format ["%1%2", round (progressPosition _ctrlProgress * 100), "%"];
        
            if (progressPosition _ctrlProgress >= 1) then {
                ["onProgressComplete"] call SELF;
            };

            if (!dialog) then {
                ["onProgressCancel"] call SELF;
            };
        };

    };

    case "onProgressComplete": {
        _display = uiNamespace getVariable ["CQC_displayProgress", displayNull];
        private _ctrlPicture = _display displayCtrl IDC_DISPLAYPROGRESS_PICTURESTATUSICON;
        private _ctrlProgress = _display displayCtrl IDC_DISPLAYPROGRESS_PROGRESS;
        
        VAR_CANPROGRESS = false;
        removeMissionEventHandler ["EachFrame", uiNamespace getVariable [VAR_EACHFRAME_HANDLE, 0]];

        call VAR_CODE;

        _ctrlPicture ctrlSetText MISSION_ROOT + "GUI\data\displays\displayProgress\tick_ca.paa";
        _ctrlProgress ctrlSetTextColor [0, 0.6, 0, 0.9];
        "CQC_progressLayer" cutFadeOut 1;
        closeDialog 0;

        player playMoveNow VAR_EXITANIM;
    };

    case "onProgressCancel": {
        private _display = uiNamespace getVariable ["CQC_displayProgress", displayNull];
        private _ctrlPicture = _display displayCtrl IDC_DISPLAYPROGRESS_PICTURESTATUSICON;
        private _ctrlActionText = _display displayCtrl IDC_DISPLAYPROGRESS_STATICACTION;
        
        VAR_CANPROGRESS = false;
        removeMissionEventHandler ["EachFrame", uiNamespace getVariable [VAR_EACHFRAME_HANDLE, 0]];

        _ctrlPicture ctrlSetText MISSION_ROOT + "GUI\data\displays\displayProgress\cross_ca.paa";
        "CQC_progressLayer" cutFadeOut 1;
        closeDialog 0;    
        
        player playMoveNow VAR_EXITANIM;
    };

    case "onUnload": {
        uiNamespace setVariable [VAR_EACHFRAME_HANDLE, nil];
        VAR_STARTTIME = nil;
        VAR_RUNTIME = nil;
        VAR_CANPROGRESS = nil;
        VAR_TEXT = nil;
        VAR_CODE = nil;
        VAR_ARGS = nil;
    };
};