#define HINT_W 67
#define HINT_H 30

class CQC_ctrlHint: CQC_ctrlControlsGroupNoScrollbars {
    x = safezoneX + safezoneW - ((HINT_W + SIZE_S) * GRID_W);
    y = safezoneY + ((HINT_H + SIZE_S) * GRID_H);
    w = HINT_W * GRID_W;
    
    class Controls {
        class Background: CQC_ctrlStatic {
            idc = 1010;
            w = HINT_W * GRID_W;
            colorBackground[] ={0, 0, 0, 79};
        };

        class Bar: CQC_ctrlStatic {
            idc = 1020;
            w = 1 * GRID_W;
        };

        class Text: CQC_ctrlStatic {
            idc = 1030;
            x = 2 * GRID_W;
            y = 1 * GRID_H;
            w = HINT_W - 3 * GRID_W;
        };
    };
};