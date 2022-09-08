#include "dik_macros.hpp"

#define MISSION_ROOT  	(str missionConfigFile select [0, count str missionConfigFile - 15])
////////////////////////////////////////////////////////
// Config Macros
////////////////////////////////////////////////////////
#define CFG_ADMIN_RANKS           missionConfigFile >> "CfgAdmin" >> "Admins" >> "steamids"
#define CFG_SPAWNS_REGULAR        missionConfigFile >> "CfgSpawns" >> "Spawns" >> "Regular"
#define CFG_SPAWNS_AIRTANK        missionConfigFile >> "CfgSpawns" >> "Spawns" >> "AirTank"
#define CFG_GEAR_RESTRICTIONS     missionConfigFile >> "CfgGear" >> "Gear" >> "Restrictions"
#define CFG_GEAR_LOADOUTS         missionConfigFile >> "CfgGear" >> "Gear" >> "Loadouts"
#define CFG_VEHICLE_ATTRIBUTES    missionConfigFile >> "CfgVehicles" >> "Vehicles"
#define CFG_VEHICLE_TEMPLATES     missionConfigFile >> "CfgVehicles" >> "Templates"
#define CFG_VEHICLE_LISTS         missionConfigFile >> "CfgVehicles" >> "MenuClasses"

////////////////////////////////////////////////////////
// PublicVariable Macros
////////////////////////////////////////////////////////
#define PVAR_CLIENT     0
#define PVAR_SERVER_HC  1
#define PVAR            2

////////////////////////////////////////////////////////
// HeadlessClient Macros
////////////////////////////////////////////////////////
#define ALLPLAYERSNOHC allPlayers - entities "HeadlessClient_F"
#define HEADLESSCLIENT CQC_HC1
#define STR_HC         "CQC_HC1"
#define IS_HC          !isDedicated && {!isServer} && {!hasInterface}

////////////////////////////////////////////////////////
// DisplayAdmin Macros
////////////////////////////////////////////////////////
#define ICON_BACKGROUND					"A3\Ui_f\data\IGUI\Cfg\simpleTasks\background1_ca.paa"
#define ICON_DEAD						"a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa"
#define ICON_GROUP						"a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\GroupIcon_ca.paa"
#define ICON_UNIT						"a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\UnitIcon_ca.paa"
#define ICON_REVIVE						"a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\ReviveIcon_ca.paa"
#define ICON_BACKGROUND_UNIT			"a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\UnitName_ca.paa"
#define ICON_CAMERA						"a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\cameraTexture_ca.paa"
#define CAM_ICON_FREE					"a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\FreeSelected.paa"
#define CAM_ICON_FREE_SELECTED			"a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\Free.paa"
#define CAM_ICON_FOLLOW					"a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\FollowSelected.paa"
#define CAM_ICON_FOLLOW_SELECTED		"a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\Follow.paa"
#define CAM_ICON_FPS					"a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\FpsSelected.paa"
#define CAM_ICON_FPS_SELECTED			"a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\Fps.paa"