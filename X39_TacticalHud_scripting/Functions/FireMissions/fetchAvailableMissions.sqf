#include "local.hpp"
/**
 *	X39_TacticalHud_fnc_fetchAvailableMissions
 *	Returns available missions
 *
 *	@ParamsCount 1
 *	@Param1 - BOOL - use true if you want all unassigned, false if all assigned ones (from player perspective)
 *	@Return - ARRAY - Array containing ID + airMissions ([ID, [Position, Texture, Color, Name]])
 *	@Author - X39|Cpt. HM Murdock
 */

private["_flag", "_arr", "_mission"];
_flag = [_this, 0, false, [false]] call BIS_fnc_param;
_arr = [];
if(_flag) then
{
	{
		_mission = _x;
		if(typeName _mission != "SCALAR") then
		{
			if(X39_TacticalHud_var_OwnFireMissions find _forEachIndex == -1) then
			{
				_arr set[count _arr, [_forEachIndex, _mission]];
			};
		};
	}forEach GETMISSIONNAMESPACEVAR;
}
else
{
	{
		_mission = GETMISSIONNAMESPACEVAR select _x;
		if(typeName _mission == "SCALAR") then
		{
			X39_TacticalHud_var_OwnFireMissions = X39_TacticalHud_var_OwnFireMissions - _x;
		}
		else
		{
			_arr set[count _arr, [_x, _mission]];
		};
	}forEach X39_TacticalHud_var_OwnFireMissions;
};
_arr