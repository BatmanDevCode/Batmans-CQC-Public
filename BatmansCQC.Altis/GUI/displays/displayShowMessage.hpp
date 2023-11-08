#define STATIC_W 100
#define STATIC_H 10
class CQC_displayShowMessage {
	idd = IDD_DISPLAYSHOWMSG_DISPLAY;
	movingEnable = true;

	class controlsBackground {
        class Background: CQC_ctrlStaticBackground {
            idc = IDC_DISPLAYSHOWMSG_BACKGROUND;
           	x = CENTER_X - (STATIC_W * 0.5) * GRID_W;
			y = CENTER_Y - (STATIC_H * 0.5 + 1) * GRID_H;
			w = STATIC_W * GRID_W;
			h = STATIC_H * GRID_H;
        };

        class FooterBackground: CQC_ctrlStaticFooter {
			idc = IDC_DISPLAYSHOWMSG_FOOTER;
			x = CENTER_X - (STATIC_W * 0.5) * GRID_W;
			y = CENTER_Y + (STATIC_H * 0.5 - 1) * GRID_H;
			w = STATIC_W * GRID_W;
			h = (SIZE_M + 2) * GRID_H;
		};
    };
	
    class Controls {
		class Title: CQC_ctrlStaticHeaderMoving {
			idc = IDC_DISPLAYSHOWMSG_TITLE;
			x = CENTER_X - (STATIC_W * 0.5) * GRID_W;
			y = CENTER_Y - (STATIC_H * 0.5 + SIZE_M + 1) * GRID_H;
			w = STATIC_W * GRID_W;
			h = SIZE_M * GRID_H;
			text = "Warning";
		};

        class Text: CQC_ctrlStructuredText {
			idc = IDC_DISPLAYSHOWMSG_TEXT;
			x = CENTER_X - (STATIC_W * 0.5 - (SIZE_M * 3) - 1) * GRID_W;
			y = CENTER_Y - (1) * GRID_H;
			w = (STATIC_W - (SIZE_M * 4 + 1)) * GRID_W;
			h = 0;
			text = "";
		};

        class Picture: CQC_ctrlStaticPictureKeepAspect {
			idc = IDC_DISPLAYSHOWMSG_PICTURE;
			x = CENTER_X - (STATIC_W * 0.5 - SIZE_M) * GRID_W;
			y = CENTER_Y - (SIZE_M + 1) * GRID_H;
			w = SIZE_M * 2  * GRID_W;
			h = SIZE_M * 2 * GRID_H;
			text = "\a3\3DEN\Data\Displays\Display3DENMsgBox\picture_ca.paa";
		};

        class ButtonOK: CQC_ctrlDefaultButton {
			idc = IDC_DISPLAYSHOWMSG_BUTTONOK;
			x = CENTER_X + (STATIC_W * 0.5 - 50) * GRID_W;
			y = CENTER_Y + (STATIC_H * 0.5) * GRID_H;
			w = 24 * GRID_W;
			h = SIZE_M * GRID_H;
			text = "OK";
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 2";
		};

        class ButtonCancel: CQC_ctrlDefaultButton {
			idc = IDC_DISPLAYSHOWMSG_BUTTONCANCEL;
			x = CENTER_X + (STATIC_W * 0.5 - 25) * GRID_W;
			y = CENTER_Y + (STATIC_H * 0.5) * GRID_H;
			w = 24 * GRID_W;
			h = SIZE_M * GRID_H;
			text = "Cancel";
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 2";
		};
    };
};