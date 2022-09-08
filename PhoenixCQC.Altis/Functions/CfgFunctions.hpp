class Functions
{
	tag = "CQC";
	class Actions
	{
		file = "Functions\Actions";
        class addAction {};
		class addPlayerActions {};
		class addVendorActions {};
	};

	class Arsenal
	{
		file = "Functions\Arsenal";
        class createArsenal {};
		class arsenalOverride {};
		class loadInventoryOverride {};
		class restrictGear {};
	};
	
	class Events
	{
		file = "Functions\Events";
        class onAbort {};
		class onAction {};
		class onConnect {};
		class onGetInMan {};
		class onGetOutMan {};
		class onInventoryOpened {};
		class onInventoryClosed {};
		class onInventoryChanged {};
		class onHandleDamage {};
		class onKeyDown {};
		class onKeyUp {};
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class onReloaded {};
		class onMPKilled {};
		class onGameInterrupt {}; 
	};

	class GUI
	{
		file = "Functions\GUI";
		class isDisplayActive {};
		class initDisplay {};
		class initDisplays {preInit = 1;};
		class initPlayerTags {};
		class notificationSystem {};
		class showHUD {};
		class showMessage {};
    };

	class Init
	{
		file = "Functions\Init";
        class initVariables {};
		class initEventHandlers {};
		class initPlayer {};
	};

	class Jump
	{
		file = "Functions\Jump";
        class doAnim {};
		class initJump {};
		class jumpOver {};
	};

	class Progress
	{
		file = "Functions\Progress";
		class startProgress {};
	};
	
	class Units
	{
		file = "Functions\Units";
        class disableUnitFire {};
		class disableUnitFireMessage {};
		class getUnitByName {};
		class getUnitByUID {};
		class healUnit {};
		class holsterUnitWeapon {};
		class moveUnitToArena {};
		class removeUnitLoadout {};
		class returnToSpawn {};
		class setUnitEarplugs {};
		class setUnitLoadout {};
		class setUnitSpawnProtection {};
		class setUnitTextures {};
    };

	class Variables
	{
		file = "Functions\Variables";
		class setConstant {};
    };

	class vehicles
	{
		file = "Functions\Vehicles";
		class canSelectVehicle {};
		class createVehicleCar {};
		class createVehicleAir {};
		class createVehicleTank {};
		class onVehicleHandleDamage {};
    };

	class World
	{
		file = "Functions\World";
		class activeProjectiles {};
        class weather {postInit = 1;};
    };
	
	class General
	{
		file = "Functions";
        class evalStatement {};
    };
};

class LARs_overrideVATemplates
{
	tag = "LARs";
	class Inventory
	{
		file = "Functions\Arsenal\override_VA\functions";
		class initOverride { postInit = 1; };
		class loadInventory_whiteList {};
		class overrideVAButtonDown {};
		class overrideVATemplateOK {};
		class applyLBColors {};
		class showRestrictedItems {};
		class addVAKeyEvents {};
	};
};