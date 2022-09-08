/*
 File: fn_notificationSystem.sqf
 Author: Aquaman, FragS, Batman
 Description: handles notifications
*/

#define GRID_H (pixelH * pixelGrid * 0.50)
#define TEXT_SIZE_TITLE (155 * GRID_H)
#define TEXT_SIZE_CONTENT (110 * GRID_H)
#define TEXT_COLOUR_CONTENT ([0.875, 0.875, 0.875, 1] call BIS_fnc_colorRGBAtoHTML)

params [
    ["_titletext", "",[""] ],
    ["_text", "",[""] ],
    ["_notiftype", "success", ["",[],{}]],
    ["_speed", 5, [5]]
];

if (isDedicated || !hasInterface) exitWith {};
if(isNil "current_notifications") then {
    current_notifications = [];
};

disableSerialization;
_display = findDisplay 46;
_TitleColour = "";
_alpha = 1;

//You can add more case statements for different things. Info is the default value
//This is used to get the colour of the notification
switch (_notiftype) do
{
    case "light_blue": {
        _TitleColour = [0.165,0.647,0.824,_alpha]; //Light Blue
    };

    case "dark_blue": {
        _TitleColour = [0.047,0.2,0.459,_alpha]; //Dark Blue
    };

    case "purple": {
        _TitleColour = [0.396,0.102,0.506,_alpha]; //Purple
    };

    case "pink": {
        _TitleColour = [0.733,0.118,0.757,_alpha]; //Pink
    };

    case "error": {
        _TitleColour = [0.63, 0.04, 0,_alpha]; //Red
    };

    case "warning": {
        _TitleColour = [1,0.7,0,_alpha]; //Amber
    };

    case "sucess": {
        _TitleColour = [0.06, 0.68, 0,_alpha]; //Green
    };

    case "announcement": {
        _TitleColour = [0.9,0.9,0.9,_alpha]; //White
    };

    default {
        _TitleColour = [0.06, 0.68, 0,_alpha]; //Green (Default)
    };
};


playSound "FD_Timer_F";


private _Title = _display ctrlCreate ["RscText", -1];
//Creating Title Control and Setting the Position, Width and Height.

//[0.8035 * safezoneW + safezoneX, 0.2 * safezoneH + safezoneY, 0.0015 * safezoneW, 0.015* safezoneH];

_Title ctrlSetPosition [0.863 * safezoneW + safezoneX, 0.2 * safezoneH + safezoneY, 0.002 * safezoneW, 0.015* safezoneH];
_Title ctrlSetBackgroundColor _TitleColour;
_Title ctrlSetFade 1;
_Title ctrlCommit 0; //ctrlCommit Updates the Changes i made above
_Title ctrlSetFade 0;
_Title ctrlCommit 0.4;

private _Message = _display ctrlCreate ["RscStructuredText", -1];
//Creating Message Control And Setting Text, Height and width.
if (_titletext == "") then 
{
    _Message ctrlSetStructuredText parseText format ["<t size='%4' shadow='0' valign='middle' align='left' color='%5' font='RobotoCondensed'>%2</t>", _titletext, _text, TEXT_SIZE_TITLE, TEXT_SIZE_CONTENT, TEXT_COLOUR_CONTENT];
}
else 
{
    _Message ctrlSetStructuredText parseText format ["<t font='RobotoCondensed' shadow='0' valign='middle' align='left' size='%3'>%1</t><br/><t size='%4' shadow='0' valign='middle' align='left' color='%5' font='RobotoCondensed'>%2</t>", _titletext, _text, TEXT_SIZE_TITLE, TEXT_SIZE_CONTENT, TEXT_COLOUR_CONTENT];
};
_Message ctrlSetPosition [0.865 * safezoneW + safezoneX, 0.15 * safezoneH + safezoneY, 0.120 * safezoneW,  0.015* safezoneH];
_Message ctrlCommit 0;
_Message ctrlSetPosition [0.865 * safezoneW + safezoneX, 0.15 * safezoneH + safezoneY, 0.120 * safezoneW, ((ctrlTextHeight _Message)+ (0.005 * safezoneH))];
_Message ctrlCommit 0;

//Setting Background Colour and Fade
_Message ctrlSetBackgroundColor [0,0,0,0.79];
_Message ctrlSetFade 1;
_Message ctrlCommit 0;
_Message ctrlSetFade 0;
_Message ctrlCommit 0.4;

//Updating Title Height to Match The Text Height
_Title ctrlSetPosition [0.863 * safezoneW + safezoneX, 0.15 * safezoneH + safezoneY, 0.002 * safezoneW, ((ctrlTextHeight _Message)+ (0.005 * safezoneH))];
_Title ctrlCommit 0;


//Visualising/Creating The Notification so player can see it on screen.
[_Message, _Title, _speed] spawn {
    disableSerialization;
    uiSleep (_this select 2); //How long the notification lasts for.
    private _Message = _this select 0;
    private _Title = _this select 1;
    _Message ctrlSetFade 1;
    _Message ctrlCommit 0.3;
    _Title ctrlSetFade 1;
    _Title ctrlCommit 0.3;
    uiSleep 0.35;
    ctrlDelete _Message;
    ctrlDelete _Title;
};

//Finding Position of Title and Text
private _posMessage = (ctrlPosition (_Message)) select 1;
private _posTitle = (ctrlPosition (_Title)) select 1;
private _messageHigh = (ctrlPosition (_Message)) select 3;

//Check if more than one notification is active.
//Ill be honest i didn't know how to do this at all so thanks to TaKonde and Lucian.
if (count current_notifications >= 1) then 
{
    private _activeNotifications = 0;
    {
        private _TitleCtrl = _x select 0;
        private _MessageCtrl = _x select 1;
        if (!isNull _TitleCtrl && !isNull _MessageCtrl) then
        {
            //Updating Position of Current Notification to be lower
            _TitleCtrl ctrlSetPosition [0.863 * safezoneW + safezoneX, (_posTitle + _messageHigh + 1.5 * (0.011 * safezoneH))];
            _MessageCtrl ctrlSetPosition [0.865 * safezoneW + safezoneX, (_posMessage + _messageHigh + 1.5 * (0.011 * safezoneH))];
            _TitleCtrl ctrlCommit 0.3;
            _MessageCtrl ctrlCommit 0.3;

            //Updating Position Variables
            _posMessage = (_posMessage + _messageHigh + 1.5 * (0.011 * safezoneH));
            _posTitle = (_posTitle + _messageHigh + 1.5 * (0.011 * safezoneH));
            _messageHigh = (ctrlPosition (_MessageCtrl)) select 3;
            if (_activeNotifications > 3) then
            {
                _TitleCtrl ctrlSetFade 1;
                _MessageCtrl ctrlSetFade 1;
                _TitleCtrl ctrlCommit 0.25;
                _MessageCtrl ctrlCommit 0.25;
            };
        };
            _activeNotifications = _activeNotifications + 1;
    } forEach current_notifications;
};

current_notifications = ([[_Title, _Message]] + current_notifications) select {!isNull (_x select 0) && !isNull (_x select 1)};