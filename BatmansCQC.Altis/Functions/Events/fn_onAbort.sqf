disableSerialization;
player allowDamage false;
disableUserInput true;
showChat false;
[false] call CQC_fnc_showHUD;
1 fadeSound 0;
1 fadeSpeech 0;
private _outroCam = "camera" camCreate (player modelToWorldVisual [-5,0,1.85]);
_outroCam cameraEffect ["internal","back"];
_outroCam camSetFov 2.000;
_outroCam camSetTarget vehicle player;
_outroCam camSetRelPos [0,-1,1.85];
_outroCam camCommit 0;
waitUntil {camCommitted _outroCam};
_outroCam camSetFov 2;
_outroCam camSetRelPos [0,-5,1.85];
_outroCam camCommit 1;
8 cutFadeOut 3;
waitUntil {camCommitted _outroCam};
_outroCam camSetFov 9;
_outroCam camSetRelPos [0,-5,1050.85];
_outroCam camCommit 3;
waitUntil {camCommitted _outroCam};
cutText ["","BLACK",1];
sleep 1;
4 cutRsc ["SplashNoise","BLACK"];
sleep 0.25;

[
    format[
    "<t size='1.3' color='#00C10D'>Thanks For Playing!</t><br/>See You Soon %1 ! <br/><t size='1.1'>Discord.gg/NZB6Dj5</t>", name player],
    0,
    0.2,
    10,
    0,
    0,
    8
] spawn BIS_fnc_dynamicText;

sleep 6;
showChat true;
disableUserInput false;
["",0,0.2,10,0,0,8] spawn BIS_fnc_dynamicText;
endMission "CQC_End";
_outroCam cameraEffect ["terminate","back"];
camDestroy _outroCam;