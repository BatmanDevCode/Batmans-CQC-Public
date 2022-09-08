/*
 File: fn_startProgress.sqf
 Author: FragS
 Description: Starts a progress bar. (Must be run in scheduled environment)
*/

params [
    ["_actionText", "Working",[""] ],
    ["_forceCrouch", false,[false] ],
    ["_code", {}, [{}]],
    ["_args", [], [[]]],
    ["_time", 5, [5]]
];

// Animation selected based on player weapon and stance
_stanceList = ["STAND", "CROUCH", "PRONE"];
_animStance = ["erc", "knl", "pne"];
_animRaised = ["non", "ras"];
_animWeapon = ["non", "rfl", "lnr", "pst"];
_weaponStates = ["", primaryWeapon player, secondaryWeapon player, handgunWeapon player];

if (_forcecrouch && (stance player == "STAND")) then {
    player playAction "PlayerCrouch";
};

sleep 0.07;

_stance = stance player;

_anim1 = format ["AinvP%1MstpS%2W%3Dnon", 
    _animStance select (_stanceList find _stance), 
    _animRaised select (currentWeapon player != ""), 
    _animWeapon select (_weaponStates find currentWeapon player)
];

_anim2 = format ["AinvP%1MstpS%2W%3Dnon_AmovP%1MstpS%2W%3Dnon", 
    _animStance select (_stanceList find _stance), 
    _animRaised select (currentWeapon player != ""), 
    _animWeapon select (_weaponStates find currentWeapon player)
];

// Block Input
createDialog "CQC_displayEmpty";

// Set vars for display
CQC_displayProgress_startTime = diag_tickTime;
CQC_displayProgress_runTime = _time;
CQC_displayProgress_actionText = _actionText;
CQC_displayProgress_exitAnim = _anim2;
CQC_displayProgress_codeComplete = _code;
CQC_displayProgress_codeArguments = _args;
CQC_displayProgress_canProgress = true;

// Create progress display
"CQC_progressLayer" cutRsc ["CQC_displayProgress","PLAIN"];

// Play main anim
player playMoveNow _anim1;