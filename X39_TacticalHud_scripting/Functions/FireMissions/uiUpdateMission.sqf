#include "local.hpp"
/**
 *	
 *	UI Function
 *
 *	@Author - X39|Cpt. HM Murdock
 */
if(X39_TacticalHud_var_lockUiControls) exitWith {};
if(lbCurSel 1500 == -1) exitWith {};
private["_currentMissionId", "_missionList", "_mission", "_strOfMission", "_position", "_texture", "_color", "_name", "_res"];


_currentMissionId = lbValue [1500, lbCurSel 1500];
_missionList = GETMISSIONNAMESPACEVAR;
_mission = _missionList select _currentMissionId;
_strOfMission = str _mission;



_name		= ctrlText 1406; if(_name == "") exitWith {ctrlSetText[1050, "Name cannot be empty!"];}; 
_texture	= lbCurSel 2102; if(_texture != 0) then { _texture = lbPicture[2100, _texture - 1]; };
_color		= lbCurSel 2103; if(_color != 0) then { _color = getArray (((configfile >> "CfgMarkerColors") select (lbValue [2101, _color - 1])) >> "color"); if(count _color > 0) then { if(typeName (_color select 0) == "STRING" || typeName (_color select 0) == "TEXT") then {  {   _color set[_forEachIndex, call (compile _x)];  }forEach _color; }; };};
_position	= [parseNumber (ctrlText 1407), parseNumber (ctrlText 1403), parseNumber (ctrlText 1404)]; if(str _position == "[0,0,0]") exitWith {ctrlSetText[1050, "Invalid position format!"];}; 

_mission set[0, _position];
if(typeName _texture != "SCALAR") then
{
	_mission set[1, _texture];
};

if(typeName _color != "SCALAR") then
{
	_mission set[2, _color];
};
_mission set[3, _name];

if(_strOfMission == str _mission) then
{
	ctrlSetText[1050, "Please change any value before commiting."];
}
else
{
	
	ctrlSetText[1050, "Updating Mission"];
	_res = [_missionList, _currentMissionId, _mission] spawn {
		private["_i", "_str"];
		_str = "Updating Mission";
		for "_i" from 0 to (random 7) + 5 do
		{
			sleep 0.5;
			_str = format["%1.", _str];
			ctrlSetText[1050, _str];
		};
		
		(_this select 0) set [(_this select 1), (_this select 2)];
		SETMISSIONNAMESPACEVAR((_this select 0));
		publicVariable MISSIONNAMESPACEVAR;
		
		ctrlSetText[1050, "Mission has been updated."];
		X39_TacticalHud_var_lockUiControls = false;
		[] call X39_TacticalHud_fnc_uiRefreshMissionList;
	};
};