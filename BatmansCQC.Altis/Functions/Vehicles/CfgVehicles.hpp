/*
 File: CfgVehicles.hpp
 Author: FragS
 Description: Configs containing vehicles for arenas and vehicle textures.
*/

class CfgVehicles 
{
    class MenuClasses
    {
        class All
        {
            displayName = "Normal";
            vehicles[]       = {
            "O_MRAP_02_F",
            "B_MRAP_01_F",
            "I_MRAP_03_F",
            "O_T_LSV_02_unarmed_F",
            "B_T_LSV_01_unarmed_F",
            "C_Van_01_box_F",
            "C_SUV_01_F",
            "C_Hatchback_01_sport_F",
            "C_Tractor_01_F",
            "C_Offroad_01_comms_F",
            "C_Van_02_transport_F",
            "C_Kart_01_Blu_F",
            "B_CTRG_LSV_01_light_F",
            "O_LSV_02_unarmed_F",
            "I_C_Offroad_02_unarmed_F",
            "B_G_Van_02_transport_F",
            "B_G_Van_02_vehicle_F",
            "B_Quadbike_01_F"
            };
        };

        class MRAP
        {
            displayName = "MRAPs Only";
            vehicles[]       = {
            "O_MRAP_02_F", 
            "B_MRAP_01_F", 
            "I_MRAP_03_F"
            };
        };

        class LSV
        {
            displayName = "LSVs Only";
            vehicles[]       = {
            "O_T_LSV_02_unarmed_F",
            "B_T_LSV_01_unarmed_F"
            };
        };

        class MRAP_LSV
        {
            displayName = "MRAPs & LSVs";
            vehicles[]       = {
            "O_MRAP_02_F", 
            "B_MRAP_01_F", 
            "I_MRAP_03_F",
            "O_T_LSV_02_unarmed_F",
            "B_T_LSV_01_unarmed_F"
            };
        };

        class Air
        {
            displayName = "";
            vehicles[]       = {
            "B_Heli_Light_01_F", 
            "B_Heli_Light_01_dynamicLoadout_F", 
            "I_C_Heli_Light_01_civil_F",
            "O_Heli_Light_02_dynamicLoadout_F",
            "O_Heli_Light_02_unarmed_F",
            "B_Heli_Attack_01_dynamicLoadout_F",
            "O_Heli_Attack_02_dynamicLoadout_F",
            "B_Heli_Transport_01_F",
            "I_Heli_Transport_02_F",
            "I_Plane_Fighter_03_CAS_F",
            "I_Heli_light_03_dynamicLoadout_F",
            "I_Heli_light_03_unarmed_F",
            "B_Plane_CAS_01_dynamicLoadout_F",
            "O_Plane_CAS_02_dynamicLoadout_F",
            "B_Heli_Transport_03_F",
            "B_Heli_Transport_03_unarmed_F",
            "O_Heli_Transport_04_F",
            "O_Heli_Transport_04_ammo_F",
            "O_Heli_Transport_04_bench_F",
            "O_Heli_Transport_04_box_F",
            "O_Heli_Transport_04_covered_F",
            "O_Heli_Transport_04_fuel_F",
            "O_Heli_Transport_04_medevac_F",
            "O_Heli_Transport_04_repair_F",
            "C_Plane_Civil_01_F",
            "C_Plane_Civil_01_racing_F",
            "B_T_VTOL_01_infantry_F",
            "B_T_VTOL_01_vehicle_F",
            "B_T_VTOL_01_armed_F",
            "O_T_VTOL_02_infantry_dynamicLoadout_F",
            "O_T_VTOL_02_vehicle_dynamicLoadout_F",
            "B_Plane_Fighter_01_F",
            "B_Plane_Fighter_01_Stealth_F",
            "O_Plane_Fighter_02_F",
            "O_Plane_Fighter_02_Stealth_F",
            "I_Plane_Fighter_04_F",
            "I_E_Heli_light_03_dynamicLoadout_F",
            "I_E_Heli_light_03_unarmed_F"
            };
        };

        class Tank
        {
            displayName = "";
            vehicles[]       = {
            "B_APC_Tracked_01_rcws_F", 
            "B_APC_Tracked_01_AA_F", 
            "O_APC_Tracked_02_cannon_F",
            "O_APC_Tracked_02_AA_F",
            "B_MBT_01_cannon_F",
            "O_MBT_02_cannon_F",
            "B_APC_Wheeled_01_cannon_F",
            "O_APC_Wheeled_02_rcws_F",
            "I_APC_tracked_03_cannon_F",
            "I_MBT_03_cannon_F",
            "B_MBT_01_TUSK_F",
            "I_APC_Wheeled_03_cannon_F",
            "B_T_APC_Tracked_01_AA_F",
            "B_T_APC_Tracked_01_rcws_F",
            "O_APC_Tracked_02_cannon_F",
            "O_T_APC_Tracked_02_AA_ghex_F",
            "B_APC_Wheeled_01_cannon_F",
            "O_APC_Wheeled_02_rcws_v2_F",
            "B_T_MBT_01_cannon_F",
            "B_T_MBT_01_TUSK_F",
            "O_T_MBT_02_cannon_ghex_F",
            "B_AFV_Wheeled_01_cannon_F",
            "B_T_AFV_Wheeled_01_cannon_F",
            "B_AFV_Wheeled_01_up_cannon_F",
            "B_T_AFV_Wheeled_01_up_cannon_F",
            "I_LT_01_AT_F",
            "I_LT_01_scout_F",
            "I_LT_01_AA_F",
            "I_LT_01_cannon_F",
            "O_MBT_04_cannon_F",
            "O_T_MBT_04_cannon_F",
            "O_MBT_04_command_F",
            "O_T_MBT_04_command_F",
            "I_E_APC_tracked_03_cannon_F"
            };
        };

        class None
        {
            displayName = "None";
            vehicles[]       = {};
        };
    };

    class Vehicles
    {
        class O_MRAP_02_F
        {
            damageReduction = 0;
            templates[] = {"Chrome_Blue","Chrome_Red","Chrome_Green","Chrome_LightBlue","Chrome_Turquoise"};
        };
        
        class B_MRAP_01_F
        {
            damageReduction = 0.50;
            templates[] = {"Chrome_Blue","Chrome_Red","Chrome_Green","Chrome_LightBlue","Chrome_Turquoise"};
        };
        
        class I_MRAP_03_F
        {
            damageReduction = 0.50;
            templates[] = {"Chrome_Blue","Chrome_Red","Chrome_Green","Chrome_LightBlue","Chrome_Turquoise"};
        };
        
        class O_T_LSV_02_unarmed_F
        {
            damageReduction = 0;
            templates[] = {"Chrome_Blue","Chrome_Red","Chrome_Green","Chrome_LightBlue","Chrome_Turquoise"};
        };
        
        class B_T_LSV_01_unarmed_F
        {
            damageReduction = 0;
            templates[] = {"Chrome_Blue","Chrome_Red","Chrome_Green","Chrome_LightBlue","Chrome_Turquoise"};
        };
        
        class C_Van_01_box_F
        {
            damageReduction = 0;
            templates[] = {};
        };
        
        class C_SUV_01_F
        {
            damageReduction = 0;
            templates[] = {};
        };
        
        class C_Hatchback_01_sport_F
        {
            damageReduction = 0;
            templates[] = {};
        };
        
        class C_Tractor_01_F
        {
            damageReduction = 0;
            templates[] = {};
        };
        
        class C_Offroad_01_comms_F
        {
            damageReduction = 0;
            templates[] = {};
        };
        
        class C_Van_02_transport_F
        {
            damageReduction = 0;
            templates[] = {};
        };
        
        class C_Kart_01_Blu_F
        {
            damageReduction = 0;
            templates[] = {};
        };
        
        class B_CTRG_LSV_01_light_F
        {
            damageReduction = 0;
            templates[] = {};
        };
        
        class O_LSV_02_unarmed_F
        {
            damageReduction = 0;
            templates[] = {};
        };
        
        class I_C_Offroad_02_unarmed_F
        {
            damageReduction = 0;
            templates[] = {};
        };
        
        class B_G_Van_02_transport_F
        {
            damageReduction = 0;
            templates[] = {};
        };
        
        class B_G_Van_02_vehicle_F
        {
            damageReduction = 0;
            templates[] = {};
        };
        
        class B_Quadbike_01_F
        {
            damageReduction = 0;
            templates[] = {};
        };
    };

    class Templates
    {
        class Glow_Blue
        {
            displayName = "Glow Blue";
            textures[] = {"#(argb,8,8,3)color(0,0,0,1)","#(argb,8,8,3)color(0,0,0,1)"};
            materials[] = {"Data\Vehicles\Materials\Glow_Blue.rvmat",""};
        };

        class Glow_Orange
        {
            displayName = "Glow Orange";
            textures[] = {"#(argb,8,8,3)color(0,0,0,1)","#(argb,8,8,3)color(0,0,0,1)"};
            materials[] = {"Data\Vehicles\Materials\Glow_Orange.rvmat",""};
        };

        class Glow_Green
        {
            displayName = "Glow Green";
            textures[] = {"#(argb,8,8,3)color(0,0,0,1)","#(argb,8,8,3)color(0,0,0,1)"};
            materials[] = {"Data\Vehicles\Materials\Glow_Green.rvmat",""};
        };

        class Glow_Red
        {
            displayName = "Glow Red";
            textures[] = {"#(argb,8,8,3)color(0,0,0,1)","#(argb,8,8,3)color(0,0,0,1)"};
            materials[] = {"Data\Vehicles\Materials\Glow_Red.rvmat",""};
        };

        class Glow_Cyan
        {
            displayName = "Glow Cyan";
            textures[] = {"#(argb,8,8,3)color(0,0,0,1)","#(argb,8,8,3)color(0,0,0,1)"};
            materials[] = {"Data\Vehicles\Materials\Glow_Cyan.rvmat",""};
        };
    };
};