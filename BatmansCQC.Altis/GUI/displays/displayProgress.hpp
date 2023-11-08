class CQC_displayProgress {
	idd = IDD_DISPLAYPROGRESS_DISPLAY;
    duration = 10e10; 
	fadeIn = 1; 
	fadeOut = 1;
	scriptName = "CQC_displayProgress";
	scriptPath = "GUI";
    onLoad = "['CQC_displayProgress', _this select 0] call CQC_fnc_initDisplay;";
	

	class Controls {
        #define STATIC_W 100
		#define STATIC_H 70
        #define STATIC_BORDER 1
        #define CONTENT_W 68
		#define CONTENT_H 78
		#define CONTENT_BORDER 1
        
        class ProgressGroup: CQC_ctrlControlsGroupNoScrollbars {
            idc = IDC_DISPLAYPROGRESS_GROUP;
            x = CENTER_X - (STATIC_W * 0.5) * GRID_W;
            y = 0.9 * safezoneH + safezoneY;
            w = STATIC_W * GRID_W;
            h = SIZE_M * GRID_H;
            class Controls {
                class StatusLeft: CQC_ctrlStatic
				{
                    idc = -1;
                    x = 0;
                    y = 0;
                    w = SIZE_M * 2 * GRID_W;
                    h = SIZE_M * GRID_H;
                    style = ST_CENTER;
                    colorBackground[] = {0.2, 0.2, 0.2, 0.8};
                };

                class StatusLeftIcon: CQC_ctrlStaticPictureKeepAspect
				{
                    idc = IDC_DISPLAYPROGRESS_PICTURESTATUSICON;
                    x = SIZE_M / 2 * GRID_W;
                    y = 0;
                    w = SIZE_M * GRID_W;
                    h = SIZE_M * GRID_H;
                    style = ST_CENTER + 48;
                };
                
				class PercentageRight: CQC_ctrlStatic 
				{
                    idc = IDC_DISPLAYPROGRESS_STATICPERCENTAGE;
                    x = (STATIC_W * GRID_W) - (SIZE_M * 2 * GRID_W);
                    y = 0;
                    w = SIZE_M * 2 * GRID_W;
                    h = SIZE_M * GRID_H;
                    style = ST_CENTER;
                    font = "RobotoCondensed";
                    colorBackground[] = {0.2, 0.2, 0.2, 0.8};
                };
                
				class ProgressBarBackground: CQC_ctrlStaticBackground
				{
                    idc = -1;
                    x = SIZE_M * 2 * GRID_W;
                    y = 0;
                    w = (STATIC_W * GRID_W) - ((SIZE_M * GRID_W) * 4);
					h = SIZE_M * GRID_H;
                    colorBackground[] = {0.1, 0.1, 0.1, 0.5};
                };

				class ProgressBar: CQC_ctrlProgress 
				{
                    idc = IDC_DISPLAYPROGRESS_PROGRESS;
                    x = SIZE_M * 2 * GRID_W;
                    y = 0;
                    w = (STATIC_W * GRID_W) - ((SIZE_M * GRID_W) * 4);
					h = SIZE_M * GRID_H;
                    //font = FONT_RC_BOLD;
                };

				class ProgressBarText: CQC_ctrlStatic 
				{
                    idc = IDC_DISPLAYPROGRESS_STATICACTION;
                    x = SIZE_M * 2 * GRID_W;
                    y = 0;
					w = (STATIC_W * GRID_W) - ((SIZE_M * GRID_W) * 4);
                    h = SIZE_M * GRID_H;
                    style = ST_CENTER;
					colorBackground[] = {0, 0, 0, 0};
                };
            };
        };
	};
};

