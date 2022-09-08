#include "..\script_component.hpp"
/*
 File: fn_initPlayerTags.sqf
 Author: FragS
 Description: Draws nametags
*/

CQC_handle_drawTags = addMissionEventHandler ["Draw3D", {
    _units = nearestObjects[(visiblePosition player),["Man","Land_TripodScreen_01_dual_v1_black_F","Land_InfoStand_V2_F"],7.5];
    VAR_units = _units - [player];
    {
        if (_x getVariable ["CQC_tags_Init", 0] > 0 && {_x getVariable ["hidden", false] isEqualTo false}) then 
        {
        _pos = [];
        _distance = player distance _x;
        
        if (
        !lineIntersects [
            AGLtoASL positionCameraToWorld [0, 0, 0],
            AGLtoASL (_x modelToWorld [0, 0, 0.5]),
            vehicle player,
            _x
        ]
        && {!lineIntersects [
            AGLtoASL positionCameraToWorld [0, 0, 0],
            AGLtoASL (_x modelToWorld (_x selectionPosition "head")),
            vehicle player,
            _x
        ]}) then
        {

        if (_x isKindOf "Man") then 
        {
            _x selectionPosition "head" params ["_selPosX", "_selPosY", "_selPosZ"];
            _pos = _x modelToWorldVisual [0, 0, (((_selPosZ + 1.6) + (_distance / 15)) / 1.5)];
        } else 
        {
            _pos = switch (typeOf _x) do {
            case "Land_TripodScreen_01_dual_v1_black_F": {_x modelToWorldVisual [0, 0, 1.25]};
            case "Land_InfoStand_V2_F": {_x modelToWorldVisual [0, 0, 1]};
            };
        };    

	    _title = _x getVariable "CQC_tags_Title";
        _subtitle = _x getVariable "CQC_tags_Subtitle";

        _titleColour = _x getVariable "CQC_tags_TitleColour";
        _subtitleColour = _x getVariable "CQC_tags_SubtitleColour";

        _icon = _x getVariable 'CQC_tags_Icon';
        _iconPath = MISSION_ROOT + _icon;

            drawIcon3D [
                '',
                _titleColour,
                _pos,
                0,
                0.9,
                0,
                _title,
                0,
                0.035,
                'RobotoCondensed'
            ];

            drawIcon3D [
                '',
                _subtitleColour,
                _pos,
                0,
                2,
                0,
                _subtitle,
                0,
                0.03,
                'RobotoCondensed'
            ];

            drawIcon3D [
                _iconPath,
                [0.9,0.9,0.9,1],
                _pos,
                0.9,
                0.9,
                0,
                '',
                0,
                0.03,
                'RobotoCondensed'
            ];
        };
        };
    } forEach VAR_units;
}];