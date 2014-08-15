#include "local.hpp"
/**
 *	X39_TacticalHud_fnc_createGroundForcesUI
 *	Creates the UI for GroundForces
 *
 *	@ParamsCount 0
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */
if(dialog) exitWith {diag_log "tried to create X39_TacticalHud_AirMissionGroundForcesUI dialog but another dialog is already in place!"; };
private ["_cfgMarkers", "_cfgMarkerColors", "_i", "_marker", "_scope", "_picture", "_name", "_index", "_color", "_createMissionPosition"];

_createMissionPosition = laserTarget player;
if(isNull _createMissionPosition) then
{
	if(X39_TacticalHud_var_HasGps) then
	{
		_createMissionPosition = position player;
	}
	else
	{
		_createMissionPosition = [0, 0, 0];
	};
}
else
{
	_createMissionPosition = position _createMissionPosition;
};

createDialog "X39_TacticalHud_AirMissionGroundForcesUI";
waitUntil{dialog};
//Adding placeholders
_index = lbAdd[2102, "CURRENT"];
lbSetPicture[2102, _index, ""];

_index = lbAdd[2103, "CURRENT"];
lbSetValue[2103, _index, _i];

lbSetCurSel [2102, 0];
lbSetCurSel [2103, 0];
//Adding available markers
_cfgMarkers = (configfile >> "CfgMarkers");
_cfgMarkerColors = (configfile >> "CfgMarkerColors");
for "_i" from 0 to ((count _cfgMarkers) - 1) do
{
	_marker		= _cfgMarkers select _i;
	_scope		= getNumber (_marker >> "scope");
	_picture	= getText (_marker >> "icon");
	_name		= getText (_marker >> "name");
	if(_scope == 2) then
	{
		_index = lbAdd[2100, _name];
		lbSetPicture[2100, _index, _picture];
		
		_index = lbAdd[2102, _name];
		lbSetPicture[2102, _index, _picture];
	};
};
for "_i" from 0 to ((count _cfgMarkerColors) - 1) do
{
	_marker		= _cfgMarkerColors select _i;
	_color		= getArray (_marker >> "color");
	_name		= getText (_marker >> "name");
	if(count _color > 0) then
	{
		if(typeName (_color select 0) == "STRING" || typeName (_color select 0) == "TEXT") then
		{
			{
				_color set[_forEachIndex, call (compile _x)];
			}forEach _color;
		};
		_index = lbAdd[2101, _name];
		lbSetValue[2101, _index, _i];
		
		_index = lbAdd[2103, _name];
		lbSetValue[2103, _index, _i];
	};
};

ctrlSetText[1400, str (_createMissionPosition select 0)]; //Position X
ctrlSetText[1401, str (_createMissionPosition select 1)]; //Position Y
ctrlSetText[1402, str (_createMissionPosition select 2)]; //Position Z

[] call X39_TacticalHud_fnc_uiRefreshMissionList;


buttonSetAction [1603, "_this call X39_TacticalHud_fnc_uiRefreshMissionList;"];
buttonSetAction [1601, "_this call X39_TacticalHud_fnc_uiCreateMission;"];

buttonSetAction [1602, "_this call X39_TacticalHud_fnc_uiUpdateMission;"]; //UpdateButton
buttonSetAction [1600, "_this call X39_TacticalHud_fnc_uiDeleteMission;"]; //DeleteButton

displayControl(1500) ctrlSetEventHandler ["LBSelChanged", "_this call X39_TacticalHud_fnc_ui1500_LBSelChanged"];