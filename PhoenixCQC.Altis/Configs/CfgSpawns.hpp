/*
 File: CfgSpawns.hpp
 Author: FragS
 Description: Config containing the parameters for each arena.
*/

class CfgSpawns
{
    class Spawns
    {    
        class Regular
        {
            class MRAP_Arena
            {
                name                = "MRAP Arena";
                spawnMarker         = "CM_mrap";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 15;
                spawnDistance       = 10;
                spawnProtection     = 1;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "mrap_1",
                    "mrap_2",
                    "mrap_3",
                    "mrap_4",
                    "mrap_5",
                    "mrap_6",
                    "mrap_7",
                    "mrap_8",
                    "mrap_9",
                    "mrap_10"
                };
                vehicles            = "MRAP";
                weapons             = "Standard";
                forceLoadout      = "";
            };

            class Construction
            {
                name                = "Construction Site";
                spawnMarker         = "CM_construction";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 12;
                spawnDistance       = 10;
                spawnProtection     = 1;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "construction_1",
                    "construction_2",
                    "construction_3",
                    "construction_4",
                    "construction_5",
                    "construction_6",
                    "construction_7",
                    "construction_8"
                };
                vehicles            = "MRAP";
                weapons             = "Standard";
                forceLoadout      = "";
            };

            class Abandoned
            {
                name                = "Abandoned";
                spawnMarker         = "CM_abandoned";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 12;
                spawnDistance       = 10;
                spawnProtection     = 1;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "abandoned_1",
                    "abandoned_2",
                    "abandoned_3",
                    "abandoned_4",
                    "abandoned_5",
                    "abandoned_6",
                    "abandoned_7"
                };
                vehicles            = "MRAP";
                weapons             = "Standard";
                forceLoadout      = "";
            };

            class Lumberyard
            {
                name                = "Lumberyard";
                spawnMarker         = "CM_lumberyard";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 20;
                spawnDistance       = 10;
                spawnProtection     = 1;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "lumberyard_1",
                    "lumberyard_2",
                    "lumberyard_3",
                    "lumberyard_4",
                    "lumberyard_5",
                    "lumberyard_6",
                    "lumberyard_7",
                    "lumberyard_8",
                    "lumberyard_9",
                    "lumberyard_10"
                };
                vehicles            = "MRAP_LSV";
                weapons             = "Increased";
                forceLoadout      = "";
            };

            class WW2
            {
                name                = "WW2";
                spawnMarker         = "CM_ww2";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 10;
                spawnDistance       = 10;
                spawnProtection     = 0;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "ww2_1",
                    "ww2_2",
                    "ww2_3",
                    "ww2_4",
                    "ww2_5"
                };
                vehicles            = "None";
                weapons             = "Standard";
                forceLoadout      = "";
            };

            class Storage_Depot
            {
                name                = "Storage Depot";
                spawnMarker         = "CM_storage";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 15;
                spawnDistance       = 10;
                spawnProtection     = 0;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "storage_1",
                    "storage_2",
                    "storage_3",
                    "storage_4",
                    "storage_5",
                    "storage_6",
                    "storage_7",
                    "storage_8",
                    "storage_9",
                    "storage_10",
                    "storage_11",
                    "storage_12",
                    "storage_13",
                    "storage_14",
                    "storage_15"
                };
                vehicles            = "All";
                weapons             = "Standard";
                forceLoadout        = "";
            };

            class OG
            {
                name                = "OG Arms";
                spawnMarker         = "CM_og";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 10;
                spawnDistance       = 10;
                spawnProtection     = 0;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "og_1",
                    "og_2",
                    "og_3",
                    "og_4",
                    "og_5",
                    "og_6",
                    "og_7",
                    "og_8",
                    "og_9"
                };
                vehicles            = "All";
                weapons             = "Standard";
                forceLoadout        = "";
            };

            class Pawnee
            {
                name                = "Pawnee Arena";
                spawnMarker         = "CM_pawn";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 15;
                spawnDistance       = 20;
                spawnProtection     = 0;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "pa_1",
                    "pa_2",
                    "pa_3",
                    "pa_4",
                    "pa_5",
                    "pa_6",
                    "pa_7",
                    "pa_8",
                    "pa_9",
                    "pa_10",
                    "pa_11",
                    "pa_12",
                    "pa_13",
                    "pa_14"
                };
                vehicles            = "None";
                weapons             = "Standard";
                forceLoadout        = "";
            };

            class CQC_Arena
            {
                name                = "CQC Arena";
                spawnMarker         = "CM_cqcarena";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 15;
                spawnDistance       = 15;
                spawnProtection     = 0;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "cqcarena_1",
                    "cqcarena_2",
                    "cqcarena_3",
                    "cqcarena_4",
                    "cqcarena_5",
                    "cqcarena_6",
                    "cqcarena_7",
                    "cqcarena_8",
                    "cqcarena_9",
                    "cqcarena_10",
                    "cqcarena_11",
                    "cqcarena_12",
                    "cqcarena_13",
                    "cqcarena_14",
                    "cqcarena_15"
                };
                vehicles            = "None";
                weapons             = "Standard";
                forceLoadout        = "";
            };

            class Gang_Base
            {
                name                = "Naval Gang Base";
                spawnMarker         = "CM_navalgb";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 10;
                spawnDistance       = 20;
                spawnProtection     = 0;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "navalgb_1",
                    "navalgb_2",
                    "navalgb_3",
                    "navalgb_4",
                    "navalgb_5",
                    "navalgb_6",
                    "navalgb_7",
                    "navalgb_8"
                };
                vehicles            = "None";
                weapons             = "Standard";
                forceLoadout        = "";
            };

            class Nuke_Town
            {
                name                = "Nuke Town";
                spawnMarker         = "CM_nuketown";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 8;
                spawnDistance       = 10;
                spawnProtection     = 0;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "nuke_1",
                    "nuke_2",
                    "nuke_3",
                    "nuke_4",
                    "nuke_5",
                    "nuke_6",
                    "nuke_7",
                    "nuke_8",
                    "nuke_9",
                    "nuke_10",
                    "nuke_11",
                    "nuke_12"
                };
                vehicles            = "None";
                weapons             = "Standard";
                forceLoadout        = "";
            };

            class church
            {
                name                = "Church";
                spawnMarker         = "CM_church";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 10;
                spawnDistance       = 10;
                spawnProtection     = 0;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "church_1",
                    "church_2",
                    "church_3",
                    "church_4",
                    "church_5",
                    "church_6",
                    "church_7"
                };
                vehicles            = "All";
                weapons             = "Standard";
                forceLoadout        = "";
            };
            
            class gypsy_Camp
            {
                name                = "Gypsy Camp";
                spawnMarker         = "CM_gypsy";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 15;
                spawnDistance       = 10;
                spawnProtection     = 0;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "gypsy_1",
                    "gypsy_2",
                    "gypsy_3",
                    "gypsy_4",
                    "gypsy_5",
                    "gypsy_6",
                    "gypsy_7",
                    "gypsy_8",
                    "gypsy_9",
                    "gypsy_10",
                    "gypsy_11",
                    "gypsy_12",
                    "gypsy_13",
                    "gypsy_14",
                    "gypsy_15"
                };
                vehicles             = "All";
                weapons              = "Standard";
                forceLoadout         = "";
            };

            class Royal_Mint
            {
                name                = "Royal Mint";
                spawnMarker         = "CM_mint";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 15;
                spawnDistance       = 20;
                spawnProtection     = 0;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "mint_1",
                    "mint_2",
                    "mint_3",
                    "mint_4",
                    "mint_5",
                    "mint_6",
                    "mint_7",
                    "mint_8",
                    "mint_9",
                    "mint_10",
                    "mint_11",
                    "mint_12",
                    "mint_13",
                    "mint_14",
                    "mint_15"
                };
                vehicles            = "All";
                weapons             = "Increased";
                forceLoadout        = "";
            };

            class military_Base
            {
                name                = "Military Base";
                spawnMarker         = "CM_milbase";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 10;
                spawnDistance       = 15;
                spawnProtection     = 0;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "milbase_1",
                    "milbase_2",
                    "milbase_3",
                    "milbase_4",
                    "milbase_5",
                    "milbase_6",
                    "milbase_7",
                    "milbase_8"
                };
                vehicles            = "All";
                weapons             = "Standard";
                forceLoadout        = "";
            };

            class neo
            {
                name                = "Neochori";
                spawnMarker         = "CM_neo";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 15;
                spawnDistance       = 15;
                spawnProtection     = 0;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "neo_1",
                    "neo_2",
                    "neo_3",
                    "neo_4",
                    "neo_5",
                    "neo_6",
                    "neo_7",
                    "neo_8"
                };
                vehicles            = "None";
                weapons             = "Standard";
                forceLoadout        = "";
            };

            class Kavala_Square
            {
                name                = "Kavala Square";
                spawnMarker         = "CM_kavala";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 50;
                spawnDistance       = 15;
                spawnProtection     = 0;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "kav_1",
                    "kav_2",
                    "kav_3",
                    "kav_4",
                    "kav_5",
                    "kav_6",
                    "kav_7",
                    "kav_8",
                    "kav_9",
                    "kav_10",
                    "kav_11",
                    "kav_12",
                    "kav_13",
                    "kav_14",
                    "kav_15"
                };
                vehicles            = "All";
                weapons             = "Rook Only";
                forceLoadout        = "Rook";
            };

            class Kalithea_Dealer
            {
                name                = "Kalithea Drug Dealer";
                spawnMarker         = "CM_kalithea";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 10;
                spawnDistance       = 10;
                spawnProtection     = 0;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "Kalithea_1",
                    "Kalithea_2",
                    "Kalithea_3",
                    "Kalithea_4",
                    "Kalithea_5",
                    "Kalithea_6",
                    "Kalithea_7",
                    "Kalithea_8",
                    "Kalithea_9",
                    "Kalithea_10",
                    "Kalithea_11",
                    "Kalithea_12",
                    "Kalithea_13",
                    "Kalithea_14",
                    "Kalithea_15"
                };
                vehicles            = "None";
                weapons             = "Standard";
                forceLoadout        = "";
            };

            class Airport
            {
                name                = "Airport";
                spawnMarker         = "CM_airport";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 10;
                spawnDistance       = 20;
                spawnProtection     = 1;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "airport_1",
                    "airport_2",
                    "airport_3",
                    "airport_4",
                    "airport_5",
                    "airport_6",
                    "airport_7",
                    "airport_8",
                    "airport_9",
                    "airport_10",
                    "airport_11",
                    "airport_12",
                    "airport_13",
                    "airport_14",
                    "airport_15"
                };
                vehicles            = "All";
                weapons             = "Increased";
                forceLoadout        = "";
            };

            class USS_Swamp
            {
                name                = "USS Swamp";
                spawnMarker         = "CM_swamp";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 10;
                spawnDistance       = 10;
                spawnProtection     = 0;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "swamp_1",
                    "swamp_2",
                    "swamp_3",
                    "swamp_4",
                    "swamp_5",
                    "swamp_6",
                    "swamp_7",
                    "swamp_8",
                    "swamp_9",
                    "swamp_10",
                    "swamp_11",
                    "swamp_12",
                    "swamp_13",
                    "swamp_14",
                    "swamp_15"
                };
                vehicles            = "All";
                weapons             = "Standard";
                forceLoadout        = "";
            };

            class Camp_Katheeri
            {
                name                = "Camp Katheeri";
                spawnMarker         = "CM_slamzone";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 15;
                spawnDistance       = 15;
                spawnProtection     = 0;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "slamzone_1",
                    "slamzone_2",
                    "slamzone_3",
                    "slamzone_4",
                    "slamzone_5",
                    "slamzone_6",
                    "slamzone_7",
                    "slamzone_8",
                    "slamzone_9",
                    "slamzone_10",
                    "slamzone_11",
                    "slamzone_12",
                    "slamzone_13",
                    "slamzone_14",
                    "slamzone_15"
                };
                vehicles            = "None";
                weapons             = "Standard";
                forceLoadout        = "";
            };

            class AirTank
            {
                name                = "Air & Tank";
                spawnMarker         = "CM_airtank";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 50;
                spawnDistance       = 100;
                spawnProtection     = 1;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "airtank_1",
                    "airtank_2",
                    "airtank_3",
                    "airtank_4",
                    "airtank_5",
                    "airtank_6",
                    "airtank_7",
                    "airtank_8",
                    "airtank_9",
                    "airtank_10",
                    "airtank_11",
                    "airtank_12",
                    "airtank_13",
                    "airtank_14",
                    "airtank_15",
                    "airtank_16",
                    "airtank_17",
                    "airtank_18",
                    "airtank_19",
                    "airtank_20"
                };
                vehicles          = "All";
                weapons           = "Increased";
                forceLoadout      = "";
            };
        };
        
        class vsarena
        {
            class 1v1
            {
                name                = "1v1 Arena #1";
                spawnMarker         = "CM_vs";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 2;
                spawnDistance       = 8;
                spawnProtection     = 0;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "vs_1",
                    "vs_2"
                };
                vehicles            = "None";
                weapons             = "Standard";
                forceLoadout        = "";
            };

            class 1v1_2
            {
                name                = "1v1 Arena #2";
                spawnMarker         = "CM_vs_1";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 2;
                spawnDistance       = 8;
                spawnProtection     = 0;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "vs_3",
                    "vs_4"
                };
                vehicles            = "None";
                weapons             = "Standard";
                forceLoadout        = "";
            };

            class 1v1_3
            {
                name                = "1v1 Arena #3";
                spawnMarker         = "CM_vs_2";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 2;
                spawnDistance       = 8;
                spawnProtection     = 0;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "vs_5",
                    "vs_6"
                };
                vehicles            = "None";
                weapons             = "Standard";
                forceLoadout        = "";
            };

            class 1v1_4
            {
                name                = "1v1 Arena #4";
                spawnMarker         = "CM_vs_3";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 2;
                spawnDistance       = 8;
                spawnProtection     = 0;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "vs_7",
                    "vs_8"
                };
                vehicles            = "None";
                weapons             = "Standard";
                forceLoadout        = "";
            };

            class 1v1_5
            {
                name                = "1v1 Arena #5";
                spawnMarker         = "CM_vs_4";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 2;
                spawnDistance       = 8;
                spawnProtection     = 0;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "vs_9",
                    "vs_10"
                };
                vehicles            = "None";
                weapons             = "Standard";
                forceLoadout        = "";
            };

            class 1v1_6
            {
                name                = "1v1 Arena #6";
                spawnMarker         = "CM_vs_5";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 2;
                spawnDistance       = 8;
                spawnProtection     = 0;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "vs_11",
                    "vs_12"
                };
                vehicles            = "None";
                weapons             = "Standard";
                forceLoadout        = "";
            };

            class 1v1_7
            {
                name                = "1v1 Arena #7";
                spawnMarker         = "CM_vs_6";
                icon                = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers          = 2;
                spawnDistance       = 8;
                spawnProtection     = 0;
                allowedSmokes       = 0;
                condition           = "";
                markers[]           = {
                    "vs_13",
                    "vs_14"
                };
                vehicles            = "None";
                weapons             = "Standard";
                forceLoadout        = "";
            };
        };
    };
};