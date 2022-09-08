
class CQC_ctrlStructuredText: CQC_ctrlDefaultText {
    type               = 13;
    colorBackground[]  = {0, 0, 0, 0};
    size               = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
    text               = "";
    class Attributes {
        align     = "left";
        color     = "#ffffff";
        colorLink = "";
        size      = 1;
        font      = "RobotoCondensedLight";
    };
    onCanDestroy = "";
    onDestroy    = "";
};
