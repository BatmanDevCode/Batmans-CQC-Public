#include "script_component.hpp"
/*
 File: displayAdmin.sqf
 Author:
 Description: Called when the admin display is opened.
*/

#define COLOR_ENABLED                       [0, 0.48, 0.27, 1]
#define COLOR_ENABLED_STAFF                 [0.6, 0.1, 0, 1]
#define COLOR_DISABLED                      [1, 1, 1, 1]

// Setup Vars
VAR_SELECTED_UNIT = objNull;
VAR_LOCAL_UNIT = player;
VAR_CAMERA_MODE = "";
VAR_DISPLAY_BUSY = false;
VAR_DISPLAY_HIDDEN = false;
VAR_ALL_PLAYERS = allPlayers;
VAR_DRAW3D_ENABLED = true;

// Define display and controls
private _pdisplay = findDisplay IDD_DISPLAYADMIN_DISPLAY;
private _ctrlMap = _pdisplay displayCtrl IDC_DISPLAYADMIN_MAP;
private _ctrlTreeListUnits = _pdisplay displayCtrl IDC_DISPLAYADMIN_PANELLEFT_TREEUNITS;
private _ctrlButtonArsenal = _pdisplay displayCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONARSENAL;
private _ctrlButtonUnitImmune = _pdisplay displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONGOD;
private _ctrlButtonUnitInvis = _pdisplay displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONINVIS;
private _ctrlButtonUnitFreeze = _pdisplay displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONFREEZE;
private _ctrlButtonNotif = _pdisplay displayCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONNOTIF;
private _ctrlButtonStaff = _pdisplay displayCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONSTAFFONDUTY;
private _ctrlButtonToggleOn = _pdisplay displayCtrl IDC_DISPLAYADMIN_PANELLEFT_TOGGLEON;
private _ctrlButtonToggleOff = _pdisplay displayCtrl IDC_DISPLAYADMIN_PANELLEFT_TOGGLEOFF;
private _ctrlButtonProfile = _pdisplay displayCtrl IDC_DISPLAYADMIN_STATUSBAR_LINKGAMECP;
private _ctrlEditSearchTree = _pdisplay displayCtrl IDC_DISPLAYADMIN_PANELLEFT_EDITSEARCH;
private _ctrlButtonExpandTree = _pdisplay displayCtrl IDC_DISPLAYADMIN_PANELLEFT_BUTTONEXPAND;
private _ctrlButtonCollapseTree = _pdisplay displayCtrl IDC_DISPLAYADMIN_PANELLEFT_BUTTONCOLLAPSE;
private _ctrlTextHealth = _pdisplay displayCtrl IDC_DISPLAYADMIN_STATUSBAR_EDITHEALTH;
private _ctrlTextXPos = _pdisplay displayCtrl IDC_DISPLAYADMIN_STATUSBAR_EDITXPOS;
private _ctrlTextYPos = _pdisplay displayCtrl IDC_DISPLAYADMIN_STATUSBAR_EDITYPOS;
private _ctrlTextZPos = _pdisplay displayCtrl IDC_DISPLAYADMIN_STATUSBAR_EDITZPOS;
private _ctrlButton1PP = _pdisplay displayCtrl IDC_DISPLAYADMIN_CAMERABAR_BUTTON1PP;
private _ctrlButton3PP = _pdisplay displayCtrl IDC_DISPLAYADMIN_CAMERABAR_BUTTON3PP;
private _ctrlButtonFree = _pdisplay displayCtrl IDC_DISPLAYADMIN_CAMERABAR_BUTTONFREE;
private _ctrlButtonKill = _pdisplay displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONKILL;
private _ctrlButtonHeal = _pdisplay displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONHEAL;

// Disable spesific HUD features 
removeMissionEventHandler ["Draw3D", TAGS];
"JSTAR_Layer" cutFadeOut 2;
terminate CQC_HUD_HANDLE;

// General display and control EHs 
_ctrlEditSearchTree ctrlAddEventHandler ["SetFocus", {
    params [["_ctrl", controlNull, [controlNull]]];
    VAR_DISPLAY_BUSY = true;
}];

_ctrlEditSearchTree ctrlAddEventHandler ["KillFocus", {
    params [["_ctrl", controlNull, [controlNull]]];
    private _pdisplay = findDisplay IDD_DISPLAYADMIN_DISPLAY;
    private _ctrlMap = _pdisplay displayCtrl IDC_DISPLAYADMIN_MAP;
    
    VAR_DISPLAY_BUSY = false;
}];

_ctrlButtonToggleOn ctrlAddEventHandler ["ButtonClick", {
    params [["_ctrl", controlNull, [controlNull]]];
    _ctrl ctrlShow false;
    ctrlShow [IDC_DISPLAYADMIN_PANELLEFT, true];
}];

_ctrlButtonToggleOff ctrlAddEventHandler ["ButtonClick", {
    params [["_ctrl", controlNull, [controlNull]]];
    ctrlShow [IDC_DISPLAYADMIN_PANELLEFT, false];
    ctrlShow [IDC_DISPLAYADMIN_PANELLEFT_TOGGLEON, true];
}];

["adminEH", "onEachFrame", {
    if !(isNull VAR_SELECTED_UNIT) then {
    (_this select 0) ctrlSetText format ["%1%2", round((1 - (damage VAR_SELECTED_UNIT)) * 100), "%"];
    (_this select 1) ctrlSetText format ["%1", getPosASL VAR_SELECTED_UNIT select 0];
    (_this select 2) ctrlSetText format ["%1", getPosASL VAR_SELECTED_UNIT select 1];
    (_this select 3) ctrlSetText format ["%1", getPosASL VAR_SELECTED_UNIT select 2];
    }else{
      (_this select 0) ctrlSetText "";
      (_this select 1) ctrlSetText "";
      (_this select 2) ctrlSetText "";
      (_this select 3) ctrlSetText "";
    };
}, [_ctrlTextHealth,_ctrlTextXPos,_ctrlTextYPos,_ctrlTextZPos]] call BIS_fnc_addStackedEventHandler;

KEY_EH = _pdisplay displayAddEventHandler ["KeyDown", {
    params [
        ["_display", displayNull, [displayNull]],
        ["_dikCode", 0,           [0]],
        ["_shift",   false,       [false]]
    ];

    private _ctrlMap = _display displayCtrl IDC_DISPLAYADMIN_MAP;
    private _ctrlButtonToggleOn = _display displayCtrl IDC_DISPLAYADMIN_PANELLEFT_TOGGLEON;
    if (_dikCode isEqualTo 50) then {
        if (ctrlShown _ctrlMap) then {
            _ctrlMap ctrlShow false
        } else {
            _ctrlMap ctrlShow true
        };
    };

    if (_dikCode isEqualTo 14) then {
        if !(VAR_DISPLAY_BUSY) then {
            if (VAR_DISPLAY_HIDDEN) then {
                {_x ctrlShow true} forEach allControls _display - [_ctrlMap,_ctrlButtonToggleOn];
                VAR_DISPLAY_HIDDEN = false;
            } else {
                {_x ctrlShow false} forEach allControls _display - [_ctrlMap];
                VAR_DISPLAY_HIDDEN = true;
            };
        };
    };
}];

_ctrlMap ctrlAddEventHandler ["Draw",{ 
    params [["_ctrl", controlNull, [controlNull]]];
    {
        _name = name _x;
        _pos = getPosATL vehicle _x;
        _dir = getDir vehicle _x;
        _icon = getText (configfile >> "CfgVehicles" >> typeOf vehicle _x >> "icon");
        _colour = [side _x, false] call BIS_fnc_sideColor;

        _ctrl drawIcon [
            '',
            _colour,
            _pos,
            0.9,
            0.9,
            _dir,
            _name,
            1,
            0.03,
            'RobotoCondensed',
            "right"
        ];
    } forEach allPlayers;
}];

ADMIN_TAGS = addMissionEventHandler ["Draw3D", {
    {
        if !(isNil {_x getVariable "CQC_tags_Init"}) then 
        {
        _pos = [];
        _colour =[];
        _distance = cameraOn distance _x;

        if (_x isKindOf "Man") then 
        {
            _x selectionPosition "head" params ["_selPosX", "_selPosY", "_selPosZ"];
            _pos = _x modelToWorldVisual [0, 0, (((_selPosZ + 1.6) + (_distance / 15)) / 1.3)];
        };

        switch (_x) do {
            case VAR_SELECTED_UNIT: {_colour = [0.95,0.95,0.95,1]};
            default {_colour = [0,0.3,0.6,1]};
        };
        _name = name _x;

            drawIcon3D [
                '',
                _colour,
                _pos,
                -2.2,
                -2.2,
                0,
                _name,
                2,
                0.045,
                'RobotoCondensedBold'
            ];

            drawIcon3D [
                'mpmissions\__CUR_MP.Altis\GUI\data\displays\displayAdmin\unitpointer.paa',
                _colour,
                _pos,
                0.9,
                0.9,
                0,
                '',
                2,
                0.04,
                'RobotoCondensedBold'
            ];
        };
    } forEach allUnits;
}];
        
// Populate unit tree        
tvClear _ctrlTreeListUnits;
{
    private _sideAddToTreeView = _ctrlTreeListUnits tvAdd [[], _x];
    private _sideAestetics = [
        ["a3\ui_f\Data\Map\Markers\nato\b_unknown.paa", WEST]
    ] select _forEachIndex;

    _sideAestetics params [
        ["_picturePath", "", [""]],
        ["_side", sideUnknown, [sideUnknown]]
    ];

    _ctrlTreeListUnits tvSetData [[_sideAddToTreeView], ""];
    _ctrlTreeListUnits tvSetPicture [[_sideAddToTreeView], _picturePath];
    _ctrlTreeListUnits tvSetPictureColor [[_sideAddToTreeView], [_side] call BIS_fnc_sideColor]
} forEach ["Blufor"];

{
    if (count units _x >= 1) then {
        private _treeViewAddedSideIndex = switch side _x do {
            case west:        {0};
        };

        {
            private _name = name _x;
            private _uid = getPlayerUID _x;
            private _side = side group _x;

            private _unitAddToTreeView = _ctrlTreeListUnits tvAdd [[_treeViewAddedSideIndex], _name];
            _ctrlTreeListUnits tvSetData [[_treeViewAddedSideIndex, _unitAddToTreeView], _uid];
            _ctrlTreeListUnits tvSetPicture [[_treeViewAddedSideIndex, _unitAddToTreeView], "\A3\ui_f\data\map\vehicleicons\iconMan_ca.paa"];
            _ctrlTreeListUnits tvSetPictureColor [[_treeViewAddedSideIndex, _unitAddToTreeView], [_side] call BIS_fnc_sideColor];

                        
            if (_uid in (missionNamespace getVariable ["CQC_Admins", []])) then {
                _ctrlTreeListUnits tvSetColor [[_treeViewAddedSideIndex, _unitAddToTreeView], [1,0.5,0.5,1]];
            };
            true
        } count units _x
    };
    true
} count allGroups;
tvExpandAll _ctrlTreeListUnits;

// Tree spesific EHs and vars
private _staffOnDuty = missionNamespace getVariable ["CQC_staffOnDuty", []];
if (_staffOnDuty isEqualTo []) then {
    _ctrlButtonStaff ctrlSetTextColor COLOR_DISABLED;
} else {
    _ctrlButtonStaff ctrlSetTextColor COLOR_ENABLED_STAFF;
};
        
_ctrlTreeListUnits ctrlAddEventHandler ["TreeSelChanged", 
{
    params ["_control", "_selectionPath"];
    _path = tvCurSel IDC_DISPLAYADMIN_PANELLEFT_TREEUNITS;
    _unitID = tvData [IDC_DISPLAYADMIN_PANELLEFT_TREEUNITS, _path];
    _unit = _unitID call BIS_fnc_getUnitByUID;
    if !(_unitID == "") then {
        VAR_SELECTED_UNIT = _unit;
        VAR_SELECTED_UNIT_ID = _unitID;
    } else {
        VAR_SELECTED_UNIT = objNull;
        VAR_SELECTED_UNIT_ID = "";
    };

    private _pdisplay = findDisplay IDD_DISPLAYADMIN_DISPLAY;
    private _ctrlButtonArsenal = _pdisplay displayCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONARSENAL;
    private _ctrlButtonUnitImmune = _pdisplay displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONGOD;
    private _ctrlButtonUnitInvis = _pdisplay displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONINVIS;
    private _ctrlButtonUnitFreeze = _pdisplay displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONFREEZE;
    private _ctrlButtonStaff = _pdisplay displayCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONSTAFFONDUTY;
    private _ctrlButtonProfile = _pdisplay displayCtrl IDC_DISPLAYADMIN_STATUSBAR_LINKGAMECP;
            
    if !(isNull VAR_SELECTED_UNIT) then {

        if (VAR_SELECTED_UNIT getVariable ["immune", false]) then {
            _ctrlButtonUnitImmune ctrlSetTextColor COLOR_ENABLED;
        } else {
            _ctrlButtonUnitImmune ctrlSetTextColor COLOR_DISABLED;
        };

        if (VAR_SELECTED_UNIT getVariable ["invisible", false]) then {
             _ctrlButtonUnitInvis ctrlSetTextColor COLOR_ENABLED;
        } else {
             _ctrlButtonUnitInvis ctrlSetTextColor COLOR_DISABLED;
        };

        if (VAR_SELECTED_UNIT getVariable ["frozen", false]) then {
            _ctrlButtonUnitFreeze ctrlSetTextColor COLOR_ENABLED;
        } else {
            _ctrlButtonUnitFreeze ctrlSetTextColor COLOR_DISABLED;
        };

        _ctrlButtonProfile ctrlSetStructuredText parseText format ["<t size='0.775'><a href='https://grandtheftarma.com/gamecp/player/%1'>%1</a></t>", VAR_SELECTED_UNIT_ID];
    };
}];

_ctrlButtonExpandTree ctrlAddEventHandler ["ButtonClick", {
    params [["_ctrl", controlNull, [controlNull]]];
    private _pdisplay = findDisplay IDD_DISPLAYADMIN_DISPLAY;
    private _ctrlTreeListUnits = _pdisplay displayCtrl IDC_DISPLAYADMIN_PANELLEFT_TREEUNITS;

    tvExpandAll _ctrl;
}];

_ctrlButtonCollapseTree ctrlAddEventHandler ["ButtonClick", {
    params [["_ctrl", controlNull, [controlNull]]];
    private _pdisplay = findDisplay IDD_DISPLAYADMIN_DISPLAY;
    private _ctrlTreeListUnits = _pdisplay displayCtrl IDC_DISPLAYADMIN_PANELLEFT_TREEUNITS;

    tvCollapseAll _ctrl;
}];

// Camera initialization and EHs
CAMERA_ID = "camera" camCreate (ASLToAGL eyePos player);

_ctrlButton1PP ctrlAddEventHandler ["ButtonClick", {
    params [["_ctrl", controlNull, [controlNull]]];
    VAR_CAMERA_MODE = "1PP";
    VAR_SELECTED_UNIT switchCamera "INTERNAL";
}];

_ctrlButton3PP ctrlAddEventHandler ["ButtonClick", {
    params [["_ctrl", controlNull, [controlNull]]];
    VAR_CAMERA_MODE = "3PP";
    VAR_SELECTED_UNIT switchCamera "EXTERNAL";
}];

_ctrlButtonFree ctrlAddEventHandler ["ButtonClick", {
    params [["_ctrl", controlNull, [controlNull]]];
    VAR_CAMERA_MODE = "FREE";
    CAMERA_ID switchCamera "INTERNAL";
}];

// Toolbar buttons EHs
_ctrlButtonArsenal ctrlAddEventHandler ["ButtonClick", {
    closeDialog 0; 
    [ 'Open', [ true ] ] call BIS_fnc_arsenal;
}];

_ctrlButtonNotif ctrlAddEventHandler ["ButtonClick", {
    createDialog  "DisplaySendNotification";
}];

_ctrlButtonStaff ctrlAddEventHandler ["ButtonClick", {
    params [["_ctrl", controlNull, [controlNull]]];
    private _staffOnDuty = missionNamespace getVariable ["CQC_staffOnDuty", []];
    if (_staffOnDuty isEqualTo []) then {
            CQC_staffOnDuty = [
                player getVariable ["CQC_tags_Icon", ""],
                player getVariable ["CQC_tags_Subtitle", ""],
                player getVariable ["CQC_tags_SubtitleColour", []]
            ];

            player setVariable ["CQC_tags_Icon", "mpmissions\__CUR_MP.Altis\Data\Icons\gta.paa", true];
            player setVariable ["CQC_tags_Subtitle", "Staff on Duty", true];
            player setVariable ["CQC_tags_SubtitleColour", [0.98, 0.54, 0.2, 1], true];
            player allowDamage false;
            _ctrl ctrlSetTextColor COLOR_ENABLED_STAFF;
            ["Staff on Duty", "You are now staff on duty", "success", 5] call CQC_fnc_notificationSystem;
    } else {
        player setVariable ["CQC_tags_Icon", CQC_staffOnDuty select 0, true];
        player setVariable ["CQC_tags_Subtitle", CQC_staffOnDuty select 1, true];
        player setVariable ["CQC_tags_SubtitleColour", CQC_staffOnDuty select 2, true];
        _godMode = player getVariable ["immune", false];
        if (_godMode == false) then {
            player allowDamage true;
        };
        CQC_staffOnDuty = [];
        _ctrl ctrlSetTextColor COLOR_DISABLED;
        ["Staff on Duty", "You are no longer staff on duty", "announcement", 5] call CQC_fnc_notificationSystem;
    };
}];

// Unit toolbar buttons EHs
_ctrlButtonUnitImmune ctrlAddEventHandler ["ButtonClick", {
    params [["_ctrl", controlNull, [controlNull]]];
            
    if !(isNull VAR_SELECTED_UNIT) then {   
        if (VAR_SELECTED_UNIT getVariable ["immune", false]) then {
            VAR_SELECTED_UNIT allowDamage true;
            VAR_SELECTED_UNIT setVariable ["immune", false, true];
            _ctrl ctrlSetTextColor COLOR_DISABLED;
        } else {
            VAR_SELECTED_UNIT allowDamage false;
            VAR_SELECTED_UNIT setVariable ["immune", true, true];
            _ctrl ctrlSetTextColor COLOR_ENABLED;
        };
    };
}];
        
_ctrlButtonUnitInvis ctrlAddEventHandler ["ButtonClick", {
    params [["_ctrl", controlNull, [controlNull]]];
            
    if !(isNull VAR_SELECTED_UNIT) then {   
        if (VAR_SELECTED_UNIT getVariable ["invisible", false]) then {
            _ctrl ctrlSetTextColor COLOR_DISABLED;
            VAR_SELECTED_UNIT setVariable ["CQC_tags_Icon", CQC_TagVars select 0, true];
            VAR_SELECTED_UNIT setVariable ["CQC_tags_Title", CQC_TagVars select 1, true];
            VAR_SELECTED_UNIT setVariable ["CQC_tags_Subtitle", CQC_TagVars select 2, true];
            [VAR_SELECTED_UNIT, false] remoteExecCall ["hideObject", VAR_ALL_PLAYERS];
            VAR_SELECTED_UNIT setVariable ["invisible", false, true];
            _godMode = player getVariable ["immune", false];
            if (_godMode == false) then {
                player allowDamage true;
            };
        } else {
            _ctrl ctrlSetTextColor COLOR_ENABLED;
            CQC_TagVars = [
                VAR_SELECTED_UNIT getVariable ["CQC_tags_Icon", ""],
                VAR_SELECTED_UNIT getVariable ["CQC_tags_Title", ""],
                VAR_SELECTED_UNIT getVariable ["CQC_tags_Subtitle", ""]
            ];
            VAR_SELECTED_UNIT setVariable ["CQC_tags_Icon", "", true];
            VAR_SELECTED_UNIT setVariable ["CQC_tags_Title", "", true];
            VAR_SELECTED_UNIT setVariable ["CQC_tags_Subtitle", "", true];
            [VAR_SELECTED_UNIT, true] remoteExecCall ["hideObject", VAR_ALL_PLAYERS];
            VAR_SELECTED_UNIT setVariable ["invisible", true, true];
            player allowDamage false;
        };
    };
}];
        
_ctrlButtonUnitFreeze ctrlAddEventHandler ["ButtonClick", {
    params [["_ctrl", controlNull, [controlNull]]];
            
    if !(isNull VAR_SELECTED_UNIT) then {  
        if !(VAR_SELECTED_UNIT == VAR_LOCAL_UNIT) then {
            if (VAR_SELECTED_UNIT getVariable ["frozen", false]) then {
                _ctrl ctrlSetTextColor COLOR_DISABLED;
                VAR_SELECTED_UNIT enableSimulationGlobal true;
                [false] remoteExecCall ["disableUserInput", VAR_SELECTED_UNIT];
                [VAR_SELECTED_UNIT, true] remoteExec ["enableSimulationGlobal", 2];
                VAR_SELECTED_UNIT setVariable ["frozen", false, true];
            } else {
                _ctrl ctrlSetTextColor COLOR_ENABLED;
                VAR_SELECTED_UNIT enableSimulationGlobal false;
                [true] remoteExecCall ["disableUserInput", VAR_SELECTED_UNIT];
                [VAR_SELECTED_UNIT, false] remoteExec ["enableSimulationGlobal", 2];
                VAR_SELECTED_UNIT setVariable ["frozen", true, true];
            };
        };
    };
}];

_ctrlButtonKill ctrlAddEventHandler ["ButtonClick", {
    params [["_ctrl", controlNull, [controlNull]]];
            
    if !(isNull VAR_SELECTED_UNIT) then {  
        if !(VAR_SELECTED_UNIT == VAR_LOCAL_UNIT) then {
            VAR_SELECTED_UNIT setDamage 1;
        };
    };
}];

_ctrlButtonHeal ctrlAddEventHandler ["ButtonClick", {
    params [["_ctrl", controlNull, [controlNull]]];
            
    if !(isNull VAR_SELECTED_UNIT) then {  
        VAR_SELECTED_UNIT setDamage 0;
    };
}];
