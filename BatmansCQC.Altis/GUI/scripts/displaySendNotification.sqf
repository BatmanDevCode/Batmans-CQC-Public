#include "script_component.hpp"
/*
 File: fn_displaySendNotification.sqf
 Author: FragS
 Description: Handles the loading of the Notification Sender.
*/

scriptName "CQC_display_fnc_displaySendNotification";
scopeName "main";

#define SELF                    CQC_displaySendNotification_script

disableSerialization;

if !(params [
    ["_event", "", [""]],
    ["_args", [], [[]]]
]) exitWith {
    ["Error", "Invalid display parameters", "error", 10] call CQC_fnc_notificationSystem;
};

switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

		private _ctrlToolBox = _display displayCtrl IDC_DISPLAYNOTIF_TOOLBOX;
		private _ctrlButtonClear = _display displayCtrl IDC_DISPLAYNOTIF_BUTTONCLEAR;
		private _ctrlButtonPreview = _display displayCtrl IDC_DISPLAYNOTIF_BUTTONPREVIEW;
		private _ctrlButtonSend = _display displayCtrl IDC_DISPLAYNOTIF_BUTTONSEND;
		private _ctrlComboColor = _display displayCtrl IDC_DISPLAYNOTIF_COMBOCOLOUR;

		_displayNames = ["Green","Orange","Red","White","Light Blue","Dark Blue","Pink","Purple"];
		_codeNames = ["sucess","warning","error","announcement","light_blue","dark_blue","pink","purple"];

		_index = {_ctrlComboColor lbAdd _x} forEach _displayNames;

		for "_i" from 0 to _index do {
			_ctrlComboColor lbSetData [_i, _codeNames select _i]
		};

		_ctrlComboColor lbSetCurSel 0;
		_ctrlToolBox lbSetCurSel 1;

		_ctrlToolBox ctrlAddEventHandler ["ToolBoxSelChanged", {
			params ["_control", "_selectedIndex"];
			["onTBSelChanged", [ctrlParent (_this select 0), _selectedIndex]] call SELF;
		}];

		_ctrlButtonClear ctrlAddEventHandler ["ButtonClick", {
			["clear", [ctrlParent (_this select 0)]] call SELF;
		}];

		_ctrlButtonPreview ctrlAddEventHandler ["ButtonClick", {
			["preview", [ctrlParent (_this select 0)]] call SELF;
		}];

		_ctrlButtonSend ctrlAddEventHandler ["ButtonClick", {
			["send", [ctrlParent (_this select 0)]] call SELF;
		}];

    };

    case "preview": {
        _args params [["_display", displayNull, [displayNull]]];
        
		private _ctrlEditTitle = _display displayCtrl IDC_DISPLAYNOTIF_EDITTITLE;
		private _ctrlEditTime = _display displayCtrl IDC_DISPLAYNOTIF_EDITTIME;
		private _ctrlEditText = _display displayCtrl IDC_DISPLAYNOTIF_EDITTEXT;
		private _ctrlComboColor = _display displayCtrl IDC_DISPLAYNOTIF_COMBOCOLOUR;
		private _ctrlToolBox = _display displayCtrl IDC_DISPLAYNOTIF_TOOLBOX;

		if (ctrlText _ctrlEditText == "") then {
			
			["Error","No message in field","error", 10] call CQC_fnc_notificationSystem;

		} else {
			if (parseNumber ctrlText _ctrlEditTime < 1 ) then {

				["Error","Invalid duration provided","error", 10] call CQC_fnc_notificationSystem;

			} else {
				_currentSelection = lbCurSel _ctrlComboColor;
				_data = _ctrlComboColor lbData _currentSelection;
				_staff = format ["<t size='0.915' color='ffffff'>From: %1</t><br/>", name player];
				
				switch (lbCurSel _ctrlToolBox) do {
					case 0: {[
						format ["%1",ctrlText _ctrlEditTitle],
						format ["%1",(_staff + ctrlText _ctrlEditText)],
						format ["%1",_data],
						(parseNumber ctrlText _ctrlEditTime)
					] call CQC_fnc_notificationSystem;};
					case 1: {[
						format ["%1",ctrlText _ctrlEditTitle],
						format ["%1",ctrlText _ctrlEditText],
						format ["%1",_data],
						(parseNumber ctrlText _ctrlEditTime)
					] call CQC_fnc_notificationSystem;};
				};
			};
		};
    };

    case "send": {
        _args params [["_display", displayNull, [displayNull]]];

		private _ctrlEditTitle = _display displayCtrl IDC_DISPLAYNOTIF_EDITTITLE;
		private _ctrlEditTime = _display displayCtrl IDC_DISPLAYNOTIF_EDITTIME;
		private _ctrlEditText = _display displayCtrl IDC_DISPLAYNOTIF_EDITTEXT;
		private _ctrlComboColor = _display displayCtrl IDC_DISPLAYNOTIF_COMBOCOLOUR;
		private _ctrlToolBox = _display displayCtrl IDC_DISPLAYNOTIF_TOOLBOX;

		if (ctrlText _ctrlEditText == "") then {
			
			["Error","No message in field","error", 10] call CQC_fnc_notificationSystem;

		} else {
			if (parseNumber ctrlText _ctrlEditTime < 1 ) then {

				["Error","Invalid duration provided","error", 10] call CQC_fnc_notificationSystem;

			} else {
				_currentSelection = lbCurSel _ctrlComboColor;
				_data = _ctrlComboColor lbData _currentSelection;
				_staff = format ["<t size='0.915' color='ffffff'>From: %1</t><br/>", name player];
				
				switch (lbCurSel _ctrlToolBox) do {
					case 0: {[
						format ["%1",ctrlText _ctrlEditTitle],
						format ["%1",(_staff + ctrlText _ctrlEditText)],
						format ["%1",_data],
						(parseNumber ctrlText _ctrlEditTime)
					] remoteExecCall ["CQC_fnc_notificationSystem", allPlayers, false];};
					case 1: {[
						format ["%1",ctrlText _ctrlEditTitle],
						format ["%1",ctrlText _ctrlEditText],
						format ["%1",_data],
						(parseNumber ctrlText _ctrlEditTime)
					] remoteExecCall ["CQC_fnc_notificationSystem", allPlayers, false];};
				};
			};
		};
    };
    
    case "onTBSelChanged": {
        _args params [
			["_display", displayNull, [displayNull]],
			["_selectedIndex", 0, [0]]
		];
        
		private _ctrlDisableGroup = _display displayCtrl IDC_DISPLAYNOTIF_GROUPD;
		private _ctrlEditTitle = _display displayCtrl IDC_DISPLAYNOTIF_EDITTITLE;
		private _ctrlComboColor = _display displayCtrl IDC_DISPLAYNOTIF_COMBOCOLOUR;
		private _ctrlButtonClear = _display displayCtrl IDC_DISPLAYNOTIF_BUTTONCLEAR;
		private _ctrlEditTime = _display displayCtrl IDC_DISPLAYNOTIF_EDITTIME;
		
		switch (_selectedIndex) do {
		case 0: { _ctrlDisableGroup ctrlEnable false; _ctrlButtonClear ctrlEnable false; _ctrlEditTitle ctrlSetText "Staff Announcement"; _ctrlEditTime ctrlSetText "10"; _ctrlComboColor lbSetCurSel 3;  };
		case 1: { _ctrlDisableGroup ctrlEnable true; _ctrlButtonClear ctrlEnable true; _ctrlEditTitle ctrlSetText ""; _ctrlEditTime ctrlSetText ""; _ctrlComboColor lbSetCurSel 0; };
		};  
    };

    case "clear": {
        _args params [["_display", displayNull, [displayNull]]];

		private _ctrlEditTitle = _display displayCtrl IDC_DISPLAYNOTIF_EDITTITLE;
		private _ctrlEditTime = _display displayCtrl IDC_DISPLAYNOTIF_EDITTIME;
		private _ctrlEditText = _display displayCtrl IDC_DISPLAYNOTIF_EDITTEXT;
		private _ctrlComboColor = _display displayCtrl IDC_DISPLAYNOTIF_COMBOCOLOUR;

		_ctrlEditTitle ctrlSetText "";
		_ctrlEditTime ctrlSetText "";
		_ctrlEditText ctrlSetText "";
		_ctrlComboColor lbSetCurSel 0;	
	};

	case "onUnload": {
        
    };
};