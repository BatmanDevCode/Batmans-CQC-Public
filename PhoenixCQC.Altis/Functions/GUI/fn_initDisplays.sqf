/*
 File: fn_initDisplays.sqf
 Author:
 Description:
*/

private _missionDisplays = [];

{
    {
		if (getNumber (_x >> "scriptIsInternal") isEqualTo 0) then 
		{ 
			private _scriptName = getText (_x >> "scriptName");
			private _scriptPath = getText (_x >> "scriptPath");
				
			if (_scriptName isEqualTo "" || _scriptPath isEqualTo "") exitWith {};
				
			private _script = _scriptName + "_script";
				
			if (missionNamespace getVariable [_script, 0] isEqualType {}) exitWith {};
				
			missionNamespace setVariable 
			[
				_script,
				compileScript [
					format ["%1%2.sqf", getText (missionConfigFile >> "CfgScriptPaths" >> _scriptPath), [_scriptName, 4] call BIS_fnc_trimString],
					true
				]
			];

			_missionDisplays pushBack _scriptName;
		};
	} 
	forEach (configProperties [_x, "isClass _x && {isText (_x >> 'scriptPath')} && {isText (_x >> 'scriptName')}"]);
} 
forEach
[
	missionConfigFile,
    missionConfigFile >> "RscTitles"
];

[missionNamespace, "CQC_missionDisplays",  _missionDisplays, false] call CQC_fnc_setConstant;