#include "local.hpp"
/**
 *	
 *	UI Function
 *
 *	@Author - X39|Cpt. HM Murdock
 */
if(X39_TacticalHud_var_lockUiControls) exitWith {};
private["_index"];
lbClear 1500;
{
	if(typeName _x == "ARRAY") then
	{
		_index = lbAdd	[1500, _x select 3];
		lbSetValue		[1500, _index, _forEachIndex];
		lbSetPicture	[1500, _index, _x select 1];
		lbSetColor		[1500, _index, _x select 2];
	};
}foreach GETMISSIONNAMESPACEVAR;