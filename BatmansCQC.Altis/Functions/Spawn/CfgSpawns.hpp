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
                name = "MRAP Arena";
                spawnMarker = "CM_mrap";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 15;
                spawnDistance = 10;
                spawnProtection = 1;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
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
                vehicles = "MRAP";
                weapons = "Standard";
                forceLoadout = "";
            };

            class CQ
            {
                name = "Close Quarter";
                spawnMarker = "CM_CQ";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 10;
                spawnDistance = 10;
                spawnProtection = 0;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
                    "CQ_1",
                    "CQ_2",
                    "CQ_3",
                    "CQ_4",
                    "CQ_5",
                    "CQ_6"
                };
                vehicles = "None";
                weapons = "Standard";
                forceLoadout = "";
            };

            class Construction
            {
                name = "Construction Site";
                spawnMarker = "CM_construction";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 12;
                spawnDistance = 10;
                spawnProtection = 1;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
                    "construction_1",
                    "construction_2",
                    "construction_3",
                    "construction_4",
                    "construction_5",
                    "construction_6",
                    "construction_7",
                    "construction_8"
                };
                vehicles = "MRAP";
                weapons = "Standard";
                forceLoadout = "";
            };

            class Abandoned
            {
                name = "Abandoned";
                spawnMarker = "CM_abandoned";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 12;
                spawnDistance = 10;
                spawnProtection = 1;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
                    "abandoned_1",
                    "abandoned_2",
                    "abandoned_3",
                    "abandoned_4",
                    "abandoned_5",
                    "abandoned_6",
                    "abandoned_7"
                };
                vehicles = "MRAP";
                weapons = "Standard";
                forceLoadout = "";
            };

            class Lumberyard
            {
                name = "Lumberyard";
                spawnMarker = "CM_lumberyard";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 20;
                spawnDistance = 10;
                spawnProtection = 1;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
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
                vehicles = "MRAP_LSV";
                weapons = "Increased";
                forceLoadout = "";
            };

            class WW2
            {
                name = "WW2";
                spawnMarker = "CM_ww2";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 10;
                spawnDistance = 10;
                spawnProtection = 0;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
                    "ww2_1",
                    "ww2_2",
                    "ww2_3",
                    "ww2_4",
                    "ww2_5"
                };
                vehicles = "None";
                weapons = "Standard";
                forceLoadout = "";
            };

            class Storage_Depot
            {
                name = "Storage Depot";
                spawnMarker = "CM_storage";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 15;
                spawnDistance = 10;
                spawnProtection = 0;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
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
                vehicles = "All";
                weapons = "Standard";
                forceLoadout = "";
            };

            class OG
            {
                name = "OG Arms";
                spawnMarker = "CM_og";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 10;
                spawnDistance = 10;
                spawnProtection = 0;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
                    "og_1",
                    "og_2",
                    "og_3",
                    "og_4",
                    "og_5",
                    "og_6",
                    "og_7",
                    "og_8",
                    "og_9",
                    "og_10",
                    "og_11",
                    "og_12"
                };
                vehicles = "All";
                weapons = "Standard";
                forceLoadout = "";
            };

            class EXP
            {
                name = "Experimental";
                spawnMarker = "CM_Exp";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 10;
                spawnDistance = 10;
                spawnProtection = 0;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
                    "alecw_experimental_1",
                    "alecw_experimental_2",
                    "alecw_experimental_3",
                    "alecw_experimental_4",
                    "alecw_experimental_5",
                    "alecw_experimental_6",
                    "alecw_experimental_7",
                    "alecw_experimental_8",
                    "alecw_experimental_9",
                    "alecw_experimental_10",
                    "alecw_experimental_11",
                    "alecw_experimental_12",
                    "alecw_experimental_13",
                    "alecw_experimental_14",
                    "alecw_experimental_15",
                    "alecw_experimental_16"

                };
                vehicles = "None";
                weapons = "Standard";
                forceLoadout = "";
            };

            class Pawnee
            {
                name = "Pawnee Arena";
                spawnMarker = "CM_pawn";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 15;
                spawnDistance = 20;
                spawnProtection = 0;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
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
                vehicles = "None";
                weapons = "Standard";
                forceLoadout = "";
            };

            class CQC_Arena
            {
                name = "CQC Arena";
                spawnMarker = "CM_cqcarena";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 15;
                spawnDistance = 15;
                spawnProtection = 0;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
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
                vehicles = "None";
                weapons = "Standard";
                forceLoadout = "";
            };

            class Nuke_Town
            {
                name = "Nuke Town";
                spawnMarker = "CM_nuketown";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 8;
                spawnDistance = 10;
                spawnProtection = 0;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
                    "nuke_1",
                    "nuke_2",
                    "nuke_3",
                    "nuke_4",
                    "nuke_5",
                    "nuke_6"
                };
                vehicles = "None";
                weapons = "Standard";
                forceLoadout = "";
            };

            class church
            {
                name = "Church";
                spawnMarker = "CM_church";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 10;
                spawnDistance = 10;
                spawnProtection = 0;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
                    "church_1",
                    "church_2",
                    "church_3",
                    "church_4",
                    "church_5",
                    "church_6",
                    "church_7"
                };
                vehicles = "All";
                weapons = "Standard";
                forceLoadout = "";
            };

            class military_Base
            {
                name = "Military Base";
                spawnMarker = "CM_milbase";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 10;
                spawnDistance = 15;
                spawnProtection = 0;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
                    "milbase_1",
                    "milbase_2",
                    "milbase_3",
                    "milbase_4",
                    "milbase_5",
                    "milbase_6",
                    "milbase_7",
                    "milbase_8"
                };
                vehicles = "All";
                weapons = "Standard";
                forceLoadout = "";
            };

            class Kavala_Square
            {
                name = "Kavala Square";
                spawnMarker = "CM_kavala";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 50;
                spawnDistance = 15;
                spawnProtection = 0;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
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
                vehicles = "All";
                weapons = "Rook Only";
                forceLoadout = "Rook";
            };

            class Kalithea_Dealer
            {
                name = "Kalithea Drug Dealer";
                spawnMarker = "CM_kalithea";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 10;
                spawnDistance = 10;
                spawnProtection = 0;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
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
                vehicles = "None";
                weapons = "Standard";
                forceLoadout = "";
            };

            class Airport
            {
                name = "Airport";
                spawnMarker = "CM_airport";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 10;
                spawnDistance = 20;
                spawnProtection = 1;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
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
                vehicles = "All";
                weapons = "Increased";
                forceLoadout = "";
            };

            class Camp_Katheeri
            {
                name = "Camp Katheeri";
                spawnMarker = "CM_slamzone";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 15;
                spawnDistance = 15;
                spawnProtection = 0;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
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
                vehicles = "None";
                weapons = "Standard";
                forceLoadout = "";
            };

            class AirTank
            {
                name = "Air & Tank";
                spawnMarker = "CM_airtank";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 50;
                spawnDistance = 100;
                spawnProtection = 1;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
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
                vehicles = "All";
                weapons  = "Increased";
                forceLoadout = "";
            };

            class 1v1
            {
                name = "1v1 Arena #1";
                spawnMarker = "CM_vs";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 2;
                spawnDistance = 8;
                spawnProtection = 0;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
                    "vs_1",
                    "vs_2"
                };
                vehicles = "None";
                weapons = "Standard";
                forceLoadout = "";
            };

            class 1v1_2
            {
                name = "1v1 Arena #2";
                spawnMarker = "CM_vs_1";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 2;
                spawnDistance = 8;
                spawnProtection = 0;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
                    "vs_3",
                    "vs_4"
                };
                vehicles = "None";
                weapons = "Standard";
                forceLoadout = "";
            };

            class 1v1_3
            {
                name = "1v1 Arena #3";
                spawnMarker = "CM_vs_2";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 2;
                spawnDistance = 8;
                spawnProtection = 0;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
                    "vs_5",
                    "vs_6"
                };
                vehicles = "None";
                weapons = "Standard";
                forceLoadout = "";
            };

            class 1v1_4
            {
                name = "1v1 Arena #4";
                spawnMarker = "CM_vs_3";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 2;
                spawnDistance = 8;
                spawnProtection = 0;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
                    "vs_7",
                    "vs_8"
                };
                vehicles = "None";
                weapons = "Standard";
                forceLoadout = "";
            };
        };
        
        class vsarena
        {
            class 1v1
            {
                name = "1v1 Arena #1";
                spawnMarker = "CM_vs";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 2;
                spawnDistance = 8;
                spawnProtection = 0;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
                    "vs_1",
                    "vs_2"
                };
                vehicles = "None";
                weapons = "Standard";
                forceLoadout = "";
            };

            class 1v1_2
            {
                name = "1v1 Arena #2";
                spawnMarker = "CM_vs_1";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 2;
                spawnDistance = 8;
                spawnProtection = 0;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
                    "vs_3",
                    "vs_4"
                };
                vehicles = "None";
                weapons = "Standard";
                forceLoadout = "";
            };

            class 1v1_3
            {
                name = "1v1 Arena #3";
                spawnMarker = "CM_vs_2";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 2;
                spawnDistance = 8;
                spawnProtection = 0;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
                    "vs_5",
                    "vs_6"
                };
                vehicles = "None";
                weapons = "Standard";
                forceLoadout = "";
            };

            class 1v1_4
            {
                name = "1v1 Arena #4";
                spawnMarker = "CM_vs_3";
                icon = "\a3\Missions_F_Gamma\data\img\portraitMPTypeSeize_ca.paa";
                maxPlayers = 2;
                spawnDistance = 8;
                spawnProtection = 0;
                allowedSmokes = 0;
                condition = "";
                markers[] = {
                    "vs_7",
                    "vs_8"
                };
                vehicles = "None";
                weapons = "Standard";
                forceLoadout = "";
            };
        };
    };
};