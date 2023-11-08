#define STATIC_W 150
#define STATIC_H 140
#define CONTENT_W (STATIC_W - 2)
#define CONTENT_H (STATIC_H - 20)
#define CONTENT_BORDER 1

class CQC_displaySendNotification {
	idd = IDD_DISPLAYNOTIF_DISPLAY;
	movingEnable = true;
	scriptName = "CQC_displaySendNotification";
	scriptPath = "GUI";
    onLoad = "['CQC_displaySendNotification', _this select 0] call CQC_fnc_initDisplay;";
	
	class ControlsBackground {
		class BackgroundDisable : CQC_ctrlStaticBackgroundDisableTiles {
			idc = -1;
		};

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
		class Title : CQC_ctrlStaticHeaderMoving {
			idc = -1;
			x = CENTER_X - (STATIC_W * 0.5) * GRID_W;
			y = CENTER_Y - (STATIC_H * 0.5) * GRID_H;
			w = STATIC_W * GRID_W;
			h = SIZE_M * GRID_H;
			text = "Notification Sender";
		};

		class Tabs: CQC_ctrlToolbox {
            idc = IDC_DISPLAYARENAS_TOOLBOX;
            x = CENTER_X - (STATIC_W * 0.5) * GRID_W;
			y = CENTER_Y - (STATIC_H * 0.5 - SIZE_M - 1) * GRID_H;
			w = STATIC_W * GRID_W;
			h = SIZE_M * GRID_H;
            columns = 2;
            strings[] = {"Staff Announcement", "Custom Notification"};
        };

		class CloseBtn: CQC_ctrlButtonClose {
            idc = IDC_DISPLAYARENAS_BUTTONCLOSE;
            onButtonClick = "closeDialog 0;";
            x = CENTER_X + (STATIC_W * 0.5 - SIZE_M) * GRID_W;
            y = CENTER_Y - (STATIC_H * 0.5) * GRID_H;
            w = SIZE_M * GRID_W;
            h = SIZE_M * GRID_H;
        };

		class NotifTitleHeader : CQC_ctrlStructuredText {
            idc = -1;
            text = "Title:";
            sizeEx = 0.02;
            x = CENTER_X - (STATIC_W * 0.5) * GRID_W;
			y = CENTER_Y - (STATIC_H * 0.5 - 2 * SIZE_M - 2) * GRID_H;
            w = (CONTENT_W * 3/6 - (CONTENT_BORDER * 0.5)) * GRID_W;
            h = SIZE_M * GRID_H;
        };
				
		class NotifTimeHeader : CQC_ctrlStructuredText {
            idc = -1;
            text = "Time (s):";
            sizeEx = 0.02;
            x = CENTER_X - (STATIC_W * 0.5 - CONTENT_W * 3/6) * GRID_W;
			y = CENTER_Y - (STATIC_H * 0.5 - 2 * SIZE_M - 2) * GRID_H;
            w = (CONTENT_W * 3/6 - (CONTENT_BORDER * 0.5)) * GRID_W;
            h = SIZE_M * GRID_H;
        };

		class NotifTypeHeader : CQC_ctrlStructuredText {
            idc = -1;
            text = "Colour:";
            sizeEx = 0.02;
            x = CENTER_X - (STATIC_W * 0.5 - CONTENT_W * 4/6) * GRID_W;
			y = CENTER_Y - (STATIC_H * 0.5 - 2 * SIZE_M - 2) * GRID_H;
            w = (CONTENT_W * 3/6 - (CONTENT_BORDER * 0.5)) * GRID_W;
            h = SIZE_M * GRID_H;
        };

		class NotifBodyHeader : CQC_ctrlStructuredText {
            idc = -1;
            text = "Main Message (Structured Text):";
            sizeEx = 0.02;
            x = CENTER_X - (STATIC_W * 0.5) * GRID_W;
			y = CENTER_Y - (STATIC_H * 0.5 - 4 * SIZE_M - 3) * GRID_H;
			w = CONTENT_W * GRID_W;
			h = CONTENT_H * GRID_H;
        };

		class DisableGroup: CQC_ctrlControlsGroupNoScrollbars {
			idc = IDC_DISPLAYNOTIF_GROUPD;
			x = CENTER_X - (STATIC_W * 0.5 - 1) * GRID_W;
			y = CENTER_Y - (STATIC_H * 0.5 - 3 * SIZE_M - 1) * GRID_H;
			w = CONTENT_W * GRID_W;
			h = CONTENT_H * GRID_H;
			class Controls {
				class NotifTitle : CQC_ctrlEdit {
					idc = IDC_DISPLAYNOTIF_EDITTITLE;
					style = ST_NO_RECT;
					x = 0;
            		y = CONTENT_BORDER * GRID_H;
            		w = (CONTENT_W * 3/6 - (CONTENT_BORDER * 0.5)) * GRID_W;
            		h = SIZE_M * GRID_H;
					colorBackground[] = {0, 0, 0, 0.5};
				};

				class NotifTime : CQC_ctrlEdit {
					idc = IDC_DISPLAYNOTIF_EDITTIME;
					style = ST_NO_RECT;
					x = (CONTENT_W * 3/6 + 0.5) * GRID_W;
            		y = CONTENT_BORDER * GRID_H;
            		w = (CONTENT_W * 1/6 - (CONTENT_BORDER * 1)) * GRID_W;
            		h = SIZE_M * GRID_H;
					colorBackground[] = {0, 0, 0, 0.5};
				};

				class NotifType : CQC_ctrlCombo {
					idc = IDC_DISPLAYNOTIF_COMBOCOLOUR;
					x = (CONTENT_W * 4/6 + 0.5) * GRID_W;
            		y = CONTENT_BORDER * GRID_H;
            		w = (CONTENT_W * 2/6 - (CONTENT_BORDER * 0.5)) * GRID_W;
            		h = SIZE_M * GRID_H;
					colorBackground[]       = {0.1, 0.1, 0.1, 1};
				};
			};
		};

		class NotifBody : CQC_ctrlEditMulti {
			idc = IDC_DISPLAYNOTIF_EDITTEXT;
			style = ST_NO_RECT + ST_MULTI;
			x = CENTER_X - (STATIC_W * 0.5 - 1) * GRID_W;
			y = CENTER_Y - (STATIC_H * 0.5 - 5 * SIZE_M - 3) * GRID_H;
			w = CONTENT_W * GRID_W;
			h = (CONTENT_H - 2 * SIZE_M + 1) * GRID_H;
			colorBackground[] = {0, 0, 0, 0.5};
		};
				
		class SendButton : CQC_ctrlDefaultButton {
			idc = IDC_DISPLAYNOTIF_BUTTONSEND;
			x = CENTER_X + (STATIC_W * 0.5 - 25) * GRID_W;
			y = CENTER_Y + (STATIC_H * 0.5 + 1) * GRID_H;
			w = 24 * GRID_W;
			h = SIZE_M * GRID_H;
			text = "Send";
		};

		class PreviewButton : CQC_ctrlDefaultButton {
			idc = IDC_DISPLAYNOTIF_BUTTONPREVIEW;
			x = CENTER_X + (STATIC_W * 0.5 - 50) * GRID_W;
			y = CENTER_Y + (STATIC_H * 0.5 + 1) * GRID_H;
			w = 24 * GRID_W;
			h = SIZE_M * GRID_H;
			text = "Preview";
		};

		class ClearButton : CQC_ctrlDefaultButton {
			idc = IDC_DISPLAYNOTIF_BUTTONCLEAR;
			x = CENTER_X - (STATIC_W * 0.5 - 1) * GRID_W;
			y = CENTER_Y + (STATIC_H * 0.5 + 1) * GRID_H;
			w = 24 * GRID_W;
			h = SIZE_M * GRID_H;
			text = "Clear";
		};
	};
};