#define STATIC_W 150
#define STATIC_H 140
#define CONTENT_W (STATIC_W - 2)
#define CONTENT_H (STATIC_H - 21)
#define CONTENT_BORDER 1

class CQC_displaySelectArena {
	idd = IDD_DISPLAYARENAS_DISPLAY;
	movingEnable = true;
	scriptName = "CQC_displaySelectArena";
	scriptPath = "GUI";
    onLoad = "['CQC_displaySelectArena', _this select 0] call CQC_fnc_initDisplay;";

	class ControlsBackground {
		class Background : CQC_ctrlStaticBackground {
			idc = -1;
			x = CENTER_X - (STATIC_W * 0.5) * GRID_W;
			y = CENTER_Y - (STATIC_H * 0.5 - 2 * SIZE_M - 1) * GRID_H;
			w = STATIC_W * GRID_W;
			h = (STATIC_H - (2 * SIZE_M) - 1) * GRID_H;
		};
				
		class TabsBackground : CQC_ctrlStaticBackground {
			idc = -1;
			x = CENTER_X - (STATIC_W * 0.5) * GRID_W;
			y = CENTER_Y - (STATIC_H * 0.5 - SIZE_M) * GRID_H;
			w = STATIC_W * GRID_W;
			h = (SIZE_M + 1) * GRID_H;
			colorBackground[] = {0.1, 0.1, 0.1, 1};
		};

		class FooterBackground : CQC_ctrlStaticFooter {
			idc = -1;
			x = CENTER_X - (STATIC_W * 0.5) * GRID_W;
			y = CENTER_Y + (STATIC_H * 0.5) * GRID_H;
			w = STATIC_W * GRID_W;
			h = (SIZE_M + 2) * GRID_H;
		};
	};

	class Controls {
		class Dummy : CQC_ctrlStatic {
			idc = -1;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			text = "";
		};

		class Title : CQC_ctrlStaticHeaderMoving {
			idc = -1;
			x = CENTER_X - (STATIC_W * 0.5) * GRID_W;
			y = CENTER_Y - (STATIC_H * 0.5) * GRID_H;
			w = STATIC_W * GRID_W;
			h = SIZE_M * GRID_H;
			text = "Select Arena";
		};

		class Tabs: CQC_ctrlToolbox {
            idc = IDC_DISPLAYARENAS_TOOLBOX;
            x = CENTER_X - (STATIC_W * 0.5) * GRID_W;
			y = CENTER_Y - (STATIC_H * 0.5 - SIZE_M - 1) * GRID_H;
			w = STATIC_W * GRID_W;
			h = SIZE_M * GRID_H;
            columns = 2;
            strings[] = {"CQC Arenas", "Events"};
        };

		class CloseBtn: CQC_ctrlButtonClose {
            idc = IDC_DISPLAYARENAS_BUTTONCLOSE;
            onButtonClick = "closeDialog 0;";
            x = CENTER_X + (STATIC_W * 0.5 - SIZE_M) * GRID_W;
            y = CENTER_Y - (STATIC_H * 0.5) * GRID_H;
            w = SIZE_M * GRID_W;
            h = SIZE_M * GRID_H;
        };

		class SpawnButton : CQC_ctrlDefaultButton {
			idc = IDC_DISPLAYARENAS_BUTTONSPAWN;
			x = CENTER_X - (STATIC_W * 0.5 - 1) * GRID_W;
			y = CENTER_Y + (STATIC_H * 0.5 + 1) * GRID_H;
			w = 24 * GRID_W;
			h = SIZE_M * GRID_H;
			text = "Spawn";
		};

		class NoteStatus : CQC_ctrlStatic {
			idc = IDC_DISPLAYARENAS_NOTESTATUS;
			style = ST_CENTER;
			x = CENTER_X - (STATIC_W * 0.5 - 1) * GRID_W;
			y = CENTER_Y - (STATIC_H * 0.5 - 2 * SIZE_M - 2) * GRID_H;
			w = CONTENT_W * GRID_W;
			h = (SIZE_M + 2) * GRID_H;
			colorBackground[] = {COLOR_NOTE_DEFAULT_RGBA};
			text = "Select an Arena";
			font = FONT_RC_NORMAL;
			sizeEx = SIZEEX_PURISTA(SIZEEX_L);
		};		


		class RegularGroup: CQC_ctrlControlsGroupNoScrollbars {
			idc = IDC_DISPLAYNARENAS_GROUP_REGULAR;
			x = CENTER_X - (STATIC_W * 0.5 - 1) * GRID_W;
			y = CENTER_Y - (STATIC_H * 0.5 - 3 * SIZE_M - 5) * GRID_H;
			w = CONTENT_W * GRID_W;
			h = CONTENT_H * GRID_H;
			class Controls {
				class LocationsFilterBackground: CQC_ctrlStatic {
					idc = -1;
					x = 0;
					y = 0;
					w = CONTENT_W * GRID_W;
					h = SIZE_M * GRID_H;
					colorBackground[] = {0, 0, 0, 1};
				};

				class LocationsFilter: CQC_ctrlListNBox {
					idc = IDC_DISPLAYARENAS_LOCATIONSFILTER;
					x = 0;
					y = 0;
					w = CONTENT_W * GRID_W;
					h = SIZE_M * GRID_H;
					disableOverflow = 1;
					columns[] = {0, 0.475, 0.675, 0.875};
					class Items {
						class Location {
							text    = "Location";
							value   = 0;
						};
						class Vehicles: Location { text = "Vehicles"; };
						class Weapons: Location { text = "Weapons"; };
						class Players: Location { text = "Players"; };
					};
				};
						
				class LocationsListBackground: CQC_ctrlStaticContent {
					idc = -1;
					x = 0;
					y = SIZE_M * GRID_H;
					w = CONTENT_W * GRID_W;
					h = (CONTENT_H - SIZE_M) * GRID_H;
				};
						
				class LocationsList: LocationsFilter {
					idc = IDC_DISPLAYARENAS_LOCATIONSLIST;
					x = 0;
					y = SIZE_M * GRID_H;
					w = CONTENT_W * GRID_W;
					h = (CONTENT_H - SIZE_M) * GRID_H;
					class Items {};
				};
			};
		};

		/*class AirTankGroup: CQC_ctrlControlsGroupNoScrollbars {
			idc = IDC_DISPLAYNARENAS_GROUP_AIRTANK;
			show = 0;
			x = 0;
			y = ((SIZE_M * 2) + (CONTENT_BORDER * 3)) * GRID_H;
			w = STATIC_W * GRID_W;
			h = (STATIC_H - ((SIZE_M * 2) + (SIZE_M + 5) + (CONTENT_BORDER * 1))) * GRID_H;
			class Controls {
				class AirTankHeader: CQC_ctrlStatic {
					idc = IDC_DISPLAYARENAS_ATLISTHEADER;
					x = CONTENT_BORDER * GRID_W;
					y = (SIZE_M + (CONTENT_BORDER * 2)) * GRID_H;
					w = CONTENT_W * GRID_W;
					h = SIZE_M * GRID_H;
				};

				class AirTankList: CQC_ctrlListBox {
					idc = IDC_DISPLAYARENAS_ATLISTHEADER;
					x = CONTENT_BORDER * GRID_W;
					y = (SIZE_M + (CONTENT_BORDER * 2)) * GRID_H;
					w = CONTENT_W * GRID_W;
					h = SIZE_M * GRID_H;
				};
						
			};
		};*/
	};
};