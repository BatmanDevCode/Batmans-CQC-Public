#include "script_component.hpp"
/*
 File: displaySelectVehicle.sqf
 Author: FragS
 Description: Handles the vehicle selection display.
*/

#define SELF                    CQC_displaySelectVehicle_script

disableSerialization;

params [
    ["_event", "", [""]],
    ["_args", []]
];

switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlToolBox = _display displayCtrl IDC_DISPLAYVVS_TOOLBOX;
        _ctrlToolBox ctrlAddEventHandler ["ToolBoxSelChanged", {["onToolBoxSelChanged", _this] call SELF}];
        _ctrlToolBox ctrlEnable false;

        private _ctrlListCars = _display displayCtrl IDC_DISPLAYVVS_LISTCARS;
        _ctrlListCars ctrlAddEventHandler ["LBDblClick", {["onButtonSpawnClick", ctrlParent (_this select 0)] call SELF}];
        
        private _ctrlListAir = _display displayCtrl IDC_DISPLAYVVS_LISTAIR;
        _ctrlListAir ctrlAddEventHandler ["LBDblClick", {["onButtonSpawnClick", ctrlParent (_this select 0)] call SELF}];

        private _ctrlListTank = _display displayCtrl IDC_DISPLAYVVS_LISTTANK;
        _ctrlListTank ctrlAddEventHandler ["LBDblClick", {["onButtonSpawnClick", ctrlParent (_this select 0)] call SELF}];

        private _ctrlButtonSpawn = _display displayCtrl IDC_DISPLAYVVS_BUTTONSPAWN;
        _ctrlButtonSpawn ctrlAddEventHandler ["ButtonClick", {["onButtonSpawnClick", ctrlParent (_this select 0)] call SELF}];

        private _ctrlStaticHeader = _display displayCtrl IDC_DISPLAYVVS_HEADER;

        private _currentArena = missionNamespace getVariable "CQC_player_currentArena";
        private _menuClass = getText (CFG_SPAWNS_REGULAR >> _currentArena >> "vehicles");
        private _displayName = getText (CFG_VEHICLE_LISTS >> _menuClass >> "displayName");
        private _vehicles = getArray (CFG_VEHICLE_LISTS >> _menuClass >> "vehicles");

        _ctrlStaticHeader ctrlSetText format ["Select Vehicle (%1)", _displayName];

        {
            private _configClass = configFile >> "cfgVehicles" >> _x;
            private _displayName = getText (_configClass >> "displayName");
            private _icon = getText (_configClass >> "picture");
                
            private _index = _ctrlListCars lbAdd _displayName;

            _ctrlListCars lbSetData [_index, _x]; 
            _ctrlListCars lbSetPicture [_index, _icon];    
        } forEach _vehicles;
        
        if (CQC_player_currentArena == "AirTank") then {
            ["setupAirTank", _display] call SELF;
            _ctrlToolBox ctrlEnable true;
        };
    };
    
    case "setupAirTank": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlListAir = _display displayCtrl IDC_DISPLAYVVS_LISTAIR;
        private _ctrlListTank = _display displayCtrl IDC_DISPLAYVVS_LISTTANK;

        private _vehiclesAir = getArray (CFG_VEHICLE_LISTS >> "Air" >> "vehicles");
        private _vehiclesTank = getArray (CFG_VEHICLE_LISTS >> "Tank" >> "vehicles");

        {
            private _configClass = configFile >> "cfgVehicles" >> _x;
            private _displayName = getText (_configClass >> "displayName");
            private _icon = getText (_configClass >> "picture");
                
            private _index = _ctrlListAir lbAdd _displayName;

            _ctrlListAir lbSetData [_index, _x]; 
            _ctrlListAir lbSetPicture [_index, _icon];    
        } forEach _vehiclesAir;

        {
            private _configClass = configFile >> "cfgVehicles" >> _x;
            private _displayName = getText (_configClass >> "displayName");
            private _icon = getText (_configClass >> "picture");
                
            private _index = _ctrlListTank lbAdd _displayName;

            _ctrlListTank lbSetData [_index, _x]; 
            _ctrlListTank lbSetPicture [_index, _icon];    
        } forEach _vehiclesTank;
    };

    case "onToolBoxSelChanged": {
        _args params [
            ["_ctrl", controlNull, [controlNull]],
            ["_index", 0, [0]]
        ];

        private _display = ctrlParent _ctrl;
        private _ctrlListCars = _display displayCtrl IDC_DISPLAYVVS_LISTCARS;
        private _ctrlListAir = _display displayCtrl IDC_DISPLAYVVS_LISTAIR;
        private _ctrlListTank = _display displayCtrl IDC_DISPLAYVVS_LISTTANK;

        private _listBoxes = [_ctrlListCars, _ctrlListAir, _ctrlListTank];

        {

            if (_listBoxes select _index == _x) then {
                _x ctrlShow true
            } else {
                _x ctrlShow false
            };
        } forEach _listBoxes;

    };

    case "onButtonSpawnClick": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlToolBox = _display displayCtrl IDC_DISPLAYVVS_TOOLBOX;
        private _ctrlListCars = _display displayCtrl IDC_DISPLAYVVS_LISTCARS;
        private _ctrlListAir = _display displayCtrl IDC_DISPLAYVVS_LISTAIR;
        private _ctrlListTank = _display displayCtrl IDC_DISPLAYVVS_LISTTANK;
        
        private _index = lbCurSel _ctrlToolBox;

        switch _index do {
            case 0: {
                private _vehicle = _ctrlListCars lbData (lbCurSel _ctrlListCars);
                [_vehicle] call CQC_fnc_createVehicleCar;
            };

            case 1: {
                private _vehicle = _ctrlListAir lbData (lbCurSel _ctrlListAir);
                [_vehicle] call CQC_fnc_createVehicleAir;
            };

            case 2: {
                private _vehicle = _ctrlListTank lbData (lbCurSel _ctrlListTank);
                [_vehicle] call CQC_fnc_createVehicleTank;
            };
        };
        closeDialog 0;
    };

    case "onUnload": {
        
    };
};