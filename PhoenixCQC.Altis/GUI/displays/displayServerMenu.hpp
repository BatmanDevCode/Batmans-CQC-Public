#define STATIC_W 133
#define STATIC_H 106
#define TILE_W (5 * SIZE_M)
#define TILE_H (5 * SIZE_M)
#define TILE_GAP SIZE_XXS

class CQC_displayServerMenu {
	idd = IDD_DISPLAYSERVERMENU_DISPLAY;
	movingEnable = false;
	scriptName = "CQC_displayServerMenu";
	scriptPath = "GUI";
    onLoad = "";
	onUnload = "";
	
	class ControlsBackground {
		class Background : CQC_ctrlStaticBackgroundDisableFull {
			idc = -1;
			colorBackground[] = {0.2,0.2,0.2,0.5};
		};
	};
	
	class Controls {};
};
