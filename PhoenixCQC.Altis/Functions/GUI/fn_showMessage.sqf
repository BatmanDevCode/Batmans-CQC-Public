#include "..\script_component.hpp"
/*
 File: fn_displayAdmin.sqf (based on "fn_3DENShowMessage.sqf", BIS_fnc_3DENShowMessage)
 Author: Karel Moricky, FragS
 Description: Shows a message to either be confirmed or denied.
*/

disableserialization;

params [
    ["_title", "", [""]],
    ["_text", "", [""]],
    ["_picture", "", [""]],
    ["_buttonOK", [], [[]]],
    ["_buttonCancel", [], [[]]],
    ["_parentDisplay", findDisplay 46, [displayNull]]
];

// Open display
private _display = _parentDisplay createDisplay "CQC_displayShowMessage";
private _ctrlTitle = _display displayCtrl IDC_DISPLAYSHOWMSG_TITLE;
private _ctrlBackground = _display displayCtrl IDC_DISPLAYSHOWMSG_BACKGROUND;
private _ctrlPicture = _display displayCtrl IDC_DISPLAYSHOWMSG_PICTURE;
private _ctrlText = _display displayCtrl IDC_DISPLAYSHOWMSG_TEXT;
private _ctrlFooter = _display displayCtrl IDC_DISPLAYSHOWMSG_FOOTER;
private _ctrlButtonOK = _display displayCtrl IDC_DISPLAYSHOWMSG_BUTTONOK;
private _ctrlButtonCancel = _display displayCtrl IDC_DISPLAYSHOWMSG_BUTTONCANCEL;

// Set title
_ctrlTitle ctrlSetText _title;
if (_picture != "") then {_ctrlPicture ctrlSetText _picture;};

// Set text and stretch the window to fit it
_ctrlText ctrlSetStructuredText parseText _text;
private _height = ctrlTextHeight _ctrlText;
private _heightExtended = _height * 0.5;
{
	private _ctrl = _x;
	private _ctrlPos = ctrlPosition _ctrl;

	_ctrlPos set [1,(_ctrlPos select 1) - _heightExtended];
	_ctrl ctrlSetPosition _ctrlPos;
	_ctrl ctrlCommit 0;
} foreach [_ctrlTitle];

{
	private _ctrl = _x;
	private _ctrlPos = ctrlPosition _ctrl;

	_ctrlPos set [1,(_ctrlPos select 1) - _heightExtended];
	_ctrlPos set [3,(_ctrlPos select 3) + _height];
	_ctrl ctrlSetPosition _ctrlPos;
	_ctrl ctrlCommit 0;
} foreach [_ctrlBackground,_ctrlPicture,_ctrlText];

{
	private _ctrl = _x;
	private _ctrlPos = ctrlPosition _ctrl;

	_ctrlPos set [1,(_ctrlPos select 1) + _heightExtended];
	_ctrl ctrlSetPosition _ctrlPos;
	_ctrl ctrlCommit 0;
} foreach [_ctrlFooter,_ctrlButtonOK,_ctrlButtonCancel];

// Set buttons
_buttonOK params [
    ["_textOK", "", [""]],
    ["_codeOK", {}, [{}]]
];

_buttonCancel params [
    ["_textCancel", "", [""]],
    ["_codeCancel", {}, [{}]]
];

_ctrlButtonOK ctrlSetText _textOK;
_ctrlButtonCancel ctrlSetText _textCancel;

_ctrlButtonOK ctrlshow (_textOK != "");
_ctrlButtonCancel ctrlshow (_textCancel != "");

_ctrlButtonOK ctrlAddEventHandler ["ButtonClick", _codeOK];
_ctrlButtonCancel ctrlAddEventHandler ["ButtonClick", _codeCancel];

_display