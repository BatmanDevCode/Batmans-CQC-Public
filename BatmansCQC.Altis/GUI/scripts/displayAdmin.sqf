#include "script_component.hpp"
/*
 File: displayAdmin.sqf (based on "RscDisplayEGSpectator.sqf")
 Author: Nelson Duarte, FragS
 Description: Called when the admin display is opened.
*/

#define SELF                     CQC_displayAdmin_script
#define DISPLAY					 uiNamespace getVariable ["CQC_displayAdmin", displayNull]
#define CAMERA					 uiNamespace getVariable ["CQC_displayAdmin_camera", objNull]
#define VAR_DRAW3D_HANDLE        "CQC_displayAdmin_onDraw3D"
#define VAR_EACHFRAME_HANDLE     "CQC_displayAdmin_onEachFrame"
#define COLOR_ENABLED            [0, 0.48, 0.27, 1]
#define COLOR_ENABLED_STAFF      [0.6, 0.1, 0, 1]
#define COLOR_DISABLED           [1, 1, 1, 1]

disableSerialization;

params [
    ["_event", "", [""]],
    ["_args", [], [[]]]
];

switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

		if !(call CQC_adminLevel > 0) exitWith {_display closeDisplay 1; closeDialog 0;};

		// Unload HUD Elements
		showChat false;
		[false] call CQC_fnc_showHUD;
		removeMissionEventHandler ["Draw3D", CQC_handle_drawTags];
		CQC_handle_drawTags = nil;

		// Display Event Handlers
		_display displayaddeventhandler ["KeyDown", {["onKeyDown", _this] call SELF;}];
		_display displayaddeventhandler ["KeyUp", {["onKeyUp", _this] call SELF;}];
		_display displayAddEventHandler ["MouseMoving", {["mouseMoving", _this] call SELF;}];

		// Mouse Handler
		private _ctrlMouseHandler = _display displayCtrl IDC_DISPLAYADMIN_MOUSEHANDLER;
		_ctrlMouseHandler ctrlAddEventHandler ["MouseButtonDown", {["mouseButtonDown", _this] call SELF;}];
		_ctrlMouseHandler ctrlAddEventHandler ["MouseButtonUp", {["mouseButtonUp", _this] call SELF;}];
		_ctrlMouseHandler ctrlAddEventHandler ["MouseButtonDblClick", {["mouseButtonDblClick", _this] call SELF;}];
		_ctrlMouseHandler ctrlAddEventHandler ["MouseZChanged", {["mouseZChanged", _this] call SELF;}];
		_display setVariable ["CQC_displayAdmin_isHoldingRightMouseButton", false];

		//Map
		private _ctrlMap = _display displayCtrl IDC_DISPLAYADMIN_MAP;
		_ctrlMap ctrlAddEventHandler ["Draw", {["onDraw", _this] call SELF;}];
		_ctrlMap ctrlAddEventHandler ["MouseButtonDown", {["onMapClick", _this] call SELF;}];
        
        
		// Tree
		private _ctrlTreeUnits = _display displayCtrl IDC_DISPLAYADMIN_PANELLEFT_TREEUNITS;
		_ctrlTreeUnits ctrlAddEventHandler ["TreeSelChanged", {["onTreeSelChanged", _this] call SELF;}];

		private _ctrlEditSearchTree = _display displayCtrl IDC_DISPLAYADMIN_PANELLEFT_EDITSEARCH;
		_ctrlEditSearchTree ctrlAddEventHandler ["SetFocus", { private _display = DISPLAY; _display setVariable ["CQC_displayAdmin_isSearchFocused", true];}];
		_ctrlEditSearchTree ctrlAddEventHandler ["KillFocus", { private _display = DISPLAY; _display setVariable ["CQC_displayAdmin_isSearchFocused", false];}];
        
        private _ctrlButtonExpandTree = _display displayCtrl IDC_DISPLAYADMIN_PANELLEFT_BUTTONEXPAND;
        _ctrlButtonExpandTree ctrlAddEventHandler ["ButtonClick", {["onButtonExpandTreeClick", [ctrlParent (_this select 0)]] call SELF}];

        private _ctrlButtonCollapseTree = _display displayCtrl IDC_DISPLAYADMIN_PANELLEFT_BUTTONCOLLAPSE;
        _ctrlButtonCollapseTree ctrlAddEventHandler ["ButtonClick", {["onButtonCollapseTreeClick", [ctrlParent (_this select 0)]] call SELF}];
		
		// Camera Toolbar
		private _ctrlButtonFps = _display displayCtrl IDC_DISPLAYADMIN_CAMERABAR_BUTTONFPS;
        _ctrlButtonFps ctrlAddEventHandler ["ButtonClick", {["onButtonFpsClicked", [ctrlParent (_this select 0)]] call SELF}];

        private _ctrlButtonFollow = _display displayCtrl IDC_DISPLAYADMIN_CAMERABAR_BUTTONFOLLOW;
        _ctrlButtonFollow ctrlAddEventHandler ["ButtonClick", {["onButtonFollowClicked", [ctrlParent (_this select 0)]] call SELF}];

        private _ctrlButtonFree = _display displayCtrl IDC_DISPLAYADMIN_CAMERABAR_BUTTONFREE;
        _ctrlButtonFree ctrlAddEventHandler ["ButtonClick", {["onButtonFreeClicked", [ctrlParent (_this select 0)]] call SELF}];
		
		// Toolbar
		private _ctrlButtonWeather = _display displayCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONINTEL;
        _ctrlButtonWeather ctrlAddEventHandler ["ButtonClick", {}];
        _ctrlButtonWeather ctrlEnable false;

		private _ctrlButtonMap = _display displayCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONMAP;
        _ctrlButtonMap ctrlAddEventHandler ["ButtonClick", {["toggleMap"] call SELF}];

		private _ctrlButtonVisionMode = _display displayCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONVISIONMODE;
        _ctrlButtonVisionMode ctrlAddEventHandler ["ButtonClick", {["toggleVisionMode"] call SELF}];

		private _ctrlButtonDrawEntities = _display displayCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONENTITIES;
        _ctrlButtonDrawEntities ctrlAddEventHandler ["ButtonClick", {["onButtonDrawEntitiesClick"] call SELF}];
        _ctrlButtonDrawEntities ctrlEnable (call CQC_adminLevel > 2);
		
		private _ctrlButtonDrawUnits = _display displayCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONUNITS;
        _ctrlButtonDrawUnits ctrlAddEventHandler ["ButtonClick", {["onButtonDrawUnitsClick"] call SELF}];

		private _ctrlButtonDrawLocations = _display displayCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONLOCATIONS;
        _ctrlButtonDrawLocations ctrlAddEventHandler ["ButtonClick", {["onButtonDrawLocationsClick"] call SELF}];

        private _ctrlButtonArsenal = _display displayCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONARSENAL;
        _ctrlButtonArsenal ctrlAddEventHandler ["ButtonClick", {["onButtonArsenalClick"] call SELF}];
        _ctrlButtonArsenal ctrlEnable (call CQC_adminLevel > 1);

		private _ctrlButtonDebug = _display displayCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONDEBUG;
        _ctrlButtonDebug ctrlAddEventHandler ["ButtonClick", {["onButtonDebugClick"] call SELF}];
        _ctrlButtonDebug ctrlEnable (call CQC_adminLevel > 2);

		private _ctrlButtonNotif = _display displayCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONNOTIF;
        _ctrlButtonNotif ctrlAddEventHandler ["ButtonClick", {["onButtonNotifClick"] call SELF}];

		private _ctrlButtonOnDuty = _display displayCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONSTAFFONDUTY;
        _ctrlButtonOnDuty ctrlAddEventHandler ["ButtonClick", {["onButtonStaffClick"] call SELF}];
        
		// Unit Toolbar
		private _ctrlButtonHeal = _display displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONHEAL;
        _ctrlButtonHeal ctrlAddEventHandler ["ButtonClick", {["onButtonHealClick", [ctrlParent (_this select 0)]] call SELF}];
		_ctrlButtonHeal ctrlEnable false;

		private _ctrlButtonKill = _display displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONKILL;
        _ctrlButtonKill ctrlAddEventHandler ["ButtonClick", {["onButtonKillClick", [ctrlParent (_this select 0)]] call SELF}];
		_ctrlButtonKill ctrlEnable false;

		private _ctrlButtonFreeze = _display displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONFREEZE;
        _ctrlButtonFreeze ctrlAddEventHandler ["ButtonClick", {["onButtonFreezeClick", [ctrlParent (_this select 0)]] call SELF}];
		_ctrlButtonFreeze ctrlEnable false;
        
        private _ctrlButtonHide = _display displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONHIDE;
        _ctrlButtonHide ctrlAddEventHandler ["ButtonClick", {["onButtonHideClick", [ctrlParent (_this select 0)]] call SELF}];
		_ctrlButtonHide ctrlEnable false;
        
        private _ctrlButtonGod = _display displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONGOD;
        _ctrlButtonGod ctrlAddEventHandler ["ButtonClick", {["onButtonGodClick", [ctrlParent (_this select 0)]] call SELF}];
		_ctrlButtonGod ctrlEnable false;

		private _ctrlButtonEject = _display displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONEJECT;
        _ctrlButtonEject ctrlAddEventHandler ["ButtonClick", {["onButtonEjectClick", [ctrlParent (_this select 0)]] call SELF}];
		_ctrlButtonEject ctrlShow (call CQC_adminLevel > 2);
		_ctrlButtonEject ctrlEnable false;

		private _ctrlButtonDisableFire = _display displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONDISABLEFIRE;
        _ctrlButtonDisableFire ctrlAddEventHandler ["ButtonClick", {["onButtonDisableFireClick", [ctrlParent (_this select 0)]] call SELF}];
		_ctrlButtonDisableFire ctrlEnable false;

		/*private _ctrlButtonSpeed = _display displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONSPEED;
        _ctrlButtonSpeed ctrlAddEventHandler ["ButtonClick", {["onButtonSpeedClick", [ctrlParent (_this select 0)]] call SELF}];
		_ctrlButtonSpeed ctrlShow (call CQC_adminLevel > 2);
		_ctrlButtonSpeed ctrlEnable false;*/

		private _ctrlSeperator7 = _display displayCtrl IDC_DISPLAYADMIN_SEPERATOR_7;
		_ctrlSeperator7 ctrlShow (call CQC_adminLevel > 2);

        //Status Bar
		private _ctrlButtonProfile = _display displayCtrl IDC_DISPLAYADMIN_STATUSBAR_LINKGAMECP;
        _ctrlButtonProfile ctrlAddEventHandler ["ButtonClick", {["onButtonProfileClick", [ctrlParent (_this select 0)]] call SELF}];
		
		// Pannel (Left)
        private _ctrlButtonToggleOn = _display displayCtrl IDC_DISPLAYADMIN_PANELLEFT_TOGGLEON;
        _ctrlButtonToggleOn ctrlAddEventHandler ["ButtonClick", {["togglePannelLeftOn", [ctrlParent (_this select 0)]] call SELF}];
        
        private _ctrlButtonToggleOff = _display displayCtrl IDC_DISPLAYADMIN_PANELLEFT_TOGGLEOFF;
        _ctrlButtonToggleOff ctrlAddEventHandler ["ButtonClick", {["togglePannelLeftOff", [ctrlParent (_this select 0)]] call SELF}];
        
		// Create (Camera, Dummy Target)
		private _camera = "CamCurator" camCreate [0,0,0];
		_camera cameraEffect ["internal", "back"];
		_camera setPosASL eyePos player;
		_camera setDir getDirVisual player;
		_camera camCommand "maxPitch 89.0";
		_camera camCommand "minPitch -89.0";
		_camera camCommand "speedDefault 0.5";
		_camera camCommand "speedMax 2.0";
		_camera camCommand "ceilingHeight 5000";
		_camera camCommand "manual on";
		_camera spawn { sleep 1; _this camCommand "surfaceSpeed on"; };
		cameraEffectEnableHUD true;

		uiNamespace setVariable ["CQC_displayAdmin_camera", _camera];
		uiNamespace setVariable ["CQC_displayAdmin_cameraTick", addMissionEventHandler ["EachFrame", { ["cameraTick"] call SELF; }]];
		_display setVariable ["CQC_displayAdmin_cameraVisionMode", 0];
		uiNamespace setVariable ["CQC_displayAdmin_cameraDummyTarget", "Logic" createVehicleLocal getPosASLVisual player];
		_display setVariable ["CQC_displayAdmin_cameraTargetInVehicle", false];
		_display setVariable ["CQC_displayAdmin_followCameraZoom", 0.5];
        
		// Add Mission Event Handlers
		uiNamespace setVariable [VAR_DRAW3D_HANDLE, addMissionEventHandler ["Draw3D", {["onDraw3D", [DISPLAY]] call SELF;}]];
		uiNamespace setVariable [VAR_EACHFRAME_HANDLE, addMissionEventHandler ["EachFrame", {["onEachFrame", [DISPLAY]] call SELF;}]];

		// Arena Locations To Draw
		private _locations = [];
		{
			private _locationInfo = [];
			_locationInfo pushBack (getText (CFG_SPAWNS_REGULAR >> _x >> "name"));
			_locationInfo pushBack (getText (CFG_SPAWNS_REGULAR >> _x >> "spawnMarker"));
			_locationInfo pushBack (getNumber (CFG_SPAWNS_REGULAR >> _x >> "maxPlayers"));
			_locations pushBack _locationInfo;
		} forEach ((CFG_SPAWNS_REGULAR) call BIS_fnc_getCfgSubClasses);
		_display setVariable ["CQC_displayAdmin_arenaMarkers", _locations];

		// Show admin is in menu
		player setVariable ["adminOpen", true, true];
    };

	case "onUnload": {
		
		// Remove Mission Event Handlers
		removeMissionEventHandler ["EachFrame", uiNamespace getVariable [VAR_EACHFRAME_HANDLE, -1]];
		removeMissionEventHandler ["Draw3D", uiNamespace getVariable [VAR_DRAW3D_HANDLE, -1]];

		// Reset cam vision mode
		camUseNVG false; 
		false setCamUseTi 0;

		// Destroy (Camera, Dummy Target)
		private _camera = CAMERA;
		_camera cameraEffect ["terminate", "back"];
		camDestroy _camera;
		player switchCamera "EXTERNAL";

		private _cameraDummyTarget = uiNamespace getVariable ["CQC_displayAdmin_cameraDummyTarget", objNull];
		deleteVehicle _cameraDummyTarget;

		uiNamespace setVariable ["CQC_displayAdmin_camera", nil];
		uiNamespace setVariable ["CQC_displayAdmin_cameraDummyTarget", nil];
		uiNamespace setVariable ["CQC_displayAdmin_focus", nil];
		uiNamespace setVariable ["CQC_displayAdmin_cursorFocus", nil];

		// Load HUD Elements
		showChat true;
		[true] call CQC_fnc_showHUD;
		[] call CQC_fnc_initPlayerTags;

		// Show admin is not in menu
		player setVariable ["adminOpen", false, true];
	};

	case "onKeyDown": {
		_args params [
			["_display", displayNull, [displayNull]],
			["_key", 0, [0]],
			["_shift", false, [false]]
		];

		switch true do
		{
			case (_key == DIK_M): 			{ ["toggleMap"] call SELF; true; };
			case (_key == DIK_BACKSPACE): 	{ ["toggleUiVisibility"] call SELF; true; };
			//case (_key == DIK_PGUP):		{ ["addViewDistanceInput", [250.0]] call SELF; true; };
			//case (_key == DIK_PGDN): 		{ ["addViewDistanceInput", [-250.0]] call SELF; true; };
			//case (_key == DIK_RIGHT): 		{ ["onSwitchFocusClicked", [true]] call SELF; true; };
			//case (_key == DIK_LEFT): 		{ ["onSwitchFocusClicked", [false]] call SELF; true; };
			case (_key == DIK_F): 			{ ["treeSelectLocalUnit"] call SELF; true; };
			case (_key == DIK_T): 			{ ["onButtonDrawUnitsClick"] call SELF; true; };
			case (_key == DIK_N): 			{ ["toggleVisionMode"] call SELF; true; };
			case (_key == DIK_SPACE): 		{ ["teleportToCursor", [_shift]] call SELF; true; };
			case (_key == DIK_DELETE):		{ ["deleteCursorVehicle"] call SELF; true; };
			case (_key == DIK_NUMPADENTER): { ["toggleCameraMode"] call SELF; true; };
			case (_key == DIK_L): 			{ ["toggleCameraLights"] call SELF; true; };
			case (_key == DIK_LALT): 		{ ["toggleVeryFastSpeed", [true]] call SELF; true; };
			//case (_key == DIK_O): 			{ _display setVariable ["CQC_displayAdmin_drawProjectiles", !(_display getVariable ["CQC_displayAdmin_drawProjectiles", false])]; true; };
			default 						{ false; };
		};
	};

	case "onKeyUp": {
		_args params [
			["_display", displayNull, [displayNull]],
			["_key", 0, [0]]
		];

		switch true do
		{
			case (_key == DIK_LALT): 		{ ["toggleVeryFastSpeed", [false]] call SELF; true; };
			default 						{ false; };
		};
	};
    
    case "updatePlayerList" : {

		private _display = DISPLAY;
		private _ctrl = _display displayCtrl IDC_DISPLAYADMIN_PANELLEFT_TREEUNITS;

		private _oldList = [] + (_display getVariable ["CQC_displayAdmin_entitiesListOld", []]);

		private _west = [];
		private _east = [];
		private _indep = [];
		private _civ = [];

		{
			private _groupUnits = units _x;
			private _groupTexture = ["getGroupTextures", [_x]] call SELF;
			private _groupInfo = [_x, side _x, _groupTexture, groupId _x];
			private _groupUnitsInfo = [];

			{
				if (isPlayer _x) then {
					_groupUnitsInfo pushBack [
						_x, 
						alive _x, 
						alive _x && { _x getVariable ["BIS_revive_Incapacitated", false] }, 
						(name _x) select [0, 17],
						group player, 
						vehicle _x, 
						call (_x getVariable ["CQC_player_alias", {""}]), 
						[_x getVariable ["adminOpen", false], _x getVariable ["god", false], _x getVariable ["hidden", false], _x getVariable ["frozen", false], _x getVariable ["speed", false], _x getVariable ["onDuty", false]]
					];
				};
			} forEach _groupUnits;

			if (count _groupUnitsInfo <= 0) then {continue};

			private _group = [_groupInfo, _groupUnitsInfo];

			switch (side _x) do {
				case WEST: { _west pushBack _group; };
				case EAST: { _east pushBack _group; };
				case RESISTANCE: { _indep pushBack _group; };
				default { _civ pushBack _group; };
			};

		} forEach allGroups;

		private _newList = [_west, _east, _indep, _civ];

		if !(_oldList isEqualTo _newList) then {	
			private _allElements = ["treeGetAllElements"] call SELF;
			private _groupElements = _allElements select 1;
			private _unitElements = _allElements select 2;

			{
				private _data = _x;
				{
					{	
						{
							if ([_x select 0] call BIS_fnc_objectVar != _data) then {
								["treeDeleteUnit", [_data]] call SELF;
							};
						} forEach (_x select 1);
					} forEach _x;
				} forEach _newList;
			} forEach _unitElements;

			{
				private _data = _x;
				{
					{
						if (str ((_x select 0) select 0) != _data) then {
							["treeDeleteGroup", [_data]] call SELF;
						};
					} forEach _x;
				} forEach _newList;
			} forEach _groupElements;

			{
				private _sideIndex = _forEachIndex;

				private _sideType = switch (_forEachIndex) do {
					case 0: { "WEST"; };
					case 1: { "EAST"; };
					case 2: { "RESISTANCE"; };
					default { "CIVILIAN"; };
				};

				private _sideColor = switch (_forEachIndex) do {
					case 0: { [WEST] call BIS_fnc_sideColor; };
					case 1: { [EAST] call BIS_fnc_sideColor; };
					case 2: { [RESISTANCE] call BIS_fnc_sideColor; };
					default { [CIVILIAN] call BIS_fnc_sideColor; };
				};

				private _sideString = switch (_forEachIndex) do {
					case 0: { localize "str_west"; };
					case 1: { localize "str_east"; };
					case 2: { localize "str_guerrila"; };
					default { localize "str_civilian"; };
				};

				if (_ctrl tvCount [] == _forEachIndex) then {
					_ctrl tvAdd [[], _sideString];
					_ctrl tvSetData [[_forEachIndex], _sideType];
					_ctrl tvSetPicture [[_forEachIndex], "a3\3den\Data\Cfg3DEN\Layer\icon_ca.paa"];
				};

				_ctrl tvExpand [_sideIndex];
				//_ctrl tvSort [[_sideIndex], false];

				{
					private _groupInfo = _x select 0;
					private _unitsInfo = _x select 1;
					private _group = _groupInfo select 0;
					private _i = ["treeGetDataIndex", [str _group]] call SELF;
					private _groupIndex = if (count _i > 0) then {_i select 1} else {-1};

					if (_i isEqualTo []) then {
						_groupIndex = _ctrl tvAdd [[_sideIndex], groupId _group];
						_ctrl tvSetData [[_sideIndex, _groupIndex], str _group];
						_ctrl tvSetPicture [[_sideIndex, _groupIndex], _groupInfo select 2];
						_ctrl tvSetPictureColor [[_sideIndex, _groupIndex], [side _group] call BIS_fnc_sideColor];
						_ctrl tvSetTooltip [[_sideIndex, _groupIndex], groupId _group];
						_ctrl tvExpand [_sideIndex, _groupIndex];
						//_ctrl tvSort [[_sideIndex, _groupIndex], false];
					} else {
						_ctrl tvSetText [_i, groupId _group];
						_ctrl tvSetPicture [_i, _groupInfo select 2];
						_ctrl tvSetPictureColor [_i, [side _group] call BIS_fnc_sideColor];
						_ctrl tvSetTooltip [_i, groupId _group];
					};

					{
						private _unit = _x select 0;
						private _isAlive = _x select 1;
						private _isIncapacitated = _x select 2;
						private _name = _x select 3;
						private _groupId = _x select 4;
						private _alias = _x select 6;

						private _text = if (_alias == "") then { _name } else { format ["%1 (%2)", _name, _alias] };
						private _tooltip = if (isPlayer _unit) then { format ["%1 - %2", _name, _groupId] } else { format ["%1: %2 - %3", localize "str_player_ai", _name, _groupId] };
						private _i = ["treeGetDataIndex", [[_unit] call BIS_fnc_objectVar]] call SELF;
						private _unitIndex = if (count _i > 0) then {_i select 1} else {-1};
						private _unitIcon = getText (configfile >> "CfgVehicles" >> typeOf vehicle _unit >> "icon");

						private _texture = switch (true) do {
							case (_isIncapacitated) : 	{ ICON_REVIVE };
							default 					{ if (_unitIcon == "iconMan") then {getText (configfile >> "CfgVehicleIcons" >> _unitIcon)} else {_unitIcon} };
						};

						if (_i isEqualTo []) then {
							_unitIndex = _ctrl tvAdd [[_sideIndex, _groupIndex], _text];
							_ctrl tvSetData [[_sideIndex, _groupIndex, _unitIndex], [_unit] call BIS_fnc_objectVar];
							_ctrl tvSetPicture [[_sideIndex, _groupIndex, _unitIndex], _texture];
							_ctrl tvSetPictureColor [[_sideIndex, _groupIndex, _unitIndex], _sideColor];
							_ctrl tvSetTooltip [[_sideIndex, _groupIndex, _unitIndex], _tooltip];
							if (_alias != "") then {_ctrl tvSetColor [[_sideIndex, _groupIndex, _unitIndex], [1,0.5,0,1]]};

							_ctrl tvSetPictureRight [[_sideIndex, _groupIndex, _unitIndex], switch (true) do {
								case (!alive _unit): {"a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa"};
								case (_unit getVariable ["adminOpen", false] && (call CQC_adminLevel < 3)): {"a3\modules_f_curator\data\portraitcurator_ca.paa"};
								case (_unit getVariable ["onDuty", false]): {MISSION_ROOT + "GUI\data\displays\displayAdmin\g_off_ca.paa"};
								case (_unit getVariable ["god", false]): {MISSION_ROOT + "GUI\data\displays\displayAdmin\godmode_off_ca.paa"};
								case (_unit getVariable ["hidden", false]): {MISSION_ROOT + "GUI\data\displays\displayAdmin\hide_off_ca.paa"};
								case (_unit getVariable ["frozen", false]): {MISSION_ROOT + "GUI\data\displays\displayAdmin\freeze_off_ca.paa"};
								case (_unit getVariable ["speed", false]): {MISSION_ROOT + "GUI\data\displays\displayAdmin\speed_off_ca.paa"};
								default {"a3\data_f\clear_empty.paa"}
							}];
						} else {
							_ctrl tvSetText [_i, _text];
							_ctrl tvSetPicture [_i, _texture];
							_ctrl tvSetPictureColor [_i, _sideColor];
							_ctrl tvSetTooltip [_i, _tooltip];

							_ctrl tvSetPictureRight [_i, switch (true) do {
								case (!alive _unit): {"a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa"};
								case (_unit getVariable ["adminOpen", false] && (call CQC_adminLevel < 3)): {"a3\modules_f_curator\data\portraitcurator_ca.paa"};
								case (_unit getVariable ["onDuty", false]): {MISSION_ROOT + "GUI\data\displays\displayAdmin\g_off_ca.paa"};
								case (_unit getVariable ["god", false]): {MISSION_ROOT + "GUI\data\displays\displayAdmin\godmode_off_ca.paa"};
								case (_unit getVariable ["hidden", false]): {MISSION_ROOT + "GUI\data\displays\displayAdmin\hide_off_ca.paa"};
								case (_unit getVariable ["frozen", false]): {MISSION_ROOT + "GUI\data\displays\displayAdmin\freeze_off_ca.paa"};
								case (_unit getVariable ["speed", false]): {MISSION_ROOT + "GUI\data\displays\displayAdmin\speed_off_ca.paa"};
								default {"a3\data_f\clear_empty.paa"}
							}];
						};
					}forEach _unitsInfo;
				}forEach _x;
			}forEach _newList;
			
			_display setVariable ["CQC_displayAdmin_entitiesListOld", _newList];
		};

		/* Current focused unit
		private _focus = uiNamespace getVariable ["CQC_displayAdmin_focus", objNull];

		// Update focus if required
		if (!isNull _focus && {count tvCurSel _ctrl < 3}) then
		{
			// Get index of current focus in the list
			private _i = ["treeGetDataIndex", [[_focus] call BIS_fnc_objectVar]] call SELF;

			// If found, select it
			if (_i isNotEqualTo [] && {_i isNotEqualTo tvCurSel _ctrl}) then
			{
				_ctrl tvSetCurSel _i;
			};
		};*/
	};

    case "treeGetAllElements" : {
		private _elements = [[], [], []];

		private _display = DISPLAY;
		private _ctrl = _display displayCtrl IDC_DISPLAYADMIN_PANELLEFT_TREEUNITS;

		if (!isNull _ctrl) then {
			for "_i" from 0 to ((_ctrl tvCount []) - 1) do {
				(_elements select 0) pushBack (_ctrl tvData [_i]);

				for "_a" from 0 to ((_ctrl tvCount [_i]) - 1) do {
					(_elements select 1) pushBack (_ctrl tvData [_i, _a]);

					for "_b" from 0 to ((_ctrl tvCount [_i, _a]) - 1) do {
						(_elements select 2) pushBack (_ctrl tvData [_i, _a, _b]);
					};
				};
			};
		};

		_elements;
	};

    case "treeDeleteUnit" : {
		private _data = _args param [0, "", [""]];

		if (_data != "") then {
			private _display = DISPLAY;
			private _ctrl = _display displayCtrl IDC_DISPLAYADMIN_PANELLEFT_TREEUNITS;

			if (!isNull _ctrl) then {
				for "_i" from 0 to ((_ctrl tvCount []) - 1) do {

					for "_a" from 0 to ((_ctrl tvCount [_i]) - 1) do {

						for "_b" from 0 to ((_ctrl tvCount [_i, _a]) - 1) do {
							if (_ctrl tvData [_i, _a, _b] == _data) exitWith {
								_ctrl tvDelete [_i, _a, _b];
							};
						};
					};
				};
			};
		};
	};

    case "treeDeleteGroup" : {
		private _data = _args param [0, "", [""]];

		// Make sure data is not empty
		if (_data != "") then
		{
			// Get the list box control
			private _display = DISPLAY;
			private _ctrl = _display displayCtrl IDC_DISPLAYADMIN_PANELLEFT_TREEUNITS;

			if (!isNull _ctrl) then
			{
				for "_i" from 0 to ((_ctrl tvCount []) - 1) do
				{
					for "_a" from 0 to ((_ctrl tvCount [_i]) - 1) do
					{
						if (_ctrl tvData [_i, _a] == _data) exitWith
						{
							// Delete units
							for "_u" from 0 to ((_ctrl tvCount [_i, _a]) - 1) do
							{
								_ctrl tvDelete [_i, _a, _u];
							};

							// Delete group
							_ctrl tvDelete [_i, _a];
						};
					};
				};
			};
		};
	};

    case "treeGetDataIndex" : {
		_args params [["_data", "", [""]]];

		private _index = [];

		if (_data != "") then 
		{
			private _display = DISPLAY;
			private _ctrl = _display displayCtrl IDC_DISPLAYADMIN_PANELLEFT_TREEUNITS;

			if (!isNull _ctrl) then 
			{
				for "_i" from 0 to ((_ctrl tvCount []) - 1) do
				{
					if (_ctrl tvData [_i] == _data) exitWith {_index = [_i]};

					for "_a" from 0 to ((_ctrl tvCount [_i]) - 1) do
					{
						if (_ctrl tvData [_i, _a] == _data) exitWith {_index = [_i, _a]};

						for "_b" from 0 to ((_ctrl tvCount [_i, _a]) - 1) do
						{
							if (_ctrl tvData [_i, _a, _b] == _data) exitWith {_index = [_i, _a, _b]};
						};
					};
				};
			};
		};

		_index;
	};

	case "treeSelectLocalUnit" : {
		private _display = DISPLAY;
		private _ctrl = _display displayCtrl IDC_DISPLAYADMIN_PANELLEFT_TREEUNITS;

		private _index = ["treeGetDataIndex", [[player] call BIS_fnc_objectVar]] call SELF;

		_ctrl tvSetCurSel _index;
	};

	case "treeSelectFocus" : {
		private _display = DISPLAY;
		private _ctrl = _display displayCtrl IDC_DISPLAYADMIN_PANELLEFT_TREEUNITS;

		private _focus = uiNamespace getVariable ["CQC_displayAdmin_focus", objNull];
		private _index = ["treeGetDataIndex", [[_focus] call BIS_fnc_objectVar]] call SELF;

		if (_index isNotEqualTo tvCurSel _ctrl) then {
			_ctrl tvSetCurSel _index;
		};
	};

	case "onTreeSelChanged" : {
		_args params [
			["_ctrl", controlNull, [controlNull]],
			["_index", [], [[]]]
		];
		
		private _display = DISPLAY;

		private _data = _ctrl tvData _index;
		private _object	= missionNamespace getVariable [_data, objNull];

		if !(count _index < 3) then {
			["setFocus", ["tree", _object]] call SELF;
		};

		["updateUnitToolbar"] call SELF;
	};

	case "onButtonExpandTreeClick": {
		_args params [["_display", displayNull, [displayNull]]];
		
		tvExpandAll (_display displayCtrl IDC_DISPLAYADMIN_PANELLEFT_TREEUNITS);
	};

	case "onButtonCollapseTreeClick": {
		_args params [["_display", displayNull, [displayNull]]];
		
		tvCollapseAll (_display displayCtrl IDC_DISPLAYADMIN_PANELLEFT_TREEUNITS);
	};

	case "onButtonFpsClicked": {
		_args params [["_display", displayNull, [displayNull]]];
		private _focus = uiNamespace getVariable ["CQC_displayAdmin_focus", objNull];
		private _camera = CAMERA;
		if !(isNull _focus) then {
			_camera cameraEffect ["Terminate", "BACK"];
			_focus switchCamera "INTERNAL";
			["setCameraButtonStates", ["fps"]] call SELF;
			_display setVariable ["CQC_displayAdmin_cameraMode", "fps"]
		};
	};
	
	case "onButtonFollowClicked": {
		_args params [["_display", displayNull, [displayNull]]];
		private _focus = uiNamespace getVariable ["CQC_displayAdmin_focus", objNull];
		private _cameraMode = _display getVariable ["CQC_displayAdmin_cameraMode", "free"];
		private _camera = CAMERA;
		if !(isNull _focus) then {
			if (_cameraMode == "fps") then {
				_camera cameraEffect ["internal", "back"];
				cameraEffectEnableHUD true;
			};
			_camera camCommand "manual off";
			["cameraSetTarget", [_focus]] call SELF;
			["setCameraButtonStates", ["follow"]] call SELF;
			_display setVariable ["CQC_displayAdmin_cameraMode", "follow"]
		};
	};
	
	case "onButtonFreeClicked": {
		_args params [["_display", displayNull, [displayNull]]];
		private _cameraMode = _display getVariable ["CQC_displayAdmin_cameraMode", "free"];
		private _camera = CAMERA;
		
		if (_cameraMode == "fps") then {	
			_camera cameraEffect ["internal", "back"];
			hint "happening";
			cameraEffectEnableHUD true;
		};
		_camera camCommand "manual on";
		["cameraResetTarget"] call SELF;
		["setCameraButtonStates", ["free"]] call SELF;
		_display setVariable ["CQC_displayAdmin_cameraMode", "free"]
	};

	case "setCameraButtonStates": {
		_args params [["_mode", "free",[""]]];
		private _display = DISPLAY;

		private _ctrlButtonFree = _display displayCtrl IDC_DISPLAYADMIN_CAMERABAR_BUTTONFREE;
		private _ctrlButtonFollow = _display displayCtrl IDC_DISPLAYADMIN_CAMERABAR_BUTTONFOLLOW;
		private _ctrlButtonFps = _display displayCtrl IDC_DISPLAYADMIN_CAMERABAR_BUTTONFPS;
		
		_ctrlButtonFree ctrlSetText CAM_ICON_FREE;
		_ctrlButtonFollow ctrlSetText CAM_ICON_FOLLOW;
		_ctrlButtonFps ctrlSetText CAM_ICON_FPS;
		
		switch _mode do {
			case "free" : 	{_ctrlButtonFree ctrlSetText CAM_ICON_FREE_SELECTED;};
			case "follow" : {_ctrlButtonFollow ctrlSetText CAM_ICON_FOLLOW_SELECTED;};
			case "fps" : 	{_ctrlButtonFps ctrlSetText CAM_ICON_FPS_SELECTED;};
		};
	};

	case "treeUnselect" : {
		private _display = DISPLAY;
		private _ctrl = _display displayCtrl IDC_DISPLAYADMIN_PANELLEFT_TREEUNITS;
		private _ctrls = allControls (_display displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR);

		_ctrl tvSetCurSel [-1];

		{
			_x ctrlEnable false;
		} forEach _ctrls - [_ctrls select 0];

		(_display displayCtrl IDC_DISPLAYADMIN_STATUSBAR_EDITHEALTH) ctrlSetText "-";
    	(_display displayCtrl IDC_DISPLAYADMIN_STATUSBAR_EDITXPOS) ctrlSetText "-";
    	(_display displayCtrl IDC_DISPLAYADMIN_STATUSBAR_EDITYPOS) ctrlSetText "-";
    	(_display displayCtrl IDC_DISPLAYADMIN_STATUSBAR_EDITZPOS) ctrlSetText "-";
		(_display displayCtrl IDC_DISPLAYADMIN_STATUSBAR_LINKGAMECP) ctrlSetStructuredText parseText "";
	};

	case "treeClear" : {
		private _display = DISPLAY;
		private _ctrl = _display displayCtrl IDC_DISPLAYADMIN_PANELLEFT_TREEUNITS;

		if (!isNull _ctrl) then
		{
			tvClear _ctrl;
		};
	};

	case "getGroupTextures": {
        _args params [["_group", grpNull, [grpNull]]];

		private _side = str side _group;
		private _texture = "";

		switch _side do {
			case "WEST": {
				_texture = "\a3\ui_f\Data\Map\Markers\nato\b_unknown.paa";
			};
			case "EAST": {
				_texture = "\a3\ui_f\Data\Map\Markers\nato\o_unknown.paa";
			};
			default {
				_texture = "\a3\ui_f\Data\Map\Markers\nato\n_unknown.paa";
			};
		};
		_texture;
    };

	case "setFocus": {
		_args params [
			["_type", "tree", [""]],
			["_newFocus", objNull, [objNull]]
		];

		private _display = DISPLAY;
		//private _currentFocus = uiNamespace getVariable ["focus", objNull];
		//private _object	= missionNamespace getVariable ["_newFocus", objNull];
		private _cameraMode = _display getVariable ["CQC_displayAdmin_cameraMode", "free"];

		if (!isNull _newFocus) then {
			uiNamespace setVariable ["CQC_displayAdmin_focus", _newFocus];

			private _ctrls = allControls (_display displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR);
			
			{
				_x ctrlEnable true;
			} forEach _ctrls - [_ctrls select 0];

			(_display displayCtrl IDC_DISPLAYADMIN_STATUSBAR_LINKGAMECP) ctrlSetStructuredText parseText format ["", getPlayerUID _newFocus];

			switch _type do {
				case "tree": {
					if (_cameraMode == "fps") then {
						_newFocus switchCamera "INTERNAL"
					};
				};
				
				case "map": {
					["treeSelectFocus"] call SELF;
				};
				
				case "world": {
					["cameraSetTarget", [_newFocus]] call SELF;
					playsound "ReadoutClick";
					setMousePosition [0.5, 0.5];
					["treeSelectFocus"] call SELF;
				};
			};
		} else {
			uiNamespace setVariable ["CQC_displayAdmin_focus", objNull];
			playsound "ReadoutHideClick1";
			["cameraResetTarget"] call SELF;
			["treeUnselect"] call SELF;
		};
	};

	case "cameraSetTarget": {
		_args params [["_object", objNull, [objNull]]];

		private _display = DISPLAY;
		private _camera = CAMERA;
		private _dummy = uiNamespace getVariable ["CQC_displayAdmin_cameraDummyTarget", objNull];
		private _location = _object worldToModel (_object modelToWorldVisual (_object selectionPosition "Head"));

		if (!isNull _camera && !isNull _dummy) then
		{
			_dummy attachTo [vehicle _object, _location];
			_camera camPrepareTarget _dummy;
			_camera camCommitPrepared 0.5;

			_display setVariable ["CQC_displayAdmin_cameraHasTarget", true];
		};
	};

	case "cameraResetTarget": {
		private _display = DISPLAY;
		private _camera = CAMERA;
		private _dummy = uiNamespace getVariable ["CQC_displayAdmin_cameraDummyTarget", objNull];

		if (!isNull _camera && !isNull _dummy) then
		{
			_camera camPrepareTarget objNull;
			_camera camCommitPrepared 0.0;

			detach _dummy;

			_display setVariable ["CQC_displayAdmin_cameraHasTarget", false];
		};
	};

	case "onMapClick": {
		_args params [
			["_ctrlMap", controlNull, [controlNull]],
			["_button", 0, [0]],
			["_xPos", 0, [0]],
			["_yPos", 0, [0]]
		];

		if (_button != 0) exitWith {};

		private _display = DISPLAY;
		private _camera = CAMERA;
		private _highlightedObject = _display getVariable ["CQC_displayAdmin_mapCursorObject", objNull];

		if (!isNull _camera) then
		{
			if (!isNull _highlightedObject) then
			{
				["setFocus", ["world", _highlightedObject]] call SELF;
			}
			else
			{
				if (!isNull (uiNamespace getVariable ["CQC_displayAdmin_focus", objNull])) then
				{
					playsound "ReadoutHideClick1";
				};

				["setFocus", ["world", objNull]] call SELF;

				private _pos = _ctrlMap ctrlMapScreenToWorld [_xPos, _yPos];
				_pos set [2, (getPosASLVisual _camera) select 2];

				_camera setPosASL _pos;
			};
		};
	};

	case "onDraw": {
		_args params [["_ctrlMap", controlNull, [controlNull]]];

		private _display = DISPLAY;
		private _camera = CAMERA;
		private _focus = uiNamespace getVariable ["CQC_displayAdmin_focus", objNull];
		private _cursorObject = _display getVariable ["CQC_displayAdmin_mapCursorObject", objNull];

		if (!isNull _ctrlMap) then
		{
			if (!isNull _display && !isNull _camera) then
			{
				private _loc = _ctrlMap ctrlMapScreenToWorld getMousePosition;
				private _entities = allPlayers;
				private _nearestEntity = objNull;
				private _text = "";
				private _minDist = 999999;

				{
					private _dist = _x distance2D _loc;

					if (_dist < _minDist && { _dist < 3.0 }) then
					{
						_minDist = _dist;
						_nearestEntity = _x;
					};
				} forEach _entities;

				if (!isNull _nearestEntity) then
				{
					_display setVariable ["CQC_displayAdmin_mapCursorObject", _nearestEntity];
				}
				else
				{
					_display setVariable ["CQC_displayAdmin_mapCursorObject", objNull];
				};
			};
		};

		private _cameraPos = getPosASLVisual _camera;
		private _cameraDir = getDirVisual _camera;
		_ctrlMap drawIcon ["a3\ui_f\data\gui\rsc\rscdisplaymissioneditor\iconcamera_ca.paa", [0,0.984,1,1], _cameraPos, 32.0, 36.0, _cameraDir, "", 1, 0.05, "TahomaB", "right"];
		//_ctrlMap drawArrow [_cameraPos, [_cameraPos, 300, _cameraDir] call BIS_fnc_relPos, [0,0.984,1,1]];

		
		{
			private _icon = getText (configfile >> "CfgVehicles" >> typeOf vehicle _x >> "icon");

			private _unitIcon = switch (true) do {
				case (!alive _x	) : 	{ ICON_DEAD };
				default 				{ if (_icon == "iconMan") then {getText (configfile >> "CfgVehicleIcons" >> _icon)} else {_icon} };
			};

			private _color = switch (_x) do {
            	case _focus: {[0.95,0.95,0.95,1]};
				case _cursorObject: {[0.95,0.95,0.95,1]};
            	default {[0,0.3,0.6,1]};
        	};

			private _crew = count (crew vehicle _x);

			private _text = switch (true) do {
				case (isNull (objectParent _x)): {format ["%1", name _x]};
				case (_crew > 1): {format ["%1 + %2", name _x, count (crew vehicle _x)]};
            	default {format ["%1", name _x]};
			};

			private _dir = switch (true) do {
				case (alive _x): {getDir vehicle _x};
            	default {0};
			};

			_ctrlMap drawIcon
			[
				_unitIcon,
				_color,
				getPos vehicle _x,
				24,
				24,
				getDir vehicle _x,
				_text,
				1,
				0.06,
				"RobotoCondensed",
				"right"
			];
		} forEach allPlayers;
	};

	case "onDraw3D": {
		_args params [["_display", displayNull, [displayNull]]];

		private _focus = uiNamespace getVariable ["CQC_displayAdmin_focus", objNull];
		private _intersections = [getMousePosition select 0, getMousePosition select 1, _focus, vehicle _focus] call BIS_fnc_getIntersectionsUnderCursor;
		private _cursorObject = objNull;

		if (count _intersections > 0) then
		{
			_cursorObject = (_intersections select 0) select 3;
		};

		if ( 
			_cursorObject isKindOf "Air" 
			|| { _cursorObject isKindOf "Car" } 
			|| { _cursorObject isKindOf "Boat" }
			|| { _cursorObject isKindOf "Submarine" } 
			|| { _cursorObject isKindOf "Plane"} 
			|| { _cursorObject isKindOf "Tank"}
			|| { _cursorObject isKindOf "Man"} 
		) then {
			if (!(_cursorObject isKindOf "Man") && {count crew _cursorObject > 0}) then
			{
				_cursorObject = (crew _cursorObject) select 0;
			}
			else
			{
				_cursorObject = _cursorObject;
			};
		} else {
			_cursorObject = objNull;
		};

		uiNamespace setVariable ["CQC_displayAdmin_cursorFocus", _cursorObject];

		// Update UI Elements (Tick 1s)
		if (time >= (_display getVariable ["CQC_displayAdmin_lastTickTime", 0.0]) + 1.0) then {
			_display setVariable ["CQC_displayAdmin_lastTickTime", time];

			["updatePlayerList"] call SELF;
			["updateUnitToolbar"] call SELF;
		};

		// Draw Units
		private _units = allUnits;
		_units = _units apply {[_x distance positionCameraToWorld [0,0,0], _x]};
		_units sort false;
		if (_display getVariable ["CQC_displayAdmin_drawUnits", true]) then {
			{
				private _target = _x select 1;
				private _text 	= name _target;
				private _color	= [0,0,0,1];
				private _pos	= _target modelToWorldVisual (_target selectionPosition "Head"); _pos set [2, (_pos select 2) + 1.0];
				private _camera = CAMERA;
				private _camDistance = positionCameraToWorld [0,0,0];

				private _focus = uiNamespace getVariable ["CQC_displayAdmin_focus", objNull];
				private _cursorObject = uiNamespace getVariable ["CQC_displayAdmin_cursorFocus", objNull];
				
				switch (_target) do {
            		case _focus: {_color = [0.95,0.95,0.95,1]};
					case _cursorObject: {_color = [0.95,0.95,0.95,1]};
            		default {_color = [0,0.3,0.6,1]};
        		};

				if (_target distance _camDistance < 1000) then {
					drawIcon3D [
						"", 
						_color, 
						_pos, 
						5.0, 
						linearConversion [0, 1500, _camDistance distance _target, -2.15, -1.6, true], 
						0, 
						_text, 
						2,
						linearConversion [0, 1500, _camDistance distance _target, 0.035, 0.025, true], 
						"RobotoCondensed", 
						"center"
					];
				};

				if (_target distance _camDistance < 1500) then {
					drawIcon3D [
						ICON_UNIT, 
						_color, 
						_pos, 
						3.5, 
						3.5, 
						0, 
						"", 
						2, 
						0.035, 
						"RobotoCondensed", 
						"center"
					];
				};
			} forEach _units;
		};

		// Draw Arena Locations
		if (_display getVariable ["CQC_displayAdmin_drawLocations", true]) then {
			{
				private _pos = getMarkerPos (_x select 1);
				_pos set [2,0];
				if (_pos distance positionCameraToWorld [0,0,0] < 2000) then {
					drawIcon3D [
						"\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa",
						[1,1,1,1],
						_pos,
						0.85,
						0.85,
						0,
						format ["%1 (%2/%3)", _x select 0, count (allUnits inAreaArray (_x select 1)), _x select 2],
						2
					];
				};
			} forEach (_display getvariable ["CQC_displayAdmin_arenaMarkers", []]);
		};
	};

	case "onEachFrame": {
		_args params [["_display", displayNull, [displayNull]]];
		private _focus = uiNamespace getVariable ["CQC_displayAdmin_focus", objNull];
		private _cameraMode = _display getVariable ["CQC_displayAdmin_cameraMode", "free"];

		// Calculate delta time
		private _curTime = time;
		private _lastTickTime = _display getVariable ["CQC_displayAdmin_cameraLastTickTime", 0.0];
		private _deltaTime = _curTime - _lastTickTime;
		_display setVariable ["CQC_displayAdmin_cameraLastTickTime", _curTime];
		_display setVariable ["CQC_displayAdmin_cameraDeltaTime", _deltaTime];

		if (!isNull _focus && {_cameraMode == "follow"}) then {
			private _camera = CAMERA;
			private _deltaTime = _display getVariable ["CQC_displayAdmin_cameraDeltaTime", 0.0];
			private _dummy = uiNamespace getVariable ["CQC_displayAdmin_cameraDummyTarget", objNull];
			private _zoom = if (_cameraMode == "follow") then { _display getVariable ["CQC_displayAdmin_followCameraZoom", 0.0] } else { 0.0 };
			private _zoomTemp = _display getVariable ["CQC_displayAdmin_followCameraZoomTemp", 0.0];
			private _isMan = _focus isKindOf "Man";
			private _bbd = [_focus] call BIS_fnc_getObjectBBD;
			private _height = if (!_isMan) then { (_bbd select 2) / 3.0 } else { switch (stance _focus) do { case "STAND": {1.4}; case "CROUCH": {0.8}; default {0.4}; }; };

			// Interpolate zoom
			if (_zoomTemp != _zoom) then
			{
				_zoomTemp = [_zoomTemp, _zoom, _deltaTime, 10.0] call BIS_fnc_interpolate;
				_display setVariable ["CQC_displayAdmin_followCameraZoomTemp", _zoomTemp];
			};

			// The distance at which to place camera from the focus pivot
			private _distance = (_bbd select 1) + _zoomTemp;

			// The pivot on the target vehicle
			private _center = if (_isMan) then { AGLToASL (_focus modelToWorldVisual (_focus selectionPosition "Spine3")) } else { AGLToASL (_focus modelToWorldVisual [0,0,_height]) };

			// The camera pitch and yaw
			private _cameraYaw = _display getVariable ["CQC_displayAdmin_followCameraYaw", 0.0];
			private _cameraPitch = _display getVariable ["CQC_displayAdmin_followCameraPitch", 0.0];
			private _dirTemp = _display getVariable ["CQC_displayAdmin_followCameraDirTemp", 0.0];

			// Set dummy location and rotation
			_dummy setPosASL _center;
			[_dummy, [_dirTemp + _cameraYaw, _cameraPitch, 0.0]] call BIS_fnc_setObjectRotation;

			// Apply location and rotation to camera
			_camera setPosASL (AGLToASL (_dummy modelToWorldVisual [0, -_distance, 0]));
			_camera setVectorDirAndUp [vectorDirVisual _dummy, vectorUpVisual _dummy];
		};

		if !(isNull _focus) then {
    		(_display displayCtrl IDC_DISPLAYADMIN_STATUSBAR_EDITHEALTH) ctrlSetText format ["%1%2", round((1 - (damage _focus)) * 100), "%"];
    		(_display displayCtrl IDC_DISPLAYADMIN_STATUSBAR_EDITXPOS) ctrlSetText format ["%1", getPosASL _focus select 0];
    		(_display displayCtrl IDC_DISPLAYADMIN_STATUSBAR_EDITYPOS) ctrlSetText format ["%1", getPosASL _focus select 1];
    		(_display displayCtrl IDC_DISPLAYADMIN_STATUSBAR_EDITZPOS) ctrlSetText format ["%1", getPosASL _focus select 2];
    	};

	};

	case "toggleVisionMode" : {
		private _display = DISPLAY;
		private _control = _display displayCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONVISIONMODE;

		if (_display getVariable ["CQC_displayAdmin_cameraMode", "free"] != "fps") then
		{
			private _currentMode = _display getVariable ["CQC_displayAdmin_cameraVisionMode", 0];
			private _newMode = _currentMode;

			switch (_currentMode) do
			{
				case 1 : { 
					camUseNVG false; 
					true setCamUseTi 0; 
					_control ctrlSetText "\a3\3DEN\Data\Displays\Display3DEN\toolbar\vision_ti_ca.paa"; 
					_display setVariable ["CQC_displayAdmin_cameraVisionMode", 2]; 
					_newMode = 2; 
				};
				
				case 2 : { 
					camUseNVG false; 
					false setCamUseTi 0; 
					_control ctrlSetText "\a3\3DEN\Data\Displays\Display3DEN\toolbar\vision_normal_ca.paa";
					_display setVariable ["CQC_displayAdmin_cameraVisionMode", 0]; 
					_newMode = 0; 
				};
				
				default  { 
					camUseNVG true; 
					false setCamUseTi 0; 
					_control ctrlSetText "\a3\3DEN\Data\Displays\Display3DEN\toolbar\vision_nvg_ca.paa";
					_display setVariable ["CQC_displayAdmin_cameraVisionMode", 1]; 
					_newMode = 1; 
				};
			};

			playSound "RscDisplayCurator_visionMode";
			_display setVariable ["CQC_displayAdmin_cameraVisionMode", _newMode];
		};
	};
	
	case "togglePannelLeftOn": {
		_args params [["_display", displayNull, [displayNull]]];
		private _ctrlButtonToggleOn = _display displayCtrl IDC_DISPLAYADMIN_PANELLEFT_TOGGLEON;
		private _ctrlsGroupPannelLeft = _display displayCtrl IDC_DISPLAYADMIN_PANELLEFT;
		private _ctrlSeperator7 = _display displayCtrl IDC_DISPLAYADMIN_SEPERATOR_7;
		private _ctrlButtonEject = _display displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONEJECT;
		//private _ctrlButtonDisableFire = _display displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONDISABLEFIRE;
		//private _ctrlButtonSpeed = _display displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONSPEED;

		_ctrlButtonToggleOn ctrlShow false;
		_ctrlsGroupPannelLeft ctrlShow true;

		if (call CQC_adminLevel < 3) then {
			{
				_x ctrlShow false;
			} forEach [_ctrlSeperator7, _ctrlButtonEject];
		};
	};

	case "togglePannelLeftOff": {
		_args params [["_display", displayNull, [displayNull]]];
		private _ctrlButtonToggleOn = _display displayCtrl IDC_DISPLAYADMIN_PANELLEFT_TOGGLEON;
		private _ctrlsGroupPannelLeft = _display displayCtrl IDC_DISPLAYADMIN_PANELLEFT;

		_ctrlButtonToggleOn ctrlShow true;
		_ctrlsGroupPannelLeft ctrlShow false;
	};

	case "toggleUiVisibility": {
		private _display = DISPLAY;
		private _isDisplayHidden = _display getVariable ["CQC_displayAdmin_isDisplayHidden", false];
		private _isSearchFocused = _display getVariable ["CQC_displayAdmin_isSearchFocused", false];
		private _ctrlsGroupCamera = _display displayCtrl IDC_DISPLAYADMIN_CAMERABAR;
		private _ctrlsGroupCameraCtrls = allControls _ctrlsGroupCamera;
		private _ctrlButtonToggleOn = _display displayCtrl IDC_DISPLAYADMIN_PANELLEFT_TOGGLEON;
		private _ctrlMap = _display displayCtrl IDC_DISPLAYADMIN_MAP;

		private _ctrlWhitelist = [];
		
		{
			_ctrlWhitelist pushBack _x;
		} forEach _ctrlsGroupCameraCtrls;

		_ctrlWhitelist pushback _ctrlMap;
		_ctrlWhitelist pushback _ctrlsGroupCamera;

		if !(_isSearchFocused) then {
            if (_isDisplayHidden) then {
                {
					_x ctrlSetFade 0; 
					_x ctrlCommit 0.1;
				} forEach allControls _display - [_ctrlMap];
				_ctrlsGroupCamera ctrlSetPositionY (safezoneY + safezoneH - 2.38 * ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 19));
				_ctrlsGroupCamera ctrlCommit 0.1;
                _display setVariable ["CQC_displayAdmin_isDisplayHidden", false];
            } else {
                {
					_x ctrlSetFade 1; 
					_x ctrlCommit 0.1;
				} forEach allControls _display - _ctrlWhitelist;
				_ctrlsGroupCamera ctrlSetPositionY (safezoneY + safezoneH - 2.38 * ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25));
				_ctrlsGroupCamera ctrlCommit 0.1;
                _display setVariable ["CQC_displayAdmin_isDisplayHidden", true];
            };
        };
	};

	case "toggleMap": {
		private _display = DISPLAY;
		private _camera = CAMERA;
		private _ctrl = _display displayCtrl IDC_DISPLAYADMIN_MAP;
		private _ctrlButtonMap = _display displayCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONMAP;
		
		if (ctrlShown _ctrl) then {
			_ctrl ctrlShow false;
			if (_display getVariable ["CQC_displayAdmin_cameraMode", "free"] == "free") then {_camera camCommand "manual on";};
			_ctrlButtonMap ctrlSetText "\a3\3DEN\Data\Displays\Display3DEN\toolbar\map_off_ca.paa";
			_display setVariable ["CQC_displayAdmin_isMapVisible", false];
		} else {
			_ctrl ctrlShow true;
			_camera camCommand "manual off";
			_ctrlButtonMap ctrlSetText "\a3\3DEN\Data\Displays\Display3DEN\toolbar\map_on_ca.paa";
			_display setVariable ["CQC_displayAdmin_isMapVisible", true];
		};
	};

	case "addZoomInput": {
		_args params [["_value", 0.0, [0.0]]];
		private _display = DISPLAY;
		private _zoom = _display getVariable ["CQC_displayAdmin_followCameraZoom", 0.0];
		_zoom = _zoom + _value;

		if (_zoom > 5.0) then
		{
			_zoom = 5.0;
		};

		if (_zoom < 0) then
		{
			_zoom = 0.0;
		};

		_display setVariable ["CQC_displayAdmin_followCameraZoom", _zoom];
	};

	case "addYawInput": {
		_args params [["_value", 0.0, [0.0]]];
		private _display = DISPLAY;
		private _yaw = _display getVariable ["CQC_displayAdmin_followCameraYaw", 0.0];
		_yaw = _yaw + _value;

		if (_yaw > 180.0) then
		{
			_yaw = _yaw - 360.0;
		};

		if (_yaw < -180.0) then
		{
			_yaw = _yaw + 360.0;
		};

		_display setVariable ["CQC_displayAdmin_followCameraYaw", _yaw];
	};

	case "addPitchInput": {
		_args params [["_value", 0.0, [0.0]]];
		private _display = DISPLAY;
		private _pitch = _display getVariable ["CQC_displayAdmin_followCameraPitch", 0.0];
		_pitch = _pitch - _value;

		if (_pitch > 90.0) then
		{
			_pitch = 90.0;
		};

		if (_pitch < -90.0) then
		{
			_pitch = -90.0;
		};

		_display setVariable ["CQC_displayAdmin_followCameraPitch", _pitch];
	};

	case "mouseButtonDown": {
		_args params [
			["_ctrl", controlNull, [controlNull]],
			["_key", 0, [0]]
		];
		private _display = DISPLAY;
		private _cameraMode = _display getVariable ["CQC_displayAdmin_cameraMode", "free"];

		if !(_display getVariable ["CQC_displayAdmin_isMapVisible", false]) then {
			switch (_key) do {
				// Left mouse button
				case 0 :
				{
					private _cursorObject = uiNamespace getVariable ["CQC_displayAdmin_cursorFocus", objNull];
					private _currentFocus = uiNamespace getVariable ["CQC_displayAdmin_focus", objNull];

					if (!isNull _cursorObject && {_cursorObject isKindOf "Man"} && {_cursorObject != _currentFocus}) then
					{
						["setFocus", ["world", _cursorObject]] call SELF;
					}
					else
					{
						["setFocus", ["world", objNull]] call SELF;
						if (_cameraMode == "fps") then {
							["onButtonFreeClicked", [_display]] call SELF;
						};
					};
				};

				// Right mouse button
				case 1 : {
					_display setVariable ["CQC_displayAdmin_isHoldingRightMouseButton", true];
					if !(_cameraMode == "fps") then {
						["cameraResetTarget"] call SELF;
					};
				};
			};
		};
	};

	case "mouseButtonUp": {
		_args params [
			["_ctrl", controlNull, [controlNull]],
			["_key", 0, [0]]
		];

		private _display = DISPLAY;
		if !(_display getVariable ["CQC_displayAdmin_isMapVisible", false]) then {
			if (_key == 1) then
			{
			_display setVariable ["CQC_displayAdmin_isHoldingRightMouseButton", false];
			};
		};
	};

	case "mouseButtonDblClick": {
		_args params [
			["_ctrl", controlNull, [controlNull]],
			["_key", 0, [0]]
		];
		
		if (_key == 0) then {
			
		};
	};

	case "mouseZChanged": {
		_args params [
			["_ctrl", controlNull, [controlNull]],
			["_value", 0, [0]]
		];

		private _display = DISPLAY;
		private _cameraMode = _display getVariable ["CQC_displayAdmin_cameraMode", "free"];

		if !(_display getVariable ["CQC_displayAdmin_isMapVisible", false]) then {
			if (_cameraMode isEqualTo "follow") then
			{
				if (_value > 0) then
				{
					["addZoomInput", [-1.0]] call SELF;
				}
				else
				{
					["addZoomInput", [1.0]] call SELF;
				};
			};
		};
	};

	case "mouseMoving": {
		_args params [
			["_display", displayNull, [displayNull]],
			["_deltaX", 0.0, [0.0]],
			["_deltaY", 0.0, [0.0]]
		];

		if (_display getVariable ["CQC_displayAdmin_cameraMode", "free"] == "follow" && { _display getVariable ["CQC_displayAdmin_isHoldingRightMouseButton", false] }) then {
			private _deltaTime = _display getVariable ["CQC_displayAdmin_cameraDeltaTime", 1.0];

			if (_deltaX != 0.0) then
			{
				["addYawInput", [_deltaX * 100 * _deltaTime]] call SELF;
			};

			if (_deltaY != 0.0) then
			{
				["addPitchInput", [_deltaY * 100 * _deltaTime]] call SELF;
			};
		};
	};

	case "deleteCursorVehicle": {
		private _cursorObject = uiNamespace getVariable ["CQC_displayAdmin_cursorFocus", objNull];
		
		if ( 
			_cursorObject isKindOf "Air" 
			|| { _cursorObject isKindOf "Car" } 
			|| { _cursorObject isKindOf "Boat" }
			|| { _cursorObject isKindOf "Submarine" } 
			|| { _cursorObject isKindOf "Plane"} 
			|| { _cursorObject isKindOf "Tank"}
			|| { _cursorObject isKindOf "Man"} 
		) then {
			if (count (crew _cursorObject) isEqualTo 0) then {
				deleteVehicle _cursorObject;
			};
		};
	};

	case "teleportToCursor": {
		_args params [["_isShift", false, [false]]];
		
		if (call CQC_adminLevel > 1) then {
			private _focus = uiNamespace getVariable ["CQC_displayAdmin_focus", objNull];

			private _vehicle = vehicle _focus;
			private _surfaces = [getMousePosition select 0, getMousePosition select 1] call BIS_fnc_getIntersectionsUnderCursor;
			private _worldPos = ASLtoAGL (_surfaces select 0 select 0);

			if !(isNull _focus) then {
				if (count _surfaces > 0) then {
					_worldPos = ASLtoAGL (_surfaces select 0 select 0);
				} else {
					_worldPos = screenToWorld getMousePosition;
				};

				private _altitude = 0.2 + (_worldPos select 2); //if (_vehicle != _focus) then {getPosATL _vehicle select 2} else {_worldPos select 2};

				if (_isShift) then {
					_vehicle setPosATL [_worldPos select 0,_worldPos select 1,_altitude];
					_vehicle setVelocity [0,0,0];
				} else {
					_focus setPosATL [_worldPos select 0,_worldPos select 1,_altitude];
					_focus setVelocity [0,0,0];
				};
			};
		};
	};

	case "updateUnitToolbar": {
		private _display = DISPLAY;
		private _focus = uiNamespace getVariable ["CQC_displayAdmin_focus", objNull];
		private _oldVars = _display getVariable ["CQC_displayAdmin_variableListOld", []];

		private _newVars = [
			_focus getVariable ["frozen", false],
			_focus getVariable ["hidden", false],
			_focus getVariable ["god", false],
			_focus getVariable ["CQC_player_disableFire", false]
		];
		
		if (_oldVars isNotEqualTo _newVars) then {
			private _ctrlButtonFreeze = _display displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONFREEZE;
			private _ctrlButtonHide = _display displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONHIDE;
			private _ctrlButtonGod = _display displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONGOD;
			private _ctrlButtonDisableFire =_display displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONDISABLEFIRE;
			private _ctrlButtonSpeed = _display displayCtrl IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONSPEED;

			switch (_newVars select 0) do {
				case true: {_ctrlButtonFreeze ctrlSetText MISSION_ROOT + "GUI\data\displays\displayAdmin\freeze_on_ca.paa";};
				default {_ctrlButtonFreeze ctrlSetText MISSION_ROOT + "GUI\data\displays\displayAdmin\freeze_off_ca.paa";};
			};

			switch (_newVars select 1) do {
				case true: {_ctrlButtonHide ctrlSetText MISSION_ROOT + "GUI\data\displays\displayAdmin\hide_on_ca.paa";};
				default {_ctrlButtonHide ctrlSetText MISSION_ROOT + "GUI\data\displays\displayAdmin\hide_off_ca.paa";};
			};

			switch (_newVars select 2) do {
				case true: {_ctrlButtonGod ctrlSetText MISSION_ROOT + "GUI\data\displays\displayAdmin\godmode_on_ca.paa";};
				default {_ctrlButtonGod ctrlSetText MISSION_ROOT + "GUI\data\displays\displayAdmin\godmode_off_ca.paa";};
			};

			switch (_newVars select 3) do {
				case true: {_ctrlButtonDisableFire ctrlSetText MISSION_ROOT + "GUI\data\displays\displayAdmin\disablefire_on_ca.paa";};
				default {_ctrlButtonDisableFire ctrlSetText MISSION_ROOT + "GUI\data\displays\displayAdmin\disablefire_off_ca.paa";};
			};

			/*switch (_newVars select 4) do {
				case true: {_ctrlButtonSpeed ctrlSetText MISSION_ROOT + "GUI\data\displays\displayAdmin\speed_on_ca.paa";};
				default {_ctrlButtonSpeed ctrlSetText MISSION_ROOT + "GUI\data\displays\displayAdmin\speed_off_ca.paa";};
			};*/

			_display setVariable ["CQC_displayAdmin_variableListOld", _newVars];
		};

	};

	case "onButtonIntelClick": {
		
	};

	case "onButtonMapClick": {
		["toggleMap"] call SELF;
	};

	case "onButtonDrawEntitiesClick": {
		private _display = DISPLAY;
		private _control = _display displayCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONENTITIES;

		private _drawEntities = !(_display getVariable ["CQC_displayAdmin_drawEntities", false]);
		
		_display setVariable ["CQC_displayAdmin_drawEntities", _drawEntities];
		
		if (_drawEntities) then {
			_control ctrlSetText MISSION_ROOT + "GUI\data\displays\displayAdmin\drawentities_on_ca.paa";
		} else {
			_control ctrlSetText MISSION_ROOT + "GUI\data\displays\displayAdmin\drawentities_off_ca.paa";
		};
	};

	case "onButtonDrawUnitsClick": {
		private _display = DISPLAY;
		private _control = _display displayCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONUNITS;

		private _drawUnits = !(_display getVariable ["CQC_displayAdmin_drawUnits", true]);
		
		_display setVariable ["CQC_displayAdmin_drawUnits", _drawUnits];
		
		if (_drawUnits) then {
			_control ctrlSetText MISSION_ROOT + "GUI\data\displays\displayAdmin\drawunits_on_ca.paa";
		} else {
			_control ctrlSetText MISSION_ROOT + "GUI\data\displays\displayAdmin\drawunits_off_ca.paa";
		};
	};

	case "onButtonDrawLocationsClick": {
		private _display = DISPLAY;
		private _control = _display displayCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONLOCATIONS;

		private _drawLocations = !(_display getVariable ["CQC_displayAdmin_drawLocations", true]);
		
		_display setVariable ["CQC_displayAdmin_drawLocations", _drawLocations];
		
		if (_drawLocations) then {
			_control ctrlSetText MISSION_ROOT + "GUI\data\displays\displayAdmin\drawlocations_on_ca.paa";
		} else {
			_control ctrlSetText MISSION_ROOT + "GUI\data\displays\displayAdmin\drawlocations_off_ca.paa";
		};
	};

	case "onButtonArsenalClick": {
		private _display = DISPLAY;
		_display closeDisplay 1;
		["Open", [true]] spawn BIS_fnc_arsenal;
	};
	
	case "onButtonDebugClick": {
	};

	case "onButtonNotifClick": {
		private _display = DISPLAY;
		_display createDisplay "CQC_displaySendNotification";
	};

	case "onButtonStaffClick": {
		private _display = DISPLAY;
		private _control = _display displayCtrl IDC_DISPLAYADMIN_TOOLBAR_BUTTONSTAFFONDUTY;
		
		if (player getVariable ["onDuty", false]) then {
			if !(player getVariable ["hidden", false]) then {
				player setVariable ["CQC_tags_Icon", "", true];
				player setVariable ["CQC_tags_Subtitle", "CQC Fragger", true];
				player setVariable ["CQC_tags_SubtitleColour", [0.9, 0.9, 0.9, 1], true];
			};

			if (player getVariable ["god", false]) then {
				player allowDamage true;
				player setVariable ["god", false, true];
			};

			player setVariable ["onDuty", false, true];

			_control ctrlSetText MISSION_ROOT + "GUI\data\displays\displayAdmin\g_off_ca.paa";
		} else {
			if !(player getVariable ["hidden", false]) then {
				player setVariable ["CQC_tags_Icon", "Data\Icons\g_red.paa", true];
				player setVariable ["CQC_tags_Subtitle", "Staff on Duty", true];
				player setVariable ["CQC_tags_SubtitleColour", [1, 0.5, 0, 1], true];
			};
			
			if !(player getVariable ["god", false]) then {
				player allowDamage false;
				player setVariable ["god", true, true];
			};

			player setVariable ["onDuty", true, true];

			_control ctrlSetText MISSION_ROOT + "GUI\data\displays\displayAdmin\g_on_ca.paa";
		};

		["updateUnitToolbar"] call SELF;
	};

	case "onButtonHealClick": {
		private _focus = uiNamespace getVariable ["CQC_displayAdmin_focus", objNull];

		if (!isNull _focus) then {
			_focus setDamage 0;
		};
	};

	case "onButtonKillClick": {
		private _focus = uiNamespace getVariable ["CQC_displayAdmin_focus", objNull];

		if (!isNull _focus) then {
			_focus setDamage 1;
		};
	};

	case "onButtonGodClick": {
		private _focus = uiNamespace getVariable ["CQC_displayAdmin_focus", objNull];

		if (!isNull _focus) then {
			if (_focus getVariable ["god", false]) then {
				[_focus, true] remoteExec ["allowDamage", _focus];
				_focus setVariable ["god", false, true];
			} else {
				[_focus, false] remoteExec ["allowDamage", _focus];
				_focus setVariable ["god", true, true];
			};
		};
		
		["updateUnitToolbar"] call SELF;
	};

	case "onButtonHideClick": {
		private _focus = uiNamespace getVariable ["CQC_displayAdmin_focus", objNull];
		private _hidden = _focus getVariable ["hidden", false];

		if (!isNull _focus) then {
			if (_hidden) then {
				[_focus, false] remoteExec ["hideObjectGlobal", 2];
				_focus setVariable ["hidden", false, true];
				if (player getVariable ["onDuty", false]) then {
					player setVariable ["CQC_tags_Icon", "Data\Icons\gta.paa", true];
					player setVariable ["CQC_tags_Subtitle", "Staff on Duty", true];
					player setVariable ["CQC_tags_SubtitleColour", [1, 0.5, 0, 1], true];
				} else {
					player setVariable ["CQC_tags_Icon", "", true];
					player setVariable ["CQC_tags_Subtitle", "CQC Fragger", true];
					player setVariable ["CQC_tags_SubtitleColour", [0.9, 0.9, 0.9, 1], true];
				};
			} else {
				[_focus, true] remoteExec ["hideObjectGlobal", 2];
				_focus setVariable ["hidden", true, true];
				player setVariable ["CQC_tags_Icon", "", true];
				player setVariable ["CQC_tags_Subtitle", "", true];
			};
		};
		
		["updateUnitToolbar"] call SELF;
	};

	case "onButtonFreezeClick": {
		private _focus = uiNamespace getVariable ["CQC_displayAdmin_focus", objNull];
		private _frozen = _focus getVariable ["frozen", false];

		if (!isNull _focus && (_focus != player)) then {
			if (_frozen) then {
				[_focus, false] remoteExec ["disableUserInput", _focus];
				[_focus, true] remoteExec ["enableSimulationGlobal", 2];
				_focus setVariable ["frozen", false, true];
			} else {
				[_focus, true] remoteExec ["disableUserInput", _focus];
				[_focus, false] remoteExec ["enableSimulationGlobal", 2];
				_focus setVariable ["frozen", true, true];
			};
		};
		
		["updateUnitToolbar"] call SELF;
	};

	case "onButtonEjectClick": {
		private _focus = uiNamespace getVariable ["CQC_displayAdmin_focus", objNull];

		if (!isNull _focus && {vehicle _focus != _focus}) then {
			moveOut _focus;
		};
	};

	case "onButtonDisableFireClick": {
		private _focus = uiNamespace getVariable ["CQC_displayAdmin_focus", objNull];
		private _disableFire = _focus getVariable ["CQC_player_disableFire", false];

		if (!isNull _focus) then {
			if (_disableFire) then {
				_focus setVariable ["CQC_player_disableFire", false, true];
			} else {
				_focus setVariable ["CQC_player_disableFire", true, true];
			};
		};

		["updateUnitToolbar"] call SELF;
	};

	/*case "onButtonSpeedClick": {
		private _focus = uiNamespace getVariable ["CQC_displayAdmin_focus", objNull];
		private _speed = _focus getVariable ["speed", false];

		if (!isNull _focus) then {
			if (_speed) then {
				[_focus, 1] remoteExec ["setAnimSpeedCoef", _focus];
				_focus setVariable ["speed", false, true];
			} else {
				[_focus, 10] remoteExec ["setAnimSpeedCoef", _focus];
				_focus setVariable ["speed", true, true];
			};
		};

		["updateUnitToolbar"] call SELF;
	};*/
};