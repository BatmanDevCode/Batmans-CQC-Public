
class CQC_ctrlDefault {
    access = 0;
    idc = -1;
    style = 0;
    default = 0;
    show = 1;
    fade = 0;
    blinkingPeriod = 0;
    deletable = 0;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    tooltip = "";
    tooltipMaxWidth = 0.5;
    tooltipColorShade[] = {0,0,0,1};
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {0,0,0,0};
    class ScrollBar
    {
        width = 0;
        height = 0;
        scrollSpeed = 0.06;
        arrowEmpty = "\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa";
        arrowFull = "\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa";
        border = "#(argb,8,8,3)color(0,0,0,0)";
        thumb = "#(rgb,8,8,3)color(0.3,0.3,0.3,1)";
        color[] = {1,1,1,1};
    };
};

class CQC_ctrlDefaultText: CQC_ctrlDefault {
    sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
    font = "RobotoCondensedLight";
    shadow = 1;
};
