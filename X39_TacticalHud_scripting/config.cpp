class CfgPatches{
	class X39_TacticalHud_scripting{
         units[] = {};
         weapons[] = {};
         requiredVersion = 1.0;
         requiredAddons[] = {"X39_XLib_Core", "X39_TacticalHud_UIs"};
         author = "X39|Cpt. HM Murdock";
         mail = "killerx29@gmail.com";
	};
};

class X39_XLib_Function_TypeA;
class X39_XLib_Function_TypeB;
class X39_XLib_Function_TypeC;

class CfgFunctions 
{
	class X39_TacticalHud
	{
		class Generic
		{
			class initMod:X39_XLib_Function_TypeB					{file = "X39_TacticalHud_scripting\Functions\initMod.sqf";};
			class updateThread:X39_XLib_Function_TypeA				{file = "X39_TacticalHud_scripting\Functions\updateThread.sqf";};
			class handleKeyPress:X39_XLib_Function_TypeA			{file = "X39_TacticalHud_scripting\Functions\handleKeyPress.sqf";};
		};
		class FireMissions
		{
			class fireMissions_UpdateThread:X39_XLib_Function_TypeA	{file = "\X39_TacticalHud_scripting\Functions\FireMissions\updateThread.sqf";};
			class addMission:X39_XLib_Function_TypeA				{file = "\X39_TacticalHud_scripting\Functions\FireMissions\addMission.sqf";};
			class createGroundForcesUI:X39_XLib_Function_TypeA		{file = "\X39_TacticalHud_scripting\Functions\FireMissions\createGroundForcesUI.sqf";};
			class createAirForcesUI:X39_XLib_Function_TypeA			{file = "\X39_TacticalHud_scripting\Functions\FireMissions\createAirForcesUI.sqf";};
			class fetchAvailableMissions:X39_XLib_Function_TypeA	{file = "\X39_TacticalHud_scripting\Functions\FireMissions\fetchAvailableMissions.sqf";};
			class removeMission:X39_XLib_Function_TypeA				{file = "\X39_TacticalHud_scripting\Functions\FireMissions\removeMission.sqf";};
			class removeMissionGlobal:X39_XLib_Function_TypeA		{file = "\X39_TacticalHud_scripting\Functions\FireMissions\removeMissionGlobal.sqf";};
			class uiRefreshMissionList:X39_XLib_Function_TypeA		{file = "\X39_TacticalHud_scripting\Functions\FireMissions\uiRefreshMissionList.sqf";};
			class uiCreateMission:X39_XLib_Function_TypeA			{file = "\X39_TacticalHud_scripting\Functions\FireMissions\uiCreateMission.sqf";};
			class uiDeleteMission:X39_XLib_Function_TypeA			{file = "\X39_TacticalHud_scripting\Functions\FireMissions\uiDeleteMission.sqf";};
			class uiUpdateMission:X39_XLib_Function_TypeA			{file = "\X39_TacticalHud_scripting\Functions\FireMissions\uiUpdateMission.sqf";};
			class mfdShowPage:X39_XLib_Function_TypeA				{file = "\X39_TacticalHud_scripting\Functions\FireMissions\mfdShowPage.sqf";};
			class ui1500_LBSelChanged:X39_XLib_Function_TypeA		{file = "\X39_TacticalHud_scripting\Functions\FireMissions\ui1500_LBSelChanged.sqf";};
			class sendMessageLocal:X39_XLib_Function_TypeA			{file = "\X39_TacticalHud_scripting\Functions\FireMissions\sendMessageLocal.sqf";};
		};
	};
};
