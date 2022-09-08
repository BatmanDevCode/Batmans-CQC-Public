/*
 File: fn_evalStatement.sqf
 Author: FragS
 Description: Evaluates given code and returns bool.
*/

params [["_statement", "", [""]]];

if (_statement isEqualTo "") exitWith {true};

private _evaluation = call compile _statement;
if !(_evaluation isEqualType true) exitWith {false};

_evaluation;