#define STATIC_W 70
#define STATIC_H 80
#define CONTENT_W (STATIC_W - 2)
#define CONTENT_H (STATIC_H - 13)
#define CONTENT_BORDER 1

class CQC_displaySelectVehicle {
	idd = IDD_DISPLAYVVS_DISPLAY;
	movingEnable = true;
	scriptName = "CQC_displaySelectVehicle";
	scriptPath = "GUI";
    onLoad = "['CQC_displaySelectVehicle', _this select 0] call CQC_fnc_initDisplay;";

	class ControlsBackground {
		class Background: CQC_ctrlStaticBackground {
			idc = -1;
			x = CENTER_X - (STATIC_W * 0.5) * GRID_W;
			y = CENTER_Y - (STATIC_H * 0.5 - 2 * SIZE_M - 1) * GRID_H;
			w = STATIC_W * GRID_W;
			h = (STATIC_H - (2 * SIZE_M) - 1) * GRID_H;
		};

		class TabsBackground: CQC_ctrlStaticBackground {
			idc = -1;
			x = CENTER_X - (STATIC_W * 0.5) * GRID_W;
			y = CENTER_Y - (STATIC_H * 0.5 - SIZE_M) * GRID_H;
			w = STATIC_W * GRID_W;
			h = (SIZE_M + 1) * GRID_H;
			colorBackground[] = {0.1, 0.1, 0.1, 1};
		};

		class Footer: CQC_ctrlStaticFooter {
			idc = -1;
			x = CENTER_X - (STATIC_W * 0.5) * GRID_W;
			y = CENTER_Y + (STATIC_H * 0.5) * GRID_H;
			w = STATIC_W * GRID_W;
			h = (SIZE_M + 2) * GRID_H;
		};
	};

	class Controls {
        class Title : CQC_ctrlStaticHeaderMoving {
			idc = IDC_DISPLAYVVS_HEADER;
			x = CENTER_X - (STATIC_W * 0.5) * GRID_W;
			y = CENTER_Y - (STATIC_H * 0.5) * GRID_H;
			w = STATIC_W * GRID_W;
			h = SIZE_M * GRID_H;
			text = "";
		};

		class Tabs: CQC_ctrlToolbox {
            idc = IDC_DISPLAYVVS_TOOLBOX;
            x = CENTER_X - (STATIC_W * 0.5) * GRID_W;
			y = CENTER_Y - (STATIC_H * 0.5 - SIZE_M - 1) * GRID_H;
			w = STATIC_W * GRID_W;
			h = SIZE_M * GRID_H;
            columns = 3;
            strings[] = {"Cars", "Air", "Tank"};
        };

		class SpawnButton : CQC_ctrlDefaultButton {
			idc = IDC_DISPLAYVVS_BUTTONSPAWN;
			x = CENTER_X - (STATIC_W * 0.5 - 1) * GRID_W;
			y = CENTER_Y + (STATIC_H * 0.5 + 1) * GRID_H;
			w = 24 * GRID_W;
			h = SIZE_M * GRID_H;
			text = "Spawn";
		};

		class ListBackground: CQC_ctrlStaticContent {
			idc = -1;
			x = CENTER_X - (STATIC_W * 0.5 - 1) * GRID_W;
			y = CENTER_Y - (STATIC_H * 0.5 - 2 * SIZE_M - 2) * GRID_H;
			w = CONTENT_W * GRID_W;
			h = CONTENT_H * GRID_H;
		};
						
		class CarsList: CQC_ctrlListBox {
			idc = IDC_DISPLAYVVS_LISTCARS;
			x = CENTER_X - (STATIC_W * 0.5 - 1) * GRID_W;
			y = CENTER_Y - (STATIC_H * 0.5 - 2 * SIZE_M - 2) * GRID_H;
			w = CONTENT_W * GRID_W;
			h = CONTENT_H * GRID_H;
			shadow = 0.75;
			colorBackground[] = {0, 0, 0, 0};
		};

		class AirList: CQC_ctrlListBox {
			idc = IDC_DISPLAYVVS_LISTAIR;
			show = 0;
			x = CENTER_X - (STATIC_W * 0.5 - 1) * GRID_W;
			y = CENTER_Y - (STATIC_H * 0.5 - 2 * SIZE_M - 2) * GRID_H;
			w = CONTENT_W * GRID_W;
			h = CONTENT_H * GRID_H;
			shadow = 0.75;
			colorBackground[] = {0, 0, 0, 0};
		};

		class TankList: CQC_ctrlListBox {
			idc = IDC_DISPLAYVVS_LISTTANK;
			show = 0;
			x = CENTER_X - (STATIC_W * 0.5 - 1) * GRID_W;
			y = CENTER_Y - (STATIC_H * 0.5 - 2 * SIZE_M - 2) * GRID_H;
			w = CONTENT_W * GRID_W;
			h = CONTENT_H * GRID_H;
			shadow = 0.75;
			colorBackground[] = {0, 0, 0, 0};
		};
	};
};
