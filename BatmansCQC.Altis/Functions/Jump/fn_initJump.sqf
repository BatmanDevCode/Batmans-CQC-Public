if (!hasInterface) exitWith {};

SL_jumpBaseHeight = 1.8;
SL_jumpMaxHeight = 4.0;
SL_jumpBaseSpeed = 0.5;
SL_jumpAnimation = "AovrPercMrunSrasWrflDf";

"SL_fn_jumpOverAnim" addPublicVariableEventHandler {
 (_this select 1) spawn CQC_fnc_doAnim;
};

waituntil {!(isNull (findDisplay 46))};
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call CQC_fnc_jumpOver;"];