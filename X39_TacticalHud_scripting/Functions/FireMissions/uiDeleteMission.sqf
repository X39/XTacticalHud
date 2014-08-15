#include "local.hpp"
/**
 *	
 *	UI Function
 *
 *	@Author - X39|Cpt. HM Murdock
 */
if(X39_TacticalHud_var_lockUiControls) exitWith {};
if(lbCurSel 1500 <= -1) exitWith{};
private["_currentMissionId", "_res"];

_currentMissionId = lbValue [1500, lbCurSel 1500];
X39_TacticalHud_var_lockUiControls = true;

ctrlSetText[1050, "Deleting Mission"];
_res = _currentMissionId spawn {
	private["_i", "_str"];
	_str = "Deleting Mission";
	for "_i" from 0 to (random 10) + 3 do
	{
		sleep 0.5;
		_str = format["%1.", _str];
		ctrlSetText[1050, _str];
	};
	_this call X39_TacticalHud_fnc_removeMissionGlobal;
	_str = format["%1.", _str];
	ctrlSetText[1050, _str];
	sleep 0.5;
	_str = format["%1.", _str];
	ctrlSetText[1050, _str];
	sleep 0.5;
	ctrlSetText[1050, "Mission has been deleted."];
	X39_TacticalHud_var_lockUiControls = false;
	[] call X39_TacticalHud_fnc_uiRefreshMissionList;
};