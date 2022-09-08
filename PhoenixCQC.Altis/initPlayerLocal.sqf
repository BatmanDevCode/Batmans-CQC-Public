/*
 File: initPlayerLocal.sqf
 Author:
 Description: Run locally on the client when loading into the mission.
*/

// Random Shit
setGroupIconsVisible [false,false];
player enableFatigue false;
disableSerialization;
enableEnvironment false;
player disableConversation true;
enableSentences false;
enableRadio false;
enableSaving [false, false];
0 fadeRadio 0;
setTerrainGrid 50;
0 setFog 0;
player setUnitTrait ["Medic",true];
player setCustomAimCoef 0.0;
player switchCamera "EXTERNAL";

[] call CQC_fnc_initPlayer;