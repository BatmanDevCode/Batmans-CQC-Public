/*
 File: fn_setUnitEarplugs.sqf
 Author: FragS
 Description: Increments earplug value
*/

switch (player getVariable ["CurrentVolume", 90]) do
{
  case 0: {0 fadeSound 1; player setVariable ["CurrentVolume", 90]; ["", "Earplugs Taken Out", "info"] call CQC_fnc_notificationSystem;};
  case 10: {0 fadeSound 0.9; player setVariable ["CurrentVolume", 0]; ["", "Earplugs 10%", "info"] call CQC_fnc_notificationSystem;};
  case 20: {0 fadeSound 0.8; player setVariable ["CurrentVolume", 10]; ["", "Earplugs 20%", "info"] call CQC_fnc_notificationSystem;}; 
  case 30: {0 fadeSound 0.7; player setVariable ["CurrentVolume", 20]; ["", "Earplugs 30%", "info"] call CQC_fnc_notificationSystem;}; 
  case 40: {0 fadeSound 0.6; player setVariable ["CurrentVolume", 30]; ["", "Earplugs 40%", "info"] call CQC_fnc_notificationSystem;}; 
  case 50: {0 fadeSound 0.5; player setVariable ["CurrentVolume", 40]; ["", "Earplugs 50%", "info"] call CQC_fnc_notificationSystem;}; 
  case 60: {0 fadeSound 0.4; player setVariable ["CurrentVolume", 50]; ["", "Earplugs 60%", "info"] call CQC_fnc_notificationSystem;}; 
  case 70: {0 fadeSound 0.3; player setVariable ["CurrentVolume", 60]; ["", "Earplugs 70%", "info"] call CQC_fnc_notificationSystem;}; 
  case 80: {0 fadeSound 0.2; player setVariable ["CurrentVolume", 70]; ["", "Earplugs 80%", "info"] call CQC_fnc_notificationSystem;}; 
  case 90: {0 fadeSound 0.1; player setVariable ["CurrentVolume", 80]; ["", "Earplugs 90%", "info"] call CQC_fnc_notificationSystem;}; 
};