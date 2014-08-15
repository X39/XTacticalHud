#include "local.hpp"
/**
 *	
 *	!NOT FOR CALLING BY USER/MODDER!
 *	USE X39_TacticalHud_fnc_removeMissionGlobal INSTEAD
 *
 *	@ParamsCount 1
 *	@Param1 - SCALAR - FireMission ID
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */
if(isDedicated) exitWith {};
if(!hasInterface) exitWith {};
private["_index"];
_index = [_this, 0, -1, [0]] call BIS_fnc_param;

if(X39_TacticalHud_var_OwnFireMissions find _index != -1) then
{
	X39_TacticalHud_var_OwnFireMissions = X39_TacticalHud_var_OwnFireMissions - [_index];
};