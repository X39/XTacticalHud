#include "\X39_TacticalHud_scripting\debug.hpp"
/*
		
 	@Return - N/A
 	@Author - X39|Cpt. HM Murdock
 */
[-1, false, false, false, {if(vehicle player isKindOf "air" && (driver vehicle player == player || gunner vehicle player == player)) then {[] call X39_TacticalHud_fnc_createAirForcesUI; true} else {false}},	"X39_TacticalHud_var_keys_openMfd"	] call X39_XLib_fnc_registerKey;
[-1, false, false, false, {if(X39_TacticalHud_var_HasAirMissionDevice) then {[] call X39_TacticalHud_fnc_createGroundForcesUI;}; X39_TacticalHud_var_HasAirMissionDevice},	"X39_TacticalHud_var_keys_openJtacDevice"	] call X39_XLib_fnc_registerKey;
[] call X39_TacticalHud_fnc_updateThread;
X39_TacticalHud_var_OwnMissionNamespaceString = format["X39_TacticalHud_var_AllFireMissions_%1", side player];

X39_TacticalHud_var_Draw3dHandler = addMissionEventHandler ["Draw3D", {
	if(vehicle player == player) then
	{
		if(X39_TacticalHud_var_HasAirMissionDevice) then
		{
			if(X39_TacticalHud_var_HasTacticalGlasses) then
			{
				{
					if(typeName _x != "SCALAR") then
					{
						_distance = _x select 0 distance player;
						if(_distance < viewDistance) then
						{
							drawIcon3D [_x select 1, _x select 2, (_x select 0), 1, 1, 360, (_x select 3), 0, 0.03, "TahomaB"];
						};
					};
					false
				}count (missionNamespace getvariable X39_TacticalHud_var_OwnMissionNamespaceString);
			};
		};
	}
	else
	{
		if(X39_TacticalHud_var_isInCompatibleVehicle) then
		{
			if(X39_TacticalHud_var_hasPilotHelmet) then
			{
				{
					_x = (missionNamespace getVariable X39_TacticalHud_var_OwnMissionNamespaceString) select _x;
					drawIcon3D [_x select 1, _x select 2, (_x select 0), 1, 1, 360, (_x select 3), 0, 0.03, "TahomaB"];
					false
				}count X39_TacticalHud_var_OwnFireMissions;
			};
		};
	};
}];