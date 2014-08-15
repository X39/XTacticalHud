#include "local.hpp"
/**
 *	
 *	Sends a systemChat message to the player when the conditions of param 2 are returning true
 *	Mainly for use in combination with BIS_fnc_MP
 *
 *	@ParamsCount 2
 *	@Param1 - STRING - Message
 *	@Param2 - CODE - Condition
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */
if(isDedicated) exitWith {};
if(!hasInterface) exitWith {};

if(player call (_this select 1)) then
{
	systemChat (_this select 0);
	//systemChat str _this;
};