class CfgPatches{
	class X39_TacticalHud_Items{
         units[] = {};
         weapons[] = {"X39_TacticalHud_AirMissionControlDevice"};
         requiredVersion = 1.0;
         requiredAddons[] = {"X39_TacticalHud_Res"};
         author = "X39|Cpt. HM Murdock";
         mail = "killerx29@gmail.com";
	};
};

class CfgWeapons {
	class ItemGPS;
	#include "items.cpp"
};