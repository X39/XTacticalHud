#include "local.hpp"
/**
 *	
 *	UI Function
 *
 *	@Author - X39|Cpt. HM Murdock
 */
if(X39_TacticalHud_var_lockUiControls) exitWith {};
private["_position", "_texture", "_color", "_name"];

_name		= ctrlText 1405; if(_name == "") exitWith {ctrlSetText[1050, "Name cannot be empty!"];}; 
_texture	= lbCurSel 2100; if(_texture == -1) exitWith {ctrlSetText[1050, "You need to select an icon!"];}; _texture = lbPicture[2100, _texture];
_color		= lbCurSel 2101; if(_color == -1) exitWith {ctrlSetText[1050, "You need to select a color!"];}; _color = getArray (((configfile >> "CfgMarkerColors") select (lbValue [2101, _color])) >> "color");
_position	= [parseNumber (ctrlText 1400), parseNumber (ctrlText 1401), parseNumber (ctrlText 1402)]; if(str _position == "[0,0,0]") exitWith {ctrlSetText[1050, "Invalid position format!"];}; 

if(count _color > 0) then
{
	if(typeName (_color select 0) == "STRING" || typeName (_color select 0) == "TEXT") then
	{
		{
			_color set[_forEachIndex, call (compile _x)];
		}forEach _color;
	};
};


[] call X39_TacticalHud_fnc_uiRefreshMissionList;

ctrlSetText[1050, "Creating Mission"];
_res = [_position, _texture, _color, _name] spawn {
	private["_i", "_str"];
	_str = "Creating Mission";
	for "_i" from 0 to (random 10) + 5 do
	{
		sleep 0.5;
		_str = format["%1.", _str];
		ctrlSetText[1050, _str];
	};
	_this call X39_TacticalHud_fnc_addMission;
	ctrlSetText[1050, "Mission has been created."];
	X39_TacticalHud_var_lockUiControls = false;
	[] call X39_TacticalHud_fnc_uiRefreshMissionList;
};