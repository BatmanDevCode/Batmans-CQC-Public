class CQC_killfeed {
	idd = IDD_KILLFEED_DISPLAY; 
	duration = 10e10; 
	fadeIn = 1; 
	fadeOut = 1;
    scriptName = "CQC_killfeed";
    scriptPath = "GUI";
	onLoad = "['CQC_killfeed', _this select 0] call CQC_fnc_initDisplay;";

	class controlsBackground {};	   
	class Controls {};
}; 