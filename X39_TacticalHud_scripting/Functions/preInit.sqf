#include "\X39_TacticalHud_scripting\debug.hpp"
/*
		
 	@Return - N/A
 	@Author - X39|Cpt. HM Murdock
 */
if(isDedicated || !hasInterface) exitWith {};
private["_res", "_fnc_getKey"];

assignValue("X39_TacticalHud_var_OwnFireMissions", []);
assignValue("X39_TacticalHud_var_HasAirMissionDevice", false);
assignValue("X39_TacticalHud_var_HasTacticalGlasses", false);
assignValue("X39_TacticalHud_var_hasPilotHelmet", false);
assignValue("X39_TacticalHud_var_HasGps", false);
assignValue("X39_TacticalHud_var_isInCompatibleVehicle", false);
assignValue("X39_TacticalHud_var_lockUiControls", false);
assignValue("X39_TacticalHud_var_mfdEventHandlerId", -1);
assignValue(format["X39_TacticalHud_var_AllFireMissions_%1" COMMA WEST], []);
assignValue(format["X39_TacticalHud_var_AllFireMissions_%1" COMMA EAST], []);
assignValue(format["X39_TacticalHud_var_AllFireMissions_%1" COMMA RESISTANCE], []);
assignValue(format["X39_TacticalHud_var_AllFireMissions_%1" COMMA CIVILIAN], []);

assignValue3("X39_TacticalHud_var_enableGridCoordinatesDisplay", true, profileNamespace);
assignValue3("X39_TacticalHud_var_enableAngleDisplay", true, profileNamespace);

//Will be set in post init
assignValue("X39_TacticalHud_var_OwnMissionNamespaceString", nil);
assignValue("X39_TacticalHud_var_Draw3dHandler", nil);

X39_TacticalHud_var_MFD_UiControlStructure = [[false, nil], [false, nil], [false, nil], [false, nil], [false, nil], [false, nil], [false, nil], [false, nil], [false, nil], [false, nil]];
//X39_TacticalHud_var_Colors = [
//	[0.7,0.6,0,0.5],
//	[0.5,0,0,0.5],
//	[0,0.3,0.6,0.5],
//	[0.4,0,0.5,0.5]
//];