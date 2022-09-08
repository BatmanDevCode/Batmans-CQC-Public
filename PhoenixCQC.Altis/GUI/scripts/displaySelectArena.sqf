#include "script_component.hpp"
/*
 File: displaySelectArena.sqf
 Author: FragS
 Description: Handles arena selection display
*/

#define SELF                    CQC_displaySelectArena_script
#define VAR_EACHFRAME_HANDLE    CQC_displaySelectArena_onEachFrame

disableSerialization;

params [
    ["_event", "", [""]],
    ["_args", [], [[]]]
];

switch _event do {
    case "onLoad": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlToolBox = _display displayCtrl IDC_DISPLAYARENAS_TOOLBOX;
        private _ctrlsGroupRegular = _display displayCtrl IDC_DISPLAYNARENAS_GROUP_REGULAR;
        private _ctrlsGroupAirTank = _display displayCtrl IDC_DISPLAYNARENAS_GROUP_AIRTANK;
        private _ctrlListLocationsFilter = _display displayCtrl IDC_DISPLAYARENAS_LOCATIONSFILTER;
        private _ctrlListLocations = _display displayCtrl IDC_DISPLAYARENAS_LOCATIONSLIST;
        private _ctrlButtonSpawn = _display displayCtrl IDC_DISPLAYARENAS_BUTTONSPAWN;
        private _ctrlNoteStatus = _display displayCtrl IDC_DISPLAYARENAS_NOTESTATUS;

        _ctrlToolBox ctrlEnable false;

        // ListNBox sorting 
        [_ctrlListLocationsFilter, _ctrlListLocations] call BIS_fnc_initListNBoxSorting;

        // Clear and populate main list
        private _locations = (CFG_SPAWNS_REGULAR) call BIS_fnc_getCfgSubClasses;

        lnbClear _ctrlListLocations;
        
        private _playerLimit = [];

        {
            private _configClass = CFG_SPAWNS_REGULAR >> _x;
            private _displayName = getText (_configClass >> "name");
            private _maxPlayers = getNumber (_configClass >> "maxPlayers");
            private _vehicleClass = getText (_configClass >> "vehicles");
            private _weaponText = getText (_configClass >> "weapons");
            private _vehicleText = getText (CFG_VEHICLE_LISTS >> _vehicleClass >> "displayName");
            _playerLimit pushBack _maxPlayers;
            private _icon = getText (_configClass >> "icon");

                
            private _index = _ctrlListLocations lnbAddRow [
                _displayName,
                _vehicleText,
                _weaponText,
                ""
            ];

            _ctrlListLocations lnbSetData [[_index, 0], _x]; 
            _ctrlListLocations lnbSetPicture [[_index, 0], _icon];    
        } forEach _locations;

        // Event Handlers
        VAR_EACHFRAME_HANDLE = addMissionEventHandler ["EachFrame", {["onEachFrame", _thisArgs] call SELF;}, [_ctrlListLocations, _playerLimit, _locations]];

        _ctrlButtonSpawn ctrlAddEventHandler ["ButtonClick", {
            ["onButtonSpawnClick", [ctrlParent (_this select 0)]] call SELF;
        }];

        _ctrlToolBox ctrlAddEventHandler ["ToolBoxSelChanged", {
            ["onToolBoxSelChanged", [ctrlParent (_this select 0)]] call SELF;
        }];

        _ctrlListLocations ctrlAddEventHandler ["LBSelChanged", {
            ["onListNBoxSelChanged", [ctrlParent (_this select 0)]] call SELF;
        }];

        _ctrlListLocations ctrlAddEventHandler ["LBDblClick", {
            ["onListNBoxDblClick", [ctrlParent (_this select 0)]] call SELF;
        }];
    };

    case "onListNBoxDblClick": {
        _args params [["_display", displayNull, [displayNull]]];
        _ctrlButtonSpawn = _display displayCtrl IDC_DISPLAYARENAS_BUTTONSPAWN;

        if (ctrlEnabled _ctrlButtonSpawn) then {["onButtonSpawnClick", [_display]] call SELF};
    };

    case "onButtonSpawnClick": {
        _args params [["_display", displayNull, [displayNull]]];
        
        private _ctrlListLocations = _display displayCtrl IDC_DISPLAYARENAS_LOCATIONSLIST;


        private _arenaClass = _ctrlListLocations lnbData [lnbCurSelRow _ctrlListLocations, 0];
        private _configClass = CFG_SPAWNS_REGULAR >> _arenaClass;
        private _marker = getText (_configClass >> "spawnMarker");
        private _markers = getArray (_configClass >> "markers");
        private _maxPlayers = getNumber (_configClass >> "maxPlayers");
        private _spawnDistance = getNumber (_configClass >> "spawnDistance");
        private _forceLoadout = getText (_configClass >> "forceLoadout");
        private _spawnProtection = getNumber (_configClass >> "spawnProtection");
        private _currentPlayers = count (allUnits inAreaArray _marker);
            
        if !(_currentPlayers >= _maxPlayers) then 
        {
            private _markerNo = count _markers;

            for "_i" from 0 to _markerNo do 
            {

                private _marker = _markers select _i;
                private _check = getMarkerpos _marker nearEntities [["Man", "Car"], _spawnDistance];

                if (_check isEqualTo []) exitWith
                {
                    closeDialog 0;
                    if (missionNamespace getVariable ["CQC_player_currentArena", ""] == "AirTank") then {
                        terminate CQC_thread_activeProjectiles;
                        CQC_thread_activeProjectiles = scriptNull;
                    };
                    missionNamespace setVariable ["CQC_player_currentArena", _arenaClass];
                    [_marker, _spawnProtection, _forceLoadout] call CQC_fnc_moveUnitToArena;
                };

                if (_i >= _markerNo) exitWith
                {
                    ["Error","All spawn points are currently blocked, try again", "error", 5] call CQC_fnc_notificationSystem;
                };

            };
                
        } else {
            ["Error","The arena is currently full, try again", "error", 5] call CQC_fnc_notificationSystem;
        };
    };

    case "onEachFrame": {
        _args params [
            ["_ctrlListLocations", controlNull, [controlNull]],
            ["_playerLimit", [], [[]]],
            ["_locations", [], [[]]]
        ];

        if (ctrlShown _ctrlListLocations) then 
        {
            {
                private _arenaClass = _ctrlListLocations lnbData [_forEachIndex, 0];
                private _configClass = CFG_SPAWNS_REGULAR >> _arenaClass;
                private _marker = getText (_configClass >> "spawnMarker");
                private _playersInArea = allUnits inAreaArray _marker;
                private _maxPlayersInArea = getNumber (_configClass >> "maxPlayers");
                private _currentPlayersText = format ["%1/%2", count _playersInArea, _maxPlayersInArea];
                _ctrlListLocations lnbSetText [[_forEachIndex, 3], _currentPlayersText];
            } forEach _locations;
        };
    };
    
    case "onToolBoxSelChanged": {
        _args params [["_display", displayNull, [displayNull]]];
        
        private _ctrlToolBox = _display displayCtrl IDC_DISPLAYARENAS_TOOLBOX;
        private _ctrlsGroupRegular = _display displayCtrl IDC_DISPLAYNARENAS_GROUP_REGULAR;
        private _ctrlsGroupAirTank = _display displayCtrl IDC_DISPLAYNARENAS_GROUP_AIRTANK;
        private _ctrlNoteStatus = _display displayCtrl IDC_DISPLAYARENAS_NOTESTATUS;

        private _index = lbCurSel _ctrlToolBox;

        if (_index == 0) then 
        {
            _ctrlsGroupRegular ctrlShow true;
            _ctrlsGroupAirTank ctrlShow false;
            ["onLNBSelChanged", _display] call SELF;
        } 
        else 
        {
            _ctrlsGroupRegular ctrlShow false;
            _ctrlsGroupAirTank ctrlShow true;
            ["onLBSelChanged", _display] call SELF;
        };
    };

    case "onListNBoxSelChanged": {
        _args params [["_display", displayNull, [displayNull]]];

        private _ctrlListLocations = _display displayCtrl IDC_DISPLAYARENAS_LOCATIONSLIST;
        private _ctrlButtonSpawn = _display displayCtrl IDC_DISPLAYARENAS_BUTTONSPAWN;
        private _ctrlNoteStatus = _display displayCtrl IDC_DISPLAYARENAS_NOTESTATUS;

        private _arenaClass = _ctrlListLocations lnbData [lnbCurSelRow _ctrlListLocations, 0];
        private _configClass = CFG_SPAWNS_REGULAR >> _arenaClass;
        private _restriction = getText (_configClass >> "weapons");

        private _condition = [(getText (_configClass >> "condition"))] call CQC_fnc_evalStatement;
        private _weaponCheck = [format ["!(primaryWeapon player in (getArray (missionConfigFile >> 'CfgGear' >> 'Gear' >> 'Restrictions' >> '%1' >> 'weapons')))", _restriction]] call CQC_fnc_evalStatement;
        private _magazineCheck = true;
        if (count (primaryWeaponMagazine player) > 0) then {
            _magazineCheck = [format ["!((primaryWeaponMagazine player) select 1 in (getArray (missionConfigFile >> 'CfgGear' >> 'Gear' >> 'Restrictions' >> '%1' >> 'magazines'))) ", _restriction]] call CQC_fnc_evalStatement;
        };
        private _mags = (magazines player) arrayIntersect (getArray (CFG_GEAR_RESTRICTIONS >> _restriction >> "magazines"));
        private _uniformCheck = false;

        if (count _mags > 0) then {
            _uniformCheck = true;
        };

        switch (true) do {
            case !(_condition): {
                _ctrlNoteStatus ctrlSetBackgroundColor [COLOR_NOTE_ERROR_RGBA];
                _ctrlNoteStatus ctrlSetText "Conditions not met";
                _ctrlButtonSpawn ctrlEnable false;
            };

            case !(_weaponCheck): {
                _ctrlNoteStatus ctrlSetBackgroundColor [COLOR_NOTE_ERROR_RGBA];
                _ctrlNoteStatus ctrlSetText format ["%2 is not allowed at %1", getText (_configClass >> "name"), getText (configFile >> "CfgWeapons" >> (primaryWeapon player) >> "displayName")];
                _ctrlButtonSpawn ctrlEnable false;
            };
                   
            case !(_magazineCheck): {
                _ctrlNoteStatus ctrlSetBackgroundColor [COLOR_NOTE_ERROR_RGBA];
                _ctrlNoteStatus ctrlSetText format ["%2 is not allowed at %1", getText (_configClass >> "name"), getText (configFile >> "CfgMagazines" >> (primaryWeaponMagazine player) select 1 >> "displayName")];
                _ctrlButtonSpawn ctrlEnable false;
            };

            case _uniformCheck: {
                _ctrlNoteStatus ctrlSetBackgroundColor [COLOR_NOTE_ERROR_RGBA];
                 _ctrlNoteStatus ctrlSetText format ["%2 is not allowed at %1", getText (_configClass >> "name"), getText (configFile >> "CfgMagazines" >> (_mags select 0) >> "displayName")];
                _ctrlButtonSpawn ctrlEnable false;
            };
                    
            default {
                _ctrlNoteStatus ctrlSetBackgroundColor [COLOR_NOTE_DEFAULT_RGBA];
                _ctrlNoteStatus ctrlSetText format ["Ready to spawn at %1", getText (_configClass >> "name")];
                _ctrlButtonSpawn ctrlEnable true;
            };
        };
    };

    case "onUnload": {
        removeMissionEventHandler ["EachFrame", VAR_EACHFRAME_HANDLE];
        VAR_EACHFRAME_HANDLE = nil;
    };
};