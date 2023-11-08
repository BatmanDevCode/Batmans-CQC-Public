class CQC_displaySlider {
	idd = IDD_DISPLAYSLIDER_DISPLAY;
	movingEnable = true;
	scriptName = "CQC_displaySlider";
	scriptPath = "GUI";
    onLoad = "";
	onUnload = "";

	class controlsBackground {};	   
	class Controls {
		
        class MainBackground: CQC_ctrlStatic {
            idc               = -1;
            x                 = safezoneX;
            y                 = safezoneY;
            w                 = safezoneW;
            h                 = safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };

		class SliderGroup: CQC_ctrlControlsGroupNoScrollbars {
            idc = IDC_SLIDER_GROUP;
            x   = safezoneX + safezoneW - ((HUD_W + SIZE_S) * GRID_W);
            y   = safezoneY + (safezoneH - (HUD_H + SIZE_S) * GRID_H);
            w   = HUD_W * GRID_W;
            h   = HUD_H * GRID_H;
            class controls {
                
			};
		};
	};
}; 