#define MAP_W 350
#define MAP_H 200

class CQC_displayAdmin {
    idd = IDD_DISPLAYADMIN_DISPLAY;
	movingEnable = false;
	scriptName = "CQC_displayAdmin";
	scriptPath = "GUI";
    onLoad = "['CQC_displayAdmin', _this select 0] call CQC_fnc_initDisplay;";
    
    class controlsBackground {
        class MouseHandler: CQC_ctrlStructuredText {
            idc = IDC_DISPLAYADMIN_MOUSEHANDLER;
            x   = "safezoneXAbs";
            y   = "safezoneY";
            w   = "safezoneWAbs";
            h   = "safezoneH";
        };
    };
    
    class controls {
        class Toolbar: CQC_ctrlControlsGroupNoScrollbars {
            idc = IDC_DISPLAYADMIN_TOOLBAR;
            style = 16;
            x = "safezoneX";
            y = "safezoneY";
            w = "safezoneW";
            h = "(	5 + 2) * (pixelH * pixelGrid * 	0.50)";
            class controls {
                class ToolbarBackground: CQC_ctrlStatic {
                    idc = -1;
                    x = 0;
                    y = 0;
                    w = "safezoneW";
                    h = "7 * (pixelH * pixelGrid * 0.50)";
                    sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                    colorBackground[] = {0.2, 0.2, 0.2, 1};
                };

                /*class Seperator5: CQC_ctrlStatic {
                    idc = -1;
                    x = "23 * 	(	5 * (pixelW * pixelGrid * 	0.50))";
                    y = "1 * (pixelH * pixelGrid * 	0.50)";
                    w = "pixelW";
                    h = "(	5 * (pixelH * pixelGrid * 	0.50))";
                    sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                    colorBackground[] = {0, 0, 0, 0.5}; 
                };*/

                /*class Seperator4: CQC_ctrlStatic {
                    idc = -1;
                    x = "17.5 * 	(	5 * (pixelW * pixelGrid * 	0.50))";
                    y = "1 * (pixelH * pixelGrid * 	0.50)";
                    w = "pixelW";
                    h = "(	5 * (pixelH * pixelGrid * 	0.50))";
                    sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                    colorBackground[] = {0, 0, 0, 0.5}; 
                };*/

                class Seperator3: CQC_ctrlStatic {
                    idc = -1;
                    x = "11 * 	(	5 * (pixelW * pixelGrid * 	0.50))";
                    y = "1 * (pixelH * pixelGrid * 	0.50)";
                    w = "pixelW";
                    h = "(	5 * (pixelH * pixelGrid * 	0.50))";
                    sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                    colorBackground[] = {0, 0, 0, 0.5}; 
                };

                class Seperator2: CQC_ctrlStatic {
                    idc = -1;
                    x = "8 * 	(	5 * (pixelW * pixelGrid * 	0.50))";
                    y = "1 * (pixelH * pixelGrid * 	0.50)";
                    w = "pixelW";
                    h = "(	5 * (pixelH * pixelGrid * 	0.50))";
                    sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                    colorBackground[] = {0, 0, 0, 0.5}; 
                };

                class Seperator1: CQC_ctrlStatic {
                    idc = -1;
                    x = "4 * 	(	5 * (pixelW * pixelGrid * 	0.50))";
                    y = "1 * (pixelH * pixelGrid * 	0.50)";
                    w = "pixelW";
                    h = "(	5 * (pixelH * pixelGrid * 	0.50))";
                    sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                    colorBackground[] = {0, 0, 0, 0.5}; 
                };

                class ButtonsGroup1: CQC_ctrlControlsGroupNoScrollbars {
                    idc = -1;
                    x = "0.5 * 	(	5 * (pixelW * pixelGrid * 	0.50))";
                    y = "1 * (pixelH * pixelGrid * 	0.50)";
                    w = "4 * 	(	5 * (pixelW * pixelGrid * 	0.50))";
                    h = "(	5 * (pixelH * pixelGrid * 	0.50))";
                    class controls {
                        class ButtonsGroup1_1: CQC_ctrlButtonToolbar {
                            idc = IDC_DISPLAYADMIN_TOOLBAR_BUTTONINTEL;
                            text = "\a3\3DEN\Data\Displays\Display3DEN\toolbar\intel_ca.paa";
                            tooltip = "Weather";
                            x = "0 * 	(	5 * (pixelW * pixelGrid * 	0.50))";
                            y = 0;
                            w = "(	5 * (pixelW * pixelGrid * 	0.50))";
                            h = "(	5 * (pixelH * pixelGrid * 	0.50))";
                            sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                        };

                        class ButtonsGroup1_2: CQC_ctrlButtonToolbar {
                            idc = IDC_DISPLAYADMIN_TOOLBAR_BUTTONMAP;
                            text = "\a3\3DEN\Data\Displays\Display3DEN\toolbar\map_off_ca.paa";
                            tooltip = "Toggle Map (M)";
                            x = "1 * 	(	5 * (pixelW * pixelGrid * 	0.50))";
                            y = 0;
                            w = "(	5 * (pixelW * pixelGrid * 	0.50))";
                            h = "(	5 * (pixelH * pixelGrid * 	0.50))";
                            sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                        };

                        class ButtonsGroup1_3: CQC_ctrlButtonToolbar {
                            idc = IDC_DISPLAYADMIN_TOOLBAR_BUTTONVISIONMODE;
                            text = "\a3\3DEN\Data\Displays\Display3DEN\toolbar\vision_normal_ca.paa";
                            tooltip = "Toggle Vision Mode (N)";
                            x = "2 * 	(	5 * (pixelW * pixelGrid * 	0.50))";
                            y = 0;
                            w = "(	5 * (pixelW * pixelGrid * 	0.50))";
                            h = "(	5 * (pixelH * pixelGrid * 	0.50))";
                            sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                        };
                    };
                };

                class ButtonsGroup2: CQC_ctrlControlsGroupNoScrollbars {
                    idc = -1;
                    x = "4.5 * 	(	5 * (pixelW * pixelGrid * 	0.50))";
                    y = "1 * (pixelH * pixelGrid * 	0.50)";
                    w = "3 * 	(	5 * (pixelW * pixelGrid * 	0.50))";
                    h = "(	5 * (pixelH * pixelGrid * 	0.50))";
                    class controls {
                        class ButtonsGroup2_1: CQC_ctrlButtonToolbar {
                            idc = IDC_DISPLAYADMIN_TOOLBAR_BUTTONENTITIES;
                            onLoad = "(_this select 0) ctrlSetText (getMissionPath 'GUI\data\displays\displayAdmin\drawentities_off_ca.paa')";
                            tooltip = "Draw Entities";
                            x = "0 * 	(	5 * (pixelW * pixelGrid * 	0.50))";
                            y = 0;
                            w = "(	5 * (pixelW * pixelGrid * 	0.50))";
                            h = "(	5 * (pixelH * pixelGrid * 	0.50))";
                            sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                        };

                        class ButtonsGroup2_2: CQC_ctrlButtonToolbar {
                            idc = IDC_DISPLAYADMIN_TOOLBAR_BUTTONUNITS;
                            onLoad = "(_this select 0) ctrlSetText (getMissionPath 'GUI\data\displays\displayAdmin\drawunits_on_ca.paa')";
                            tooltip = "Draw Player Tags (T)";
                            x = "1 * 	(	5 * (pixelW * pixelGrid * 	0.50))";
                            y = 0;
                            w = "(	5 * (pixelW * pixelGrid * 	0.50))";
                            h = "(	5 * (pixelH * pixelGrid * 	0.50))";
                            sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                        };

                        class ButtonsGroup2_3: CQC_ctrlButtonToolbar {
                            idc = IDC_DISPLAYADMIN_TOOLBAR_BUTTONLOCATIONS;
                            onLoad = "(_this select 0) ctrlSetText (getMissionPath 'GUI\data\displays\displayAdmin\drawlocations_on_ca.paa')";
                            tooltip = "Draw Locations (L)";
                            x = "2 * 	(	5 * (pixelW * pixelGrid * 	0.50))";
                            y = 0;
                            w = "(	5 * (pixelW * pixelGrid * 	0.50))";
                            h = "(	5 * (pixelH * pixelGrid * 	0.50))";
                            sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                        };
                    };
                };

                class ButtonsGroup3: CQC_ctrlControlsGroupNoScrollbars {
                    idc = -1;
                    x = "8.5 * 	(	5 * (pixelW * pixelGrid * 	0.50))";
                    y = "1 * (pixelH * pixelGrid * 	0.50)";
                    w = "3 * 	(	5 * (pixelW * pixelGrid * 	0.50))";
                    h = "(	5 * (pixelH * pixelGrid * 	0.50))";
                    class controls {
                        class ButtonsGroup3_1: CQC_ctrlButtonToolbar {
                            idc = IDC_DISPLAYADMIN_TOOLBAR_BUTTONARSENAL;
                            text = "a3\ui_f\data\gui\rsc\rscdisplayarsenal\spacearsenal_ca.paa";
                            tooltip = "Arsenal";
                            x = "0 * 	(	5 * (pixelW * pixelGrid * 	0.50))";
                            y = 0;
                            w = "(	5 * (pixelW * pixelGrid * 	0.50))";
                            h = "(	5 * (pixelH * pixelGrid * 	0.50))";
                            sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                        };

                        class ButtonsGroup3_2: CQC_ctrlButtonToolbar {
                            idc = IDC_DISPLAYADMIN_TOOLBAR_BUTTONDEBUG;
                            text = "a3\3den\data\displays\display3den\entitymenu\findconfig_ca.paa";
                            tooltip = "Debug Console (`)";
                            x = "1 * 	(	5 * (pixelW * pixelGrid * 	0.50))";
                            y = 0;
                            w = "(	5 * (pixelW * pixelGrid * 	0.50))";
                            h = "(	5 * (pixelH * pixelGrid * 	0.50))";
                            sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                        };
                    };
                };

                class ButtonsGroup4: CQC_ctrlControlsGroupNoScrollbars {
                    idc = -1;
                    x = "11.5 * 	(	5 * (pixelW * pixelGrid * 	0.50))";
                    y = "1 * (pixelH * pixelGrid * 	0.50)";
                    w = "3 * 	(	5 * (pixelW * pixelGrid * 	0.50))";
                    h = "(	5 * (pixelH * pixelGrid * 	0.50))";
                    class controls {
                        class ButtonsGroup4_1: CQC_ctrlButtonToolbar {
                            idc = IDC_DISPLAYADMIN_TOOLBAR_BUTTONNOTIF;
                            onLoad = "_this param [0, controlNull, [controlNull]] ctrlSetText (getMissionPath 'GUI\data\displays\displayAdmin\notification_ca.paa')";
                            tooltip = "Notification Sender";
                            x = "0 * 	(	5 * (pixelW * pixelGrid * 	0.50))";
                            y = 0;
                            w = "(	5 * (pixelW * pixelGrid * 	0.50))";
                            h = "(	5 * (pixelH * pixelGrid * 	0.50))";
                            sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                        };

                        class ButtonsGroup4_2: CQC_ctrlButtonToolbar {
                            idc = IDC_DISPLAYADMIN_TOOLBAR_BUTTONSTAFFONDUTY;
                            onLoad = "_this param [0, controlNull, [controlNull]] ctrlSetText (getMissionPath 'GUI\data\displays\displayAdmin\g_off_ca.paa')";
                            tooltip = "Staff on Duty";
                            x = "1 * 	(	5 * (pixelW * pixelGrid * 	0.50))";
                            y = 0;
                            w = "(	5 * (pixelW * pixelGrid * 	0.50))";
                            h = "(	5 * (pixelH * pixelGrid * 	0.50))";
                            sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                        };
                    };
                };

                class Close: CQC_ctrlControlsGroupNoScrollbars {
                    idc = -1;
                    x = "safezoneW - 1 * 	(	5 * (pixelW * pixelGrid * 	0.50)) - (pixelW * pixelGrid * 	0.50)";
                    y = "1 * (pixelH * pixelGrid * 	0.50)";
                    w = "1 * 	(	5 * (pixelW * pixelGrid * 	0.50))";
                    h = "(	5 * (pixelH * pixelGrid * 	0.50))";
                    class controls {
                        class CloseButton: CQC_ctrlButtonClose3DEN {
                            idc = IDC_DISPLAYADMIN_TOOLBAR_BUTTONCLOSE;
                            x = "0 * 	(	5 * (pixelW * pixelGrid * 	0.50))";
                            y = 0;
                            w = "(	5 * (pixelW * pixelGrid * 	0.50))";
                            h = "(	5 * (pixelH * pixelGrid * 	0.50))";
                            sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                        };
                    };
                };               
            };
        };

        class MAP: CQC_RscMapControl {
            idc = IDC_DISPLAYADMIN_MAP;
            show = 0;
            x = CENTER_X - (MAP_W * 0.5) * GRID_W;
			y = CENTER_Y - (MAP_H * 0.5) * GRID_H;
			w = MAP_W * GRID_W;
			h = MAP_H * GRID_H;
        };
        
        class PanelLeft: CQC_ctrlControlsGroupNoScrollbars {
            idc = IDC_DISPLAYADMIN_PANELLEFT;
            style = 16;
            x = "safezoneX";
            y = "safezoneY + (	5 + 2) * (pixelH * pixelGrid * 	0.50)";
            w = "60 * (pixelW * pixelGrid * 	0.50)";
            h = "safezoneH - (	5 + 2) * (pixelH * pixelGrid * 	0.50)";
            class controls {
                class PanelLeftBackground: CQC_ctrlStatic {
                    idc = -1;
                    x = 0;
                    y = "(	5 + 1) * (pixelH * pixelGrid * 	0.50)";
                    w = "60 * (pixelW * pixelGrid * 	0.50)";
                    h = "safezoneH - (		0 + 	(	5 + 2) + 	(	5 + 1) + 		4) * (pixelH * pixelGrid * 	0.50)";
                    sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                    colorBackground[] = {0.2,0.2,0.2,0.87};
                };

                class PanelLeftEdit: CQC_ctrlControlsGroupNoScrollbars {
                    idc = -1;
                    x = 0;
                    y = "(	5 + 1) * (pixelH * pixelGrid * 	0.50)";
                    w = "60 * (pixelW * pixelGrid * 	0.50)";
                    h = "safezoneH - (		0 + 	(	5 + 2) + 	(	5 + 1) + 		4) * (pixelH * pixelGrid * 	0.50)";
                    class controls {
                        /*class CollapseAllButton: CQC_ctrlButtonCollapseAll {
                            idc = -1;
                            x = "(	60 - 2 * 	5) * (pixelW * pixelGrid * 	0.50)";
                            y = "(pixelH * pixelGrid * 	0.50)";
                            w = "5 * (pixelW * pixelGrid * 	0.50)";
                            h = "5 * (pixelH * pixelGrid * 	0.50)";
                            sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                        };*/

                        class Edit: CQC_ctrlTree {
                            idc = IDC_DISPLAYADMIN_PANELLEFT_TREEUNITS;
                            x = 0;
                            y = "(	5 + 2) * (pixelH * pixelGrid * 	0.50)";
                            w = "60 * (pixelW * pixelGrid * 	0.50)";
                            h = "safezoneH - (		5 + 	(	14 + 2) + 	(	5 + 1) + 		4) * (pixelH * pixelGrid * 	0.50)";
                            sizeEx = "3.96 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                            idcSearch = IDC_DISPLAYADMIN_PANELLEFT_EDITSEARCH;
                        };

                        class EditPanel: CQC_ctrlControlsGroupNoScrollbars {
                            idc = IDC_DISPLAYADMIN_UNITTOOLBAR;
                            x = 0;
                            y = "safezoneH - (		0+ 	(	5 + 2) + 	(	5 + 1) + 		4 + 	5 + 2) * (pixelH * pixelGrid * 	0.50)";
                            w = "60 * (pixelW * pixelGrid * 	0.50)";
                            h = "(	5 + 2) * (pixelH * pixelGrid * 	0.50)";
                            class controls {
                                class Backgroundep: CQC_ctrlStatic {
                                    idc = -1;
                                    x = 0;
                                    y = 0;
                                    w = "60 * (pixelW * pixelGrid * 0.50)";
                                    h = "(	5 + 2) * (pixelH * pixelGrid * 	0.50)";
                                    sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                                    colorBackground[] = {0.2,0.2,0.2,1};
                                };

                                class Button1: CQC_ctrlButtonToolbar {
                                    idc = IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONHEAL;
                                    text = "\a3\3DEN\Data\CfgWaypoints\support_ca.paa";
                                    tooltip = "Heal (Selected Player)";
                                    x = "1 * (pixelW * pixelGrid * 	0.50)";
                                    y = "(pixelH * pixelGrid * 	0.50)";
                                    w = "5 * (pixelW * pixelGrid * 	0.50)";
                                    h = "5 * (pixelH * pixelGrid * 	0.50)";
                                    sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                                };

                                class Button2: CQC_ctrlButtonToolbar {
                                    idc = IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONKILL;
                                    text = "a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa";
                                    tooltip = "Kill (Selected Player)";
                                    x = "6 * (pixelW * pixelGrid * 	0.50)";
                                    y = "(pixelH * pixelGrid * 	0.50)";
                                    w = "5 * (pixelW * pixelGrid * 	0.50)";
                                    h = "5 * (pixelH * pixelGrid * 	0.50)";
                                    sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                                };

                                class Seperator6: CQC_ctrlStatic {
                                    idc = -1;
                                    x = "13.5 * 	(pixelW * pixelGrid * 	0.50)";
                                    y = "1 * (pixelH * pixelGrid * 	0.50)";
                                    w = "pixelW";
                                    h = "(	5 * (pixelH * pixelGrid * 	0.50))";
                                    sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                                    colorBackground[] = {0, 0, 0, 0.5}; 
                                };

                                class Button3: CQC_ctrlButtonToolbar {
                                    idc = IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONFREEZE;
                                    onLoad = "_this param [0, controlNull, [controlNull]] ctrlSetText (getMissionPath 'GUI\data\displays\displayAdmin\freeze_off_ca.paa')";
                                    tooltip = "Toggle Freeze (Selected Player)";
                                    x = "16 * (pixelW * pixelGrid * 	0.50)";
                                    y = "(pixelH * pixelGrid * 	0.50)";
                                    w = "5 * (pixelW * pixelGrid * 	0.50)";
                                    h = "5 * (pixelH * pixelGrid * 	0.50)";
                                    sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                                };

                                class Button4: CQC_ctrlButtonToolbar {
                                    idc = IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONHIDE;
                                    onLoad = "_this param [0, controlNull, [controlNull]] ctrlSetText (getMissionPath 'GUI\data\displays\displayAdmin\hide_off_ca.paa')";
                                    tooltip = "Toggle Hide (Selected Player)";
                                    x = "21 * (pixelW * pixelGrid * 	0.50)";
                                    y = "(pixelH * pixelGrid * 	0.50)";
                                    w = "5 * (pixelW * pixelGrid * 	0.50)";
                                    h = "5 * (pixelH * pixelGrid * 	0.50)";
                                    sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                                };

                                class Button5: CQC_ctrlButtonToolbar {
                                    idc = IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONGOD;
                                    onLoad = "_this param [0, controlNull, [controlNull]] ctrlSetText (getMissionPath 'GUI\data\displays\displayAdmin\godmode_off_ca.paa')";
                                    tooltip = "Toggle GodMode (Selected Player)";
                                    x = "26 * (pixelW * pixelGrid * 	0.50)";
                                    y = "(pixelH * pixelGrid * 	0.50)";
                                    w = "5 * (pixelW * pixelGrid * 	0.50)";
                                    h = "5 * (pixelH * pixelGrid * 	0.50)";
                                    sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                                };

                                class Button6: CQC_ctrlButtonToolbar {
                                    idc = IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONDISABLEFIRE;
                                    onLoad = "_this param [0, controlNull, [controlNull]] ctrlSetText (getMissionPath 'GUI\data\displays\displayAdmin\disablefire_off_ca.paa')";
                                    tooltip = "Toggle Disable Fire (Selected Player)";
                                    x = "31 * (pixelW * pixelGrid * 	0.50)";
                                    y = "(pixelH * pixelGrid * 	0.50)";
                                    w = "5 * (pixelW * pixelGrid * 	0.50)";
                                    h = "5 * (pixelH * pixelGrid * 	0.50)";
                                    sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                                };

                                class Seperator7: CQC_ctrlStatic {
                                    idc = IDC_DISPLAYADMIN_SEPERATOR_7;
                                    x = "38.5 * 	(pixelW * pixelGrid * 	0.50)";
                                    y = "1 * (pixelH * pixelGrid * 	0.50)";
                                    w = "pixelW";
                                    h = "(	5 * (pixelH * pixelGrid * 	0.50))";
                                    sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                                    colorBackground[] = {0, 0, 0, 0.5}; 
                                };

                                class Button7: CQC_ctrlButtonToolbar {
                                    idc = IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONEJECT;
                                    onLoad = "_this param [0, controlNull, [controlNull]] ctrlSetText (getMissionPath 'GUI\data\displays\displayAdmin\eject_ca.paa')";
                                    tooltip = "Eject (Selected Player)";
                                    x = "41 * (pixelW * pixelGrid * 	0.50)";
                                    y = "(pixelH * pixelGrid * 	0.50)";
                                    w = "5 * (pixelW * pixelGrid * 	0.50)";
                                    h = "5 * (pixelH * pixelGrid * 	0.50)";
                                    sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                                };

                                /*class Button8: CQC_ctrlButtonToolbar {
                                    idc = IDC_DISPLAYADMIN_UNITTOOLBAR_BUTTONSPEED;
                                    onLoad = "_this param [0, controlNull, [controlNull]] ctrlSetText (getMissionPath 'GUI\data\displays\displayAdmin\speed_off_ca.paa')";
                                    tooltip = "";
                                    x = "46 * (pixelW * pixelGrid * 	0.50)";
                                    y = "(pixelH * pixelGrid * 	0.50)";
                                    w = "5 * (pixelW * pixelGrid * 	0.50)";
                                    h = "5 * (pixelH * pixelGrid * 	0.50)";
                                    sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                                };*/
                            };
                        };
                        
                        /*class ExpandAllButton: CQC_ctrlButtonExpandAll {
                            idc = -1;
                            x = "(	60 - 1 * 	5) * (pixelW * pixelGrid * 	0.50)";
                            y = "(pixelH * pixelGrid * 	0.50)";
                            w = "5 * (pixelW * pixelGrid * 	0.50)";
                            h = "5 * (pixelH * pixelGrid * 	0.50)";
                            sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                        };*/

                        class PanelLeftEditBackground: CQC_ctrlStatic {
                            idc = -1;
                            x = 0;
                            y = 0;
                            w = "60 * (pixelW * pixelGrid * 	0.50)";
                            h = "(	5 + 2) * (pixelH * pixelGrid * 	0.50)";
                            sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                            colorBackground[] = {0.2,0.2,0.2,1};
                        };

                        class CollapseAllButton: CQC_ctrlButtonCollapseAll {
                            idc = IDC_DISPLAYADMIN_PANELLEFT_BUTTONCOLLAPSE;
                            x = "(	60 - 2 * 	5) * (pixelW * pixelGrid * 	0.50)";
                            y = "(pixelH * pixelGrid * 	0.50)";
                            w = "5 * (pixelW * pixelGrid * 	0.50)";
                            h = "5 * (pixelH * pixelGrid * 	0.50)";
                            sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                        };

                        class ExpandAllButton: CQC_ctrlButtonExpandAll {
                            idc = IDC_DISPLAYADMIN_PANELLEFT_BUTTONEXPAND;
                            x = "(	60 - 1 * 	5) * (pixelW * pixelGrid * 	0.50)";
                            y = "(pixelH * pixelGrid * 	0.50)";
                            w = "5 * (pixelW * pixelGrid * 	0.50)";
                            h = "5 * (pixelH * pixelGrid * 	0.50)";
                            sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                        };

                        class SearchEdit: CQC_ctrlEdit {
                            idc = IDC_DISPLAYADMIN_PANELLEFT_EDITSEARCH;
                            x = "1 * (pixelW * pixelGrid * 	0.50)";
                            y = "(pixelH * pixelGrid * 	0.50)";
                            w = "(	60 - 3 * 	5 - 1) * (pixelW * pixelGrid * 	0.50)";
                            h = "5 * (pixelH * pixelGrid * 	0.50)";
                            sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                            colorBackground[] = {0.1,0.1,0.1,1};
                        };

                        class SearchEditButton: CQC_ctrlButtonSearch {
                            idc = IDC_DISPLAYADMIN_PANELLEFT_BUTTONSEARCH;
                            x = "(	60 - 3 * 	5) * (pixelW * pixelGrid * 	0.50)";
                            y = "(pixelH * pixelGrid * 	0.50)";
                            w = "5 * (pixelW * pixelGrid * 	0.50)";
                            h = "5 * (pixelH * pixelGrid * 	0.50)";
                            sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                        };
                    };
                };
                
                class TabLeftBackground: CQC_ctrlStatic {
                    idc = -1;
                    x = 0;
                    y = 0;
                    w = "60 * (pixelW * pixelGrid * 	0.50)";
                    h = "(	5 + 1) * (pixelH * pixelGrid * 	0.50)";
                    colorBackground[] = {0.1,0.1,0.1,1};
                };

                class TabLeftSections: CQC_ctrlToolbox {
                    idc = -1;
                    strings[] = {"Players"};
                    x = "(	5 + 1) * (pixelW * pixelGrid * 	0.50)";
                    y = "(pixelH * pixelGrid * 	0.50)";
                    w = "(	60 - 	(	5 + 1) - 1) * (pixelW * pixelGrid * 	0.50)";
                    h = "5 * (pixelH * pixelGrid * 	0.50)";
                };

                class TabLeftToggle: CQC_ctrlButton {
                    idc = IDC_DISPLAYADMIN_PANELLEFT_TOGGLEOFF;
                    text = "«";
                    x = 0;
                    y = 0;
                    w = "(	5 + 1) * (pixelW * pixelGrid * 	0.50)";
                    h = "(	5 + 1) * (pixelH * pixelGrid * 	0.50)";
                    sizeEx = "5.58 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                    colorBackground[] = {0.1,0.1,0.1,1};
                };
            };
        };

        class CameraTypes: CQC_ctrlControlsGroupNoScrollbars {
            idc = IDC_DISPLAYADMIN_CAMERABAR;
            style = 16;
            x = "15.5 * ( ((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2)) / 2)";
            y = "safezoneY + safezoneH - 2.38 * ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 19)";
            w = "8.6 * ( ((safezoneW / safezoneH) min 1.2) / 40)";
            h = 2.6;
            class controls {
                class CameraTypesBackground: CQC_ctrlStatic {
                    idc = -1;
                    x = "0.6 * ( ((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "0.4 * ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "7.5 * 	( ((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "2 * ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    sSizeEx = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
                    colorBackground[] = {0.2,0.2,0.2,1};
                };

                class Fps: CQC_ctrlButton {
                    idc = IDC_DISPLAYADMIN_CAMERABAR_BUTTONFPS;
                    text = "A3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\FpsSelected.paa";
                    tooltip = "First Person Camera";
                    style = 48;
                    x = "5.8 * ( ((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "0.8 * ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "1.63 * ( ((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1.37 * ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    sizeEx = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
                    colorBackground[] = {0,0,0,0};
                };

                class Follow: CQC_ctrlButton {
                    idc = IDC_DISPLAYADMIN_CAMERABAR_BUTTONFOLLOW;
                    tooltip = "Follow Camera";
                    text = "A3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\FollowSelected.paa";
                    style = 48;
                    x = "3.6 * ( ((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "0.8 * ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "1.63 * ( ((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1.37 * ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    sizeEx = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
                    colorBackground[] = {0,0,0,0};
                };

                class Free: CQC_ctrlButton {
                    idc = IDC_DISPLAYADMIN_CAMERABAR_BUTTONFREE;
                    text = "A3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\Free.paa";
                    tooltip = "Free Camera";
                    style = 48;
                    x = "1.3 * ( ((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "0.8 * ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "1.63 * ( ((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1.37 * ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    sizeEx = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
                    colorBackground[] = {0,0,0,0};
                };
            };
        };
        
        class StatusBar: CQC_ctrlControlsGroupNoScrollbars {
            idc = -1;
            style = 16;
            x = "safezoneX";
            y = "safezoneY + safezoneH - 		4 * (pixelH * pixelGrid * 	0.50)";
            w = "safezoneW";
            h = "(		4 + 1) * (pixelH * pixelGrid * 	0.50)";
            class controls {
                class StatusBarBackground: CQC_ctrlStatic {
                    idc = -1;
                    x = 0;
                    y = 0;
                    w = "safezoneW";
                    h = "(		4 + 1) * (pixelH * pixelGrid * 	0.50)";
                    sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                    colorBackground[] = {0.2,0.2,0.2,1};
                };

                class TextX: CQC_ctrlStaticPicture {
                    idc = -1;
                    text = "\a3\3DEN\Data\Displays\Display3DEN\StatusBar\x_ca.paa";
                    x = 0;
                    y = "(2 * pixelH)";
                    w = "3 * (pixelW * pixelGrid * 	0.50)";
                    h = "3 * (pixelH * pixelGrid * 	0.50)";
                    sizeEx = "2.88 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                };

                class TextY: TextX {
                    idc = -1;
                    text = "\a3\3DEN\Data\Displays\Display3DEN\StatusBar\y_ca.paa";
                    x = "(	3 + 	16 + 	4) * (pixelW * pixelGrid * 	0.50)";
                    y = "(2 * pixelH)";
                    w = "3 * (pixelW * pixelGrid * 	0.50)";
                    h = "3 * (pixelH * pixelGrid * 	0.50)";
                    sizeEx = "2.88 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                };

                class TextZ: TextX {
                    idc = -1;
                    text = "\a3\3DEN\Data\Displays\Display3DEN\StatusBar\z_ca.paa";
                    x = "2 * (	3 + 	16 + 	4) * (pixelW * pixelGrid * 	0.50)";
                    y = "(2 * pixelH)";
                    w = "3 * (pixelW * pixelGrid * 	0.50)";
                    h = "3 * (pixelH * pixelGrid * 	0.50)";
                    sizeEx = "2.88 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                };

                class TextHealth: TextX {
                    idc = -1;
                    text = "\a3\3DEN\Data\CfgWaypoints\support_ca.paa";
                    x = "3 * (	3 + 	16 + 	4) * (pixelW * pixelGrid * 	0.50)";
                    y = "(2 * pixelH)";
                    w = "3 * (pixelW * pixelGrid * 	0.50)";
                    h = "3 * (pixelH * pixelGrid * 	0.50)";
                    sizeEx = "2.88 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                };

                class TextGameCP: TextX {
                    idc = -1;
                    onLoad = "_this param [0, controlNull, [controlNull]] ctrlSetText (getMissionPath 'GUI\data\displays\displayAdmin\g_off_ca.paa')";
                    x = "4 * (	3 + 	16 + 	4) * (pixelW * pixelGrid * 	0.50)";
                    y = "(2 * pixelH)";
                    w = "3 * (pixelW * pixelGrid * 	0.50)";
                    h = "3 * (pixelH * pixelGrid * 	0.50)";
                    sizeEx = "2.88 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                };

                class ValueX: CQC_ctrlEdit {
                    idc = IDC_DISPLAYADMIN_STATUSBAR_EDITXPOS;
                    text = "";
                    font = "LucidaConsoleB";
                    style = "0x01 + 0x200";
                    canModify = 0;
                    x = "3 * (pixelW * pixelGrid * 	0.50)";
                    y = "(2 * pixelH)";
                    w = "16 * (pixelW * pixelGrid * 	0.50)";
                    h = "4 * (pixelH * pixelGrid * 	0.50) - 2 * (2 * pixelH)";
                    sizeEx = "2.945 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                    colorText[] = {0.5,0.5,0.5,1};
                    colorBackground[] = {0.1,0.1,0.1,1};
                };

                class ValueY: ValueX {
                    idc = IDC_DISPLAYADMIN_STATUSBAR_EDITYPOS;
                    text = "";
                    x = "((	3 + 	16 + 	4) + 	3) * (pixelW * pixelGrid * 	0.50)";
                    y = "(2 * pixelH)";
                    w = "16 * (pixelW * pixelGrid * 	0.50)";
                    h = "4 * (pixelH * pixelGrid * 	0.50) - 2 * (2 * pixelH)";
                    sizeEx = "2.945 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                };

                class ValueZ: ValueX {
                    idc = IDC_DISPLAYADMIN_STATUSBAR_EDITZPOS;
                    text = "";
                    x = "(2 * (	3 + 	16 + 	4) + 	3) * (pixelW * pixelGrid * 	0.50)";
                    y = "(2 * pixelH)";
                    w = "16 * (pixelW * pixelGrid * 	0.50)";
                    h = "4 * (pixelH * pixelGrid * 	0.50) - 2 * (2 * pixelH)";
                    sizeEx = "2.945 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                };

                class ValueHealth: ValueX {
                    idc = IDC_DISPLAYADMIN_STATUSBAR_EDITHEALTH;
                    text = "";
                    x = "(3 * (	3 + 	16 + 	4) + 	3) * (pixelW * pixelGrid * 	0.50)";
                    y = "(2 * pixelH)";
                    w = "16 * (pixelW * pixelGrid * 	0.50)";
                    h = "4 * (pixelH * pixelGrid * 	0.50) - 2 * (2 * pixelH)";
                    sizeEx = "2.945 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                };

                class ValueGameCP: CQC_ctrlStructuredText {
                    idc = IDC_DISPLAYADMIN_STATUSBAR_LINKGAMECP;
                    text = "";
                    x = "(4 * (	3 + 	16 + 	4) + 	3) * (pixelW * pixelGrid * 	0.50)";
                    y = "(2 * pixelH)";
                    w = "23 * (pixelW * pixelGrid * 	0.50)";
                    h = "4 * (pixelH * pixelGrid * 	0.50) - 2 * (2 * pixelH)";
                    sizeEx = "2.945 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
                    colorBackground[] = {0.1,0.1,0.1,1};
                };
            };
        };

        class TabLeftToggle: CQC_ctrlButton {
            idc = IDC_DISPLAYADMIN_PANELLEFT_TOGGLEON;
            text = "»";
            show = 0;
            x = "safezoneX + 0";
            y = "safezoneY + (	5 + 2) * (pixelH * pixelGrid * 	0.50)";
            w = "(	5 + 1) * (pixelW * pixelGrid * 	0.50)";
            h = "(	5 + 1) * (pixelH * pixelGrid * 	0.50)";
            sizeEx = "5.58 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
            colorBackground[] = {0.1,0.1,0.1,1};
        };
    };
};
