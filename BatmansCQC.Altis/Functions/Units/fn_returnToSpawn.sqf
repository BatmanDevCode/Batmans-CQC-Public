
["Warning", "Returning to spawn in 3 seconds...", "warning", 1] call CQC_fnc_notificationSystem;
sleep 1;
["Warning", "Returning to spawn in 2 seconds...", "warning", 1] call CQC_fnc_notificationSystem;
sleep 1;
["Warning", "Returning to spawn in 1 seconds...", "warning", 1] call CQC_fnc_notificationSystem;
sleep 1;
                    
if !(["getin", format ["%1", animationState player]] call BIS_fnc_inString) then
{
    player setPos (getMarkerPos "respawn");

    [true] call CQC_fnc_setUnitSpawnProtection;
    player setVariable ["inSpawn", true, true];


    if !(missionNamespace getVariable ["CQC_player_currentArena", ""] == "AirTank") then {
        terminate CQC_thread_activeProjectiles;
        CQC_thread_activeProjectiles = scriptNull;
    };

    setViewDistance 350;

    missionNamespace setVariable ["CQC_player_currentArena", nil];
};