
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


    // Terminate active threads
    terminate CQC_thread_activeProjectiles;
    terminate CQC_thread_spawnProtectionTimer;

    setViewDistance 350;

    missionNamespace setVariable ["CQC_player_currentArena", nil];
};