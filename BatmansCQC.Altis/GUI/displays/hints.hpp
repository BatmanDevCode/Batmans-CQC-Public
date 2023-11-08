class CQC_hints {
	idd = IDD_HINTS_DISPLAY; 
	duration = 10e10; 
	fadeIn = 1; 
	fadeOut = 1;
    scriptName = "CQC_hints";
    scriptPath = "GUI";
	onLoad = "['CQC_hints', _this select 0] call CQC_fnc_initDisplay;";

	class controlsBackground {};	   
	class Controls {};
}; 