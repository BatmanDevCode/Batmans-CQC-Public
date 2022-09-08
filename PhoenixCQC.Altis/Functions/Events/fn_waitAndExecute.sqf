/*
 File: fn_waitAndExecute.sqf
 Author: FragS
 Description: Waits given time and excecutes in unscheduled environment.
*/

params [
    ["_code", {}, [{}]], 
    ["_args", [], [[]]], 
    ["_delay", 0, [0]]
];

CQC_events_waitAndExecArray pushBack [diag_tickTime + _delay, _code, _args];
CQC_events_waitAndExecArray sort true;