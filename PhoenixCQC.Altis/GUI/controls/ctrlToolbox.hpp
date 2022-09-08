class CQC_ctrlToolbox: CQC_ctrlDefaultText {
	type                    = 6;
	style                   = 2;
	colorBackground[]       = {0, 0, 0, 0};
	colorText[]             = {1, 1, 1, 1};
	colorTextSelect[]       = {1, 1, 1, 1};
	rows                    = 1;
	columns                 = 1;
	strings[]               = {};
	values[]                = {};
	color[]                 = {1, 0, 1, 1};
	colorSelect[]           = {0, 0, 0, 0};
	colorTextDisable[]      = {0, 0, 0, 0};
	colorDisable[]          = {0, 0, 0, 0};
	colorSelectedBg[]       = {0.2, 0.2, 0.2, 1};
	onCanDestroy            = "";
	onDestroy               = "";
	onMouseEnter            = "";
	onMouseExit             = "";
	onSetFocus              = "";
	onKillFocus             = "";
	onKeyDown               = "";
	onKeyUp                 = "";
	onMouseButtonDown       = "";
	onMouseButtonUp         = "";
	onMouseButtonClick      = "";
	onMouseButtonDblClick   = "";
	onMouseZChanged         = "";
	onMouseMoving           = "";
	onMouseHolding          = "";
	onToolBoxSelChanged     = "";
};
class CQC_ctrlToolboxPicture: CQC_ctrlToolbox {
	style                   = "0x02 + 0x30";
};
class CQC_ctrlToolboxPictureKeepAspect: CQC_ctrlToolbox {
	style                   = "0x02 + 0x30 + 0x800";
};