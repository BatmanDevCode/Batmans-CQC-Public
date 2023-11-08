///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Positioning Macros
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define pixelScale	0.50

#define GRID_W (pixelW * pixelGrid * pixelScale)
#define GRID_H (pixelH * pixelGrid * pixelScale)

#define CENTER_X	((getResolution select 2) * 0.5 * pixelW)
#define CENTER_Y	((getResolution select 3) * 0.5 * pixelH)

// 720px
#define WINDOW_W	120
#define WINDOW_H	180
#define WINDOW_HAbs (safezoneH min (WINDOW_H * GRID_H))

#define WINDOW_PREVIEW_W	WINDOW_W
#define WINDOW_PREVIEW_H	65
#define WINDOW_PREVIEW_HAbs	(safezoneH min (WINDOW_PREVIEW_H * GRID_H))

#define ATTRIBUTE_TITLE_W	48
#define ATTRIBUTE_CONTENT_W	82
#define ATTRIBUTE_CONTENT_H	5


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Fonts
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define FONT_RC_LIGHT		"RobotoCondensedLight"
#define FONT_RC_NORMAL		"RobotoCondensed"
#define FONT_RC_BOLD		"RobotoCondensedBold"
#define FONT_P_MEDIUM	    "PuristaMedium"
#define FONT_P_BOLD			"PuristaSemiBold"
#define FONT_P_LIGHT		"PuristaLight"
#define FONT_MONO			"EtelkaMonospacePro"
#define FONT_NARROW			"EtelkaNarrowMediumPro"
#define FONT_CODE			"LucidaConsoleB"
#define FONT_TB			    "TahomaB"
#define Font_Z              "Zeppelin32"

#define SIZEEX_PURISTA(SIZEPX)		__EVAL([SIZEPX,1.8,[6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,34,35,37,46]] call _fnc_sizeEx)
#define SIZEEX_ETELKA(SIZEPX)		__EVAL([SIZEPX,1.55,[6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,34,35,37,46]] call _fnc_sizeEx)
#define SIZEEX_TAHOMA(SIZEPX)		__EVAL([SIZEPX,1.6,[16]] call _fnc_sizeEx)
#define SIZEEX_LUCIDA(SIZEPX)		__EVAL([SIZEPX,1.6,[8,11]] call _fnc_sizeEx)

#define SIZEEX_XS	3.0
#define SIZEEX_S	4.0
#define SIZEEX_M	4.5
#define SIZEEX_L	5.0
#define SIZEEX_XL	6.0

#define SIZE_XS	3.5
#define SIZE_S	4
#define SIZE_M	5
#define SIZE_L	5
#define SIZE_XL	6

#define TEXT_SMALLEST           "0.01 * safezoneH"
#define TEXT_SMALLER            "0.015 * safezoneH"
#define TEXT_SMALL              "0.018 * safezoneH"
#define TEXT_NORMAL             "0.02 * safezoneH"
#define TEXT_NORMAL1            "0.025 * safezoneH"
#define TEXT_BIG                "0.03 * safezoneH"
#define TEXT_VERYBIG            "0.04 * safezoneH"

#define TEXT_SIZE_HEADER        "0.020 * safezoneH"
#define TEXT_SIZE_SUBHEADER     "0.018 * safezoneH"

#define TEXT_SIZE_TEXTBOX       "0.0175 * safezoneH"

// Block Sizes
#define SIZE_BLOCK_HEADER 0.033 * safezoneH
#define SIZE_BLOCK_HEADER2 0.022 * safezoneH

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Control Types
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_MENU             46 // Arma 3 (EDEN)
#define CT_MENU_STRIP       47 // Arma 3 (EDEN)
#define CT_CHECKBOX         77 // Arma 3
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_ANIMATED_USER    99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102
#define CT_ITEMSLOT         103

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Static Styles
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0c
#define ST_UPPERCASE      192

#define ST_TYPE           0xF0
#define ST_SINGLE         0
#define ST_MULTI          16
#define ST_TITLE_BAR      32
#define ST_PICTURE        48
#define ST_FRAME          64
#define ST_BACKGROUND     80
#define ST_GROUP_BOX      96
#define ST_GROUP_BOX2     112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE   144 // tileH and tileW params required for tiled image
#define ST_WITH_RECT      160
#define ST_LINE           176

#define ST_SHADOW             0x100
#define ST_NO_RECT            0x200 // This style works for CT_STATIC in conjunction with ST_MULTI
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Progress Bar
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Slider Styles
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           1024
#define SL_TEXTURES       0x10

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Listbox Macros
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

// MessageBox styles
#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Colours
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define COLOUR_MAINBACKGROUND           {0, 0, 0, 0.5}
#define COLOUR_HEADER                   {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "1"}
#define COLOUR_EMPTY                    {0, 0, 0, 0}
#define COLOUR_WHITE                    {1, 1, 1, 1}

#define COLOUR_PROGRESSBAR              {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "1"}
#define COLOUR_PROGRESSBAR_BACKGROUND   {"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])","(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"}

#define COLOUR_AREABACKGROUND           {0.2,   0.2,   0.2,   1}
#define COLOUR_CONTENTTITLE             {0.05,  0.05,  0.05,  1}
#define COLOUR_CONTENTBACKGROUND        {0,     0,     0,     0.5}
#define COLOUR_INPUT                    {0,     0,     0,     0.4}
#define COLOUR_MAIN_PROFILENAMESPACE    {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"}

#define COLOR_NOTE_DEFAULT_RGB          0.12549, 0.505882, 0.313726
#define COLOR_NOTE_DEFAULT_RGBA         COLOR_NOTE_DEFAULT_RGB, 0.9

#define COLOR_NOTE_WARNING_RGB          0.8, 0.35, 0
#define COLOR_NOTE_WARNING_RGBA         COLOR_NOTE_WARNING_RGB, 0.9

#define COLOR_NOTE_ERROR_RGB            0.815686, 0.266667, 0.215686
#define COLOR_NOTE_ERROR_RGBA           COLOR_NOTE_ERROR_RGB, 0.9

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Button Macros
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#define COLOUR_DEFAULTBUTTON            {0, 0, 0, 1}
#define COLOUR_DEFAULTBUTTONACTIVE      {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])", 1}
#define COLOUR_DEFAULTBUTTONDISABLED    {0, 0, 0, 0.5}

#define COLOUR_CONTENTBUTTON            {0, 0, 0, 1}
#define COLOUR_CONTENTBUTTONACTIVE      {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])", 1}
#define COLOUR_CONTENTBUTTONBLINK       {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1}
#define COLOUR_CONTENTBUTTONDISABLED    {0, 0, 0, 0.5}

#define TEXT_SIZE_CONTENTBUTTON         "0.018 * safezoneH"
#define SIZE_BLOCK_CONTENTBUTTON        "0.0198 * safezoneH"

///////////////////////////////////////////////////////////////
// Scripts
///////////////////////////////////////////////////////////////
#define INIT_DISPLAY_FUNCTION	(uinamespace getvariable 'BIS_fnc_initDisplay')
#define INIT_DISPLAY_INTERNAL	scriptIsInternal = 1;

//--- Code executed on each display where the macro is used. Scripts are pre-compiled at the game start by BIS_fnc_initDisplays
#define INIT_DISPLAY(NAME,PATH) \
	scriptName = ##NAME##;\
	scriptPath = ##PATH##;\
	onLoad = ["onLoad",_this,#NAME,'##PATH##'] call INIT_DISPLAY_FUNCTION; \
	onUnload = ["onUnload",_this,#NAME,'##PATH##'] call INIT_DISPLAY_FUNCTION;

