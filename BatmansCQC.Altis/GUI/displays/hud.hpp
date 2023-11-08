#define HUD_POS_X (safezoneX + GAP_W)
#define HUD_POS_Y ((safezoneY + safezoneH) - GAP_H)
#define HUD_W 67
#define HUD_H 23
#define HUD_BACKGROUND {0.1, 0.1, 0.1, 0.9}

class CQC_hud {
	idd = IDD_HUD_DISPLAY; 
	duration = 10e10; 
	fadeIn = 1; 
	fadeOut = 1;
    scriptName = "CQC_hud";
	scriptPath = "GUI";
    onLoad = "['CQC_hud', _this select 0] call CQC_fnc_initDisplay;";

	class controlsBackground {};	   
	class Controls {
		
		class HudGroup: CQC_ctrlControlsGroupNoScrollbars {
            idc = IDC_HUD_GROUP;
            x = safezoneX + safezoneW - ((HUD_W + SIZE_S) * GRID_W);
            y = safezoneY + (safezoneH - (HUD_H + SIZE_S) * GRID_H);
            w = HUD_W * GRID_W;
            h = HUD_H * GRID_H;
            class controls {
                /*class HealthText: CQC_ctrlStatic {
                    idc               = IDC_HUD_HP;
                    style             = ST_RIGHT;
                    font              = FONT_RC_NORMAL;
                    text              = "HP";
                    x                 = 0;
                    y                 = (HUD_H - SIZE_M) * GRID_H;
                    w                 = (HUD_W) * GRID_W;
                    h                 = (SIZE_M * GRID_H);
                    colorBackground[] = {0,0,0,0};
                    shadow            = 2;
                };*/
                
                class Time: CQC_ctrlStatic {
                    idc = IDC_HUD_TIME;
                    style = ST_RIGHT;
                    font = FONT_RC_NORMAL;
                    text = "--:--";
                    x = 0;
                    y = (HUD_H - ((SIZE_M * 4) + (SIZE_S * 0.5))) * GRID_H;
                    w = (HUD_W) * GRID_W;
                    h = (SIZE_M * GRID_H);
                    colorBackground[] = {0,0,0,0};
                    shadow = 2;
                };
                
                class KillsText: CQC_ctrlStatic {
                    idc = -1;
                    style = ST_LEFT;
                    font = FONT_RC_NORMAL;
                    text = "Kills";
                    x = 0;
                    y = (HUD_H - ((SIZE_M * 3) + (SIZE_S * 0.5))) * GRID_H;
                    w = (HUD_W) * GRID_W;
                    h = (SIZE_M * GRID_H);
                    colorBackground[] = HUD_BACKGROUND;
                    shadow = 2;
                };
                
                class DeathsText: CQC_ctrlStatic {
                    idc = -1;
                    style = ST_CENTER;
                    font = FONT_RC_NORMAL;
                    text = "Deaths";
                    x = 0;
                    y = (HUD_H - ((SIZE_M * 3) + (SIZE_S * 0.5))) * GRID_H;
                    w = (HUD_W) * GRID_W;
                    h = (SIZE_M * GRID_H);
                    colorBackground[] = {0,0,0,0};
                    shadow = 2;
                };
                
                class KDText: CQC_ctrlStatic {
                    idc = -1;
                    style = ST_RIGHT;
                    font = FONT_RC_NORMAL;
                    text = "K/D";
                    x = 0;
                    y = (HUD_H - ((SIZE_M * 3) + (SIZE_S * 0.5))) * GRID_H;
                    w = (HUD_W) * GRID_W;
                    h = (SIZE_M * GRID_H);
                    colorBackground[] = {0,0,0,0};
                    shadow = 2;
                };
                
                class KillsValue: CQC_ctrlStatic {
                    idc = IDC_HUD_K;
                    style = ST_LEFT;
                    font = FONT_RC_NORMAL;
                    text = "-";
                    x = 0;
                    y = (HUD_H - ((SIZE_M * 2) + (SIZE_S * 0.5))) * GRID_H;
                    w = (HUD_W) * GRID_W;
                    h = (SIZE_M * GRID_H);
                    colorBackground[] = {0.1, 0.1, 0.1, 0.5};
                    shadow = 2;
                };
                
                class DeathsValue: CQC_ctrlStatic {
                    idc = IDC_HUD_D;
                    style = ST_CENTER;
                    font = FONT_RC_NORMAL;
                    text = "-";
                    x = 0;
                    y = (HUD_H - ((SIZE_M * 2) + (SIZE_S * 0.5))) * GRID_H;
                    w = (HUD_W) * GRID_W;
                    h = (SIZE_M * GRID_H);
                    colorBackground[] = {0,0,0,0};
                    shadow = 2;
                };
                
                class KDValue: CQC_ctrlStatic {
                    idc = IDC_HUD_KD;
                    style = ST_RIGHT;
                    font = FONT_RC_NORMAL;
                    text = "-";
                    x = 0;
                    y = (HUD_H - ((SIZE_M * 2) + (SIZE_S * 0.5))) * GRID_H;
                    w = (HUD_W) * GRID_W;
                    h = (SIZE_M * GRID_H);
                    colorBackground[] = {0,0,0,0};
                    shadow = 2;
                };
                
                class HealthProgressBackground: CQC_ctrlStatic {
                    idc = -1;
                    x = 0;
                    y = (HUD_H - SIZE_M) * GRID_H;
                    w = (HUD_W) * GRID_W;
                    h = (SIZE_M * GRID_H);
                    colorBackground[] = {0.1, 0.1, 0.1, 0.5};
                };
                
                class HealthProgress: CQC_ctrlProgress {
                    idc = IDC_HUD_HEALTHBAR;
                    x = 0;
                    y = (HUD_H - SIZE_M) * GRID_H;
                    w = (HUD_W) * GRID_W;
                    h = (SIZE_M * GRID_H);
                    colorBar[] = HUD_BACKGROUND;
                    colorFrame[] = {0, 0, 0, 0};
                };

                class HealthPercentage: CQC_ctrlStatic {
                    idc = IDC_HUD_HEALTHPERCENTAGE;
                    style = ST_CENTER;
                    font = FONT_RC_NORMAL;
                    x = 0;
                    y = (HUD_H - SIZE_M) * GRID_H;
                    w = (HUD_W) * GRID_W;
                    h = (SIZE_M * GRID_H);
                    colorBackground[] = {0,0,0,0};
                    shadow = 2;
                };
			};
		};
	};
}; 