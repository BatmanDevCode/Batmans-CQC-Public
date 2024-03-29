
class CQC_ctrlControlsGroup: CQC_ctrlDefault {
    type = 15;
    style = 16;
    x = 0;
    y = 0;
    w = 1;
    h = 1;
    class VScrollBar: ScrollBar {
        width = "2 * (pixelW * pixelGrid * 	0.50)";
        height = 0;
        autoScrollEnabled = 0;
        autoScrollDelay = 1;
        autoScrollRewind = 1;
        autoScrollSpeed = 1;
    };
    class HScrollBar: ScrollBar {
        width = 0;
        height = "2 * (pixelH * pixelGrid * 	0.50)";
    };
    onCanDestroy = "";
    onDestroy = "";
    onMouseButtonDown = "";
    onMouseButtonUp = "";
    onMouseButtonClick = "";
    onMouseButtonDblClick = "";
    onMouseZChanged = "";
    onMouseMoving = "";
    onMouseHolding = "";
};

class CQC_ctrlControlsGroupNoScrollbars: CQC_ctrlControlsGroup {
    class VScrollbar: VScrollBar {
        width = 0;
    };
    class HScrollbar: HScrollBar {
        height = 0;
    };
};