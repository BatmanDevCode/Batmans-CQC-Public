#define STATIC_W 150
#define STATIC_H 70
#define SIZE_RADIAL 40
#define SIZE_TEXT 8

class CQC_displayInit {
	idd = IDD_DISPLAYINIT_DISPLAY;
	movingEnable = false;
	scriptName = "CQC_displayInit";
	scriptPath = "GUI";
    onLoad = "['CQC_displayInit', _this select 0] call CQC_fnc_initDisplay;";

	class controlsBackground {
        class Background: CQC_ctrlStaticBackground {
            idc = -1;
            x = safeZoneXAbs;
            y = safeZoneY;
            w = safeZoneWAbs;
            h = safeZoneH;
            colorBackground[] = {0, 0, 0, 0.3};
        };
    };
	
    class Controls {
		class Radial: CQC_ctrlStaticPictureKeepAspect {
            idc = IDC_DISPLAYINIT_PICTURERADIAL;
            x = CENTER_X - (SIZE_RADIAL * 0.5) * GRID_W;
            y = CENTER_Y - (SIZE_RADIAL * 0.5) * GRID_H;
            w = SIZE_RADIAL * GRID_W;
            h = SIZE_RADIAL * GRID_H;
            shadow = 0;
            text = "a3\ui_f\data\igui\rsctitles\dirindicator\dir_000_ca.paa"; //text = "A3\Missions_F_Exp\data\Img\lobby\ui_campaign_lobby_background_tablet_radial_left_ca.paa";
        };

        class HudGroup: CQC_ctrlStaticPictureKeepAspect {
            idc = -1;
            onLoad = "_this param [0, controlNull, [controlNull]] ctrlSetText (getMissionPath 'GUI\data\displays\common\gta.paa')";
            x = safezoneX + (SIZE_M * GRID_W);
            y = safezoneY + (safezoneH - (SIZE_RADIAL + SIZE_S) * GRID_H);
            w = (SIZE_RADIAL + SIZE_TEXT) * GRID_W;
            h = (SIZE_RADIAL + SIZE_TEXT) * GRID_H;
        };

        class Text1: CQC_ctrlStatic {
            idc = IDC_DISPLAYINIT_TEXTSTATUS1;
            style = ST_CENTER;
            x = CENTER_X - (STATIC_W * 0.5) * GRID_W;
            y = CENTER_Y + (SIZE_RADIAL * 0.6) * GRID_H;
            w = STATIC_W * GRID_W;
            h = SIZE_TEXT * GRID_H;
            font = FONT_RC_BOLD;
            shadow = 1;
            sizeEx = SIZE_TEXT * GRID_H;
            text = "Waiting";
        };
	};
}; 