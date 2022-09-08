/*
 File: fn_waitAndExecute.sqf
 Author: FragS
 Description: Waits until given condition is true and excecutes in unscheduled environment.
*/

params [
    ["_code", {}, [{}]], 
    ["_args", [], [[]]], 
    ["_condition", {}, [{}]]
];

CQC_events_waitUntilAndExecArray pushBack [_condition, _code, _args];