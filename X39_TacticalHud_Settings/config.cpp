class CfgPatches{
	class X39_TacticalHud_Settings{
         units[] = {};
         weapons[] = {};
         requiredVersion = 1.0;
         requiredAddons[] = {};
         author = "X39|Cpt. HM Murdock";
         mail = "killerx29@gmail.com";
	};
};
class CfgSettings {
	class X39 {
		#include "\userconfig\X39\TacticalHud_UserConfig.hpp"
	};
};