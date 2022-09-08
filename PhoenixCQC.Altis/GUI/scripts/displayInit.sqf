#include "script_component.hpp"
/*
 File: displayInit.sqf
 Author: FragS
 Description: Shown during init stage.
*/

#define SELF                    CQC_displayInit_script
#define DISPLAY					uiNamespace getVariable ["CQC_displayInit", displayNull]
#define VAR_EACHFRAME_HANDLE    "CQC_displayInit_onEachFrame"
#define VAR_CAMERAID            "CQC_displayInit_cameraID"

disableSerialization;

params [
    ["_event", "", [""]],
    ["_args", [], [[]]]
];

switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];
        private _ctrlPictureRadial = _display displayCtrl IDC_DISPLAYINIT_PICTURERADIAL;

        // KeyDown EH
        _display displayAddEventHandler ["KeyDown", {["onKeyDown", _this] call SELF;}];
        
        // Select random arena for circling 
        private _location = selectRandom [["og", 325], ["church", 300], ["kavala", 300], ["lumberyardh", 275], ["milbase", 300], ["airport", 300], ["ww2", 200]];
        _display setVariable ["location", _location];

        // Initial angle
        _ctrlPictureRadial ctrlSetAngle [360, 0.5, 0.5];
        
        // Raise view distance
        setViewDistance 650;

        // EH for camera and radial image rotation
        uiNamespace setVariable [VAR_EACHFRAME_HANDLE, addMissionEventHandler ["EachFrame", {["onEachFrame"] call SELF;}]];
        
        // Define initial camera position
        private _camPos = (getMarkerPos (_location select 0)) getPos [250, 0];
		_camPos set [2, (_location select 1)]; 
		
        // Create camera
        private _camera = "camera" camCreate (ASLToATL _camPos);
		_camera camSetTarget (getMarkerPos (_location select 0));
		_camera camCommit 0;
        _camera cameraEffect ["INTERNAL","BACK"];
        showCinemaBorder false;
		uiNamespace setVariable [VAR_CAMERAID, _camera];
    };

    case "onEachFrame": {
        private _display = DISPLAY;
        private _ctrlPictureRadial = _display displayCtrl IDC_DISPLAYINIT_PICTURERADIAL;
        private _angle = ctrlAngle _ctrlPictureRadial select 0;
        private _camera = uiNamespace getVariable [VAR_CAMERAID, objNull];
        private _location = _display getVariable ["location", ["og", 325]];

        // Rotate radial image (1 second tick)
        if (_angle isEqualTo 360 && {ctrlCommitted _ctrlPictureRadial}) then {
            _ctrlPictureRadial ctrlSetAngle [0, 0.5, 0.5];
        };

        if (_angle isEqualTo 0 && {ctrlCommitted _ctrlPictureRadial}) then {
            _ctrlPictureRadial ctrlSetAngle [360, 0.5, 0.5, false];
            _ctrlPictureRadial ctrlCommit 1;
        };

        // Rotate camera image (0.15 second tick)
        if (camCommitted _camera) then {
            private _heading = _display getVariable ["heading", 0];

            // Calculate camera position
            private _camPos = (getMarkerPos (_location select 0)) getPos [250, _heading];
            _camPos set [2, (_location select 1)];

            // Reset heading after full rotation to avoid cam freeze
            if (_heading > 359) then {_heading = 0}; 

            // Set new position for camera (ASL to ATL conversion to avoid terrain height adjustment)
            _camera camsetPos (ASLToATL _camPos);
            _camera camCommit 0.15;
            
            // Increment Heading
            _heading = _heading + 1;
            _display setVariable ["heading", _heading];
        };
    };

    case "onKeyDown": {
        _args params [
            ["_display", displayNull, [displayNull]],
            ["_key", 0, [0]]
        ];

        switch true do {
            case (_key == DIK_ESCAPE): { 
                [
                    "Warning",
                    "Are you sure you wish to return to the lobby?",
                    "",
                    [
                        "Yes",
                        {endMission "CQC_End"}
                    ],
                    [
                        "No",
                        {}
                    ],
                    findDisplay 46
                ] call CQC_fnc_showMessage;

                true; 
            };

            default { false; };
        };
    };

    case "onInitStageChanged": {
        _args params [["_stage", 0, [0]]];
        private _display = DISPLAY;
        private _ctrlText = _display displayCtrl IDC_DISPLAYINIT_TEXTSTATUS1;

        switch _stage do {
            case 1: {_ctrlText ctrlSetText "Loading Scripts"};
            case 2: {_ctrlText ctrlSetText "Loading Preferences"};
            case 3: {_ctrlText ctrlSetText "Spawning In"};
        }
        
    };

    case "onUnload": {
        // Remove rotation EH
        removeMissionEventHandler ["EachFrame", uiNamespace getVariable [VAR_EACHFRAME_HANDLE, 0]];
        uiNamespace setVariable [VAR_EACHFRAME_HANDLE, nil];

        // Destroy camera
        (uiNamespace getVariable [VAR_CAMERAID, objNull]) cameraEffect ["terminate", "back"];
        camDestroy (uiNamespace getVariable [VAR_CAMERAID, objNull]);
        uiNamespace setVariable [VAR_CAMERAID, nil];
        
        // Lower view distance
        setViewDistance 350;
    };
};