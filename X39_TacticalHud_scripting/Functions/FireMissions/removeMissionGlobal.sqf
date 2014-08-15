#include "local.hpp"
/**
 *	
 *	Deletes a mission
 *
 *	@ParamsCount 1
 *	@Param1 - SCALAR - FireMission ID
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */
if(isDedicated) exitWith {};
if(!hasInterface) exitWith {};
private["_index", "_res"];
_index = [_this, 0, -1, [0]] call BIS_fnc_param;

if(count GETMISSIONNAMESPACEVAR <= _index || _index < 0) exitWith {diag_log "removeMissionGlobal: Argument out of range exception!";};

[_this, "X39_TacticalHud_fnc_removeMission", true, false] call BIS_fnc_MP;
_res = _index spawn {
	private["_missionList"];
	sleep 1;
	_missionList = GETMISSIONNAMESPACEVAR;
	_missionList set [_this, -1];
	SETMISSIONNAMESPACEVAR(_missionList);
	publicVariable MISSIONNAMESPACEVAR;
};