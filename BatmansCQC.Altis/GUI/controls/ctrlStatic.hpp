
class CQC_ctrlStatic: CQC_ctrlDefaultText {
    idc                     = -1;
    type                    = CT_STATIC;
    colorBackground[]       = {0, 0, 0, 0};
    text                    = "";
    lineSpacing             = 1;
    fixedWidth              = 0;
    colorText[]             = {1, 1, 1, 1};
    colorShadow[]           = {0, 0, 0, 1};
    moving                  = 0;
    autoplay                = 0;
    loops                   = 0;
    tileW                   = 1;
    tileH                   = 1;
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
    onVideoStopped          = "";
    shadow                  = 0;
};

class CQC_ctrlStaticPicture: CQC_ctrlStatic {
    style = ST_LEFT + ST_MULTI + ST_TITLE_BAR;
};

class CQC_ctrlStaticPictureKeepAspect: CQC_ctrlStaticPicture {
    style = "0x30 + 0x800";
};

class CQC_ctrlStaticBackground: CQC_ctrlStatic {
    colorBackground[] = {0.2, 0.2, 0.2, 1};
};

class CQC_ctrlStaticFooter: CQC_ctrlStatic {
    colorBackground[] = {0.15, 0.15, 0.15, 1};
    h                 = "(5 + 2) * (pixelH * pixelGrid * 0.50)";
};

class CQC_ctrlStaticContent: CQC_ctrlStatic {
    colorBackground[] = {0, 0, 0, 0.5};
};

class CQC_ctrlStaticTitle: CQC_ctrlStatic {
    moving                  = 1;
    colorText[]       = {1, 1, 1, 1};
    colorBackground[] = {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
        1
    };
    h                 = "0.022 * safezoneH";
};

class CQC_ctrlStaticTitleMoving: CQC_ctrlStaticTitle {
    moving = 1;
};

class CQC_ctrlStaticHeader: CQC_ctrlStatic {
    colorText[]       = {1, 1, 1, 1};
    colorBackground[] = {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
        1
    };
    font              = "RobotoCondensed";
    h                 = "5 * (pixelH * pixelGrid * 0.50)";
};

class CQC_ctrlStaticHeaderMoving: CQC_ctrlStaticHeader {
    moving            = 1;
};

class CQC_ctrlStaticPictureTile: CQC_ctrlStatic {
    style = 144;
};

class CQC_ctrlStaticBackgroundDisableFull: CQC_ctrlStatic {
    x = -4;
    y = -2;
    w = 8;
    h = 4;
    colorText[] = {1,1,1,0.5};
};

class CQC_ctrlStaticBackgroundDisableTiles: CQC_ctrlStaticPictureTile {
    x = -4;
    y = -2;
    w = 8;
    h = 4;
    text = "\a3\3DEN\Data\Displays\Display3DENEditAttributes\backgroundDisable_ca.paa";
    tileW = "8 / (32 * pixelW)";
    tileH = "4 / (32 * pixelH)";
    colorText[] = {1,1,1,0.05};
};