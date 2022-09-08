[
    4, // seconds to delete dead bodies (0 means don't delete) 
    60, // seconds to delete dead vehicles (0 means don't delete)
    120, // seconds to delete immobile vehicles (0 means don't delete)
    1, // seconds to delete dropped weapons (0 means don't delete)
    1, // seconds to deleted planted explosives (0 means don't delete)
    120 // seconds to delete dropped smokes/chemlights (0 means don't delete)
] execVM 'Functions\World\repetitive_cleanup.sqf';