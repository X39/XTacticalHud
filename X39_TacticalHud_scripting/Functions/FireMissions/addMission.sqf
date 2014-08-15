#include "local.hpp"
/**
 *	
 *	Creates a new mission for airVehicles
 *
 *	@ParamsCount 4
 *	@Param1 - ARRAY - Position (3D) of the target
 *	@Param2 - STRING - Texture to use (needs to be .paa)
 *	@Param3 - ARRAY - Color [R,G,B,A]
 *	@Param4 - STRING - Name of the mission
 *	@Return - SCALAR - FireMission ID
 *	@Author - X39|Cpt. HM Murdock
 */
if(isDedicated) exitWith {};
if(!hasInterface) exitWith {};
private["_missionList", "_position", "_texture", "_color", "_name", "_index"];

_position	= [_this, 0, [], [[]]] call BIS_fnc_param;
_texture	= [_this, 1, "", [""]] call BIS_fnc_param;
_color		= [_this, 2, [], [[]]] call BIS_fnc_param;
_name		= [_this, 3, "", [""]] call BIS_fnc_param;

_position set[2, (_position select 2) + 1.5];

_missionList = GETMISSIONNAMESPACEVAR;

_index = _missionList find -1;
if(_index == -1) then
{
	_index = count _missionList;
};
_missionList set[_index, [_position, _texture, _color, _name]];
SETMISSIONNAMESPACEVAR(_missionList);
publicVariable MISSIONNAMESPACEVAR;
[[format[localize "STR_X39_TacticalHud_scripting_AirMission_SomeoneCreatedMission", _name], {(X39_TacticalHud_var_isInCompatibleVehicle && (driver vehicle _this == _this || gunner vehicle _this == _this))}], "X39_TacticalHud_fnc_sendMessageLocal", true, false] call BIS_fnc_MP;