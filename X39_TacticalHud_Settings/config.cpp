#include "\X39_XLib_ModProperties\modPropertiesIncludes.hpp"

class CfgPatches{
	class X39_TacticalHud_Settings{
         units[] = {};
         weapons[] = {};
         requiredVersion = 1.0;
         requiredAddons[] = {"X39_XLib_ModProperties"};
         author = "X39|Cpt. HM Murdock";
         mail = "killerx29@gmail.com";
	};
};

class XLib {
	class modProperties {
		class propertyBase;
		class valueBase;
		class modBase;
		class X39_XTacticalHud_Configuration: modBase {
			scope = 2;
			name = "XTacticalHud Configuration";
			image = "\X39_TacticalHud_Res\logo.paa";
			class properties {
				class X39_TacticalHud_var_keys_openMfd: propertyBase {
					variable = "X39_TacticalHud_var_keys_openMfd";
					display = "Open MFD";
					type = TYPE_KEY;
					description = "Will open the XTacticalHuds MFD UI in air vehicles (nonBlocking UI)";
					default[] = {-1, 0, 0, 0};
				};
				class X39_TacticalHud_var_keys_openJtacDevice: propertyBase {
					variable = "X39_TacticalHud_var_keys_openJtacDevice";
					display = "Open JTAC device";
					type = TYPE_KEY;
					description = "Creates the UI for the JTAC device";
					default[] = {-1, 0, 0, 0};
				};
			};
		};
	};
};
