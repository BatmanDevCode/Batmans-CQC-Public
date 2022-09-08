class CQC_displaySettings {
	idd = IDD_DISPLAYSETTINGS_DISPLAY;
	movingEnable = true;
	scriptName = "CQC_displaySettings";
	scriptPath = "GUI";
    onLoad = "";
	onUnload = "";

	#define STATIC_W 190
	#define STATIC_H 180
    #define STATIC_BORDER 1
    #define CONTENT_W 188
	#define CONTENT_H 178
	#define CONTENT_BORDER 1

	class Controls {
        class StaticGroup: CQC_ctrlControlsGroupNoScrollbars {
			idc = -1;
			x = CENTER_X - (STATIC_W /2) * GRID_W;
			y = CENTER_Y - (STATIC_H /2) * GRID_H;
			w = STATIC_W * GRID_W;
			h = STATIC_H * GRID_H;
			class Controls {
				class Background : CQC_ctrlStaticBackground {
					idc = -1;
					x = 0;
					y = ((SIZE_M * 2) + CONTENT_BORDER) * GRID_H ;
					w = STATIC_W * GRID_W;
					h = (STATIC_H - ((SIZE_M * 2) + CONTENT_BORDER)) * GRID_H;
				};
				
				class TabsBackground : CQC_ctrlStaticBackground {
					idc = -1;
					x = 0;
					y = SIZE_M * GRID_H;
					w = STATIC_W * GRID_W;
					h = (SIZE_M + CONTENT_BORDER) * GRID_H;
					colorBackground[]       = {0.1, 0.1, 0.1, 1};
				};

				class Title : CQC_ctrlStaticHeader {
					idc = -1;
					x = 0;
					y = 0;
					w = STATIC_W * GRID_W;
					h = SIZE_M * GRID_H;
					text = "Settings";
				};
				
				class Footer : CQC_ctrlStaticFooter {
					idc = -1;
					x = 0;
					y = (STATIC_H - (SIZE_M + 2)) * GRID_H;
					w = STATIC_W * GRID_W;
					h = (SIZE_M + 2) * GRID_H;
				};

				class tabs: CQC_ctrlToolbox {
                    idc = IDC_DISPLAYSETTINGS_TOOLBOX;
                    x = 0;
                    y = (SIZE_M + CONTENT_BORDER) * GRID_H;
                    w = STATIC_W * GRID_W;
                    h = SIZE_M * GRID_H;
                    columns = 3;
                    strings[] = {"General Settings", "View Distance", "Vehicle Textures"};
                };

				class CloseBtn: CQC_ctrlButtonClose {
            		idc = IDC_DISPLAYSETTINGS_BUTTONCLOSE;
            		onButtonClick = "closeDialog 0;";
            		x = (STATIC_W - SIZE_M) * GRID_W;
            		y = 0;
            		w = SIZE_M * GRID_W;
            		h = SIZE_M * GRID_H;
        		};

				class GeneralGroup: CQC_ctrlControlsGroupNoScrollbars {
					idc = IDC_DISPLAYSETTINGS_GROUP_GENERAL;
					x = 0;
					y = ((SIZE_M * 3) + (CONTENT_BORDER * 1)) * GRID_H;
					w = STATIC_W * GRID_W;
					h = ((SIZE_M * 1) + (CONTENT_BORDER * 3)) * GRID_H;
					class Controls {

						
					};
				};

				class ViewGroup: CQC_ctrlControlsGroupNoScrollbars {
					idc = IDC_DISPLAYSETTINGS_GROUP_VIEW;
					x = 0;
					y = ((SIZE_M * 3) + (CONTENT_BORDER * 1)) * GRID_H;
					w = STATIC_W * GRID_W;
					h = ((SIZE_M * 1) + (CONTENT_BORDER * 3)) * GRID_H;
					class Controls {

						
					};
				};

				class VehicleGroup: CQC_ctrlControlsGroupNoScrollbars {
					idc = IDC_DISPLAYSETTINGS_GROUP_VEHICLE;
					x = 0;
					y = ((SIZE_M * 3) + (CONTENT_BORDER * 1)) * GRID_H;
					w = STATIC_W * GRID_W;
					h = ((SIZE_M * 1) + (CONTENT_BORDER * 3)) * GRID_H;
					class Controls {

						
					};
				};
			};
		};
	};
};