/*
 File: fn_waitIntervalAndExecute.sqf
 Author: FragS
 Description: Executes given amount of times with given time delay between each execution. Excecutes in unscheduled environment.
*/

params [
    ["_code", {}, [{}]], 
    ["_args", [], [[]]], 
    ["_delay", 0, [0]],
    ["_repeat", 0, [0]]
];

CQC_events_waitIntervalAndExecArray pushBack [diag_tickTime + _delay, _delay, _repeat, _code, _args];
CQC_events_waitIntervalAndExecArray sort true;