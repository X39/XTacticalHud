#include "local.hpp"
#define rscDisplayMFD (uiNamespace getVariable "X39_TacticalHud_MFD")
#define rscDisplayControl(X) (rscDisplayMFD displayCtrl X)
#define resetControlStructure X39_TacticalHud_var_MFD_UiControlStructure = [[false, nil], [false, nil], [false, nil], [false, nil], [false, nil], [false, nil], [false, nil], [false, nil], [false, nil], [false, nil]]
#define setControlStructure(X,Y) X39_TacticalHud_var_MFD_UiControlStructure set[X, [true, Y]]
/**
 *	X39_TacticalHud_fnc_mfdShowPage
 *	!NOT FOR CALLING BY USER/MODDER!
 *	Specialized helper function for X39_TacticalHud_fnc_createAirForcesUI
 *
 *	@ParamsCount 2
 *	@Param1 - SCALAR - Index to start from
 *	@Param1 - BOOL - see X39_TacticalHud_fnc_fetchAvailableMissions
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */
private["_i", "_missionList", "_index", "_maxIndex", "_helper", "_composeTextArray", "_text", "_counter"];
resetControlStructure;
_missionList = (_this select 1) call X39_TacticalHud_fnc_fetchAvailableMissions;
_index = _this select 0;
if(_index >= 0) then
{
	setControlStructure(1, [[(_this select 0) - 7 COMMA (_this select 1)] COMMA {_this call X39_TacticalHud_fnc_mfdShowPage}]);
}
else
{
	_index = 0;
};
_maxIndex = _index + 6;
if(_maxIndex >= count _missionList) then
{
	_maxIndex = (count _missionList) - 1;
}
else
{
	setControlStructure(9, [[(_this select 0) + 7 COMMA (_this select 1)] COMMA {_this call X39_TacticalHud_fnc_mfdShowPage}]);
};
_composeTextArray = [];
_composeTextArray set[count _composeTextArray, formatText[""]];
_composeTextArray set[count _composeTextArray, formatText["          %1", if(_this select 1)then{toUpper  localize "STR_X39_TacticalHud_scripting_AirMission_ListAvailableMissions"} else {toUpper  localize "STR_X39_TacticalHud_scripting_AirMission_ListAssignedMissions"}]];
_composeTextArray set[count _composeTextArray, formatText[""]];
_composeTextArray set[count _composeTextArray, formatText[" 1. %1", toUpper localize "STR_X39_TacticalHud_scripting_AirMission_LastPage"]];
_counter = 2;
for "_i" from _index to _maxIndex do
{
//systemChat str [_index, _maxIndex, _this, _i, _counter];
	_composeTextArray set[count _composeTextArray, formatText[" %1: %2. %3", _counter, _i + 1, toUpper (_missionList select _i select 1 select 3)]];
	if(_this select 1)then
	{
		setControlStructure(_counter, [[_this COMMA (_missionList select _i)] COMMA {
			if(X39_TacticalHud_var_OwnFireMissions find (_this select 1 select 0) == -1) then
			{
				X39_TacticalHud_var_OwnFireMissions set [count X39_TacticalHud_var_OwnFireMissions COMMA _this select 1 select 0];
				[[format[localize "STR_X39_TacticalHud_scripting_AirMission_SomeoneAssignedMission" COMMA name player COMMA (_this select 1 select 1 select 3)] COMMA {(X39_TacticalHud_var_HasAirMissionDevice) || (vehicle _this isKindOf "air" && (driver vehicle _this == _this || gunner vehicle _this == _this))}] COMMA "X39_TacticalHud_fnc_sendMessageLocal" COMMA true COMMA false] call BIS_fnc_MP;
			};
			(_this select 0) call X39_TacticalHud_fnc_mfdShowPage;
		}]);
	}
	else
	{
		setControlStructure(_counter, [[_this COMMA (_missionList select _i)] COMMA {
			(_this select 1 select 0) call X39_TacticalHud_fnc_removeMission;
			[[format[localize "STR_X39_TacticalHud_scripting_AirMission_SomeoneDroppedMission" COMMA name player COMMA (_this select 1 select 1 select 3)] COMMA {(X39_TacticalHud_var_HasAirMissionDevice) || (vehicle _this isKindOf "air" && (driver vehicle _this == _this || gunner vehicle _this == _this))}] COMMA "X39_TacticalHud_fnc_sendMessageLocal" COMMA true COMMA false] call BIS_fnc_MP;
			(_this select 0) call X39_TacticalHud_fnc_mfdShowPage;
		}]);
	};
	_counter = _counter + 1;
};
_text = "";
_composeTextArray set[count _composeTextArray, formatText[" 9. %1", toUpper localize "STR_X39_TacticalHud_scripting_AirMission_NextPage"]];
_composeTextArray set[count _composeTextArray, formatText[""]];
_composeTextArray set[count _composeTextArray, formatText[""]];
_composeTextArray set[count _composeTextArray, formatText[""]];
_composeTextArray set[count _composeTextArray, formatText[" 0. %1", toUpper localize "STR_X39_TacticalHud_scripting_AirMission_BackToMainMenu"]];
{
	_text = formatText["%1%2<br />", _text, _x];
	false
}count _composeTextArray;
rscDisplayControl(1000) ctrlSetStructuredText (parseText str _text);
_helper = {
	resetControlStructure;
	rscDisplayControl(1000) ctrlSetStructuredText formatText["%1          %2%1 1. %3%1 2. %4%1%1%1 0. %5", lineBreak, toUpper localize "STR_X39_TacticalHud_scripting_AirMission_MainMenu", toUpper localize "STR_X39_TacticalHud_scripting_AirMission_ListAssignedMissions", toUpper localize "STR_X39_TacticalHud_scripting_AirMission_ListAvailableMissions", toUpper localize "STR_X39_TacticalHud_scripting_AirMission_ExitMfd"];
	setControlStructure(0, [[] COMMA {("X39_TacticalHud_MFD" call BIS_fnc_rscLayer) cutText ["" COMMA "PLAIN"]; (findDisplay 46) displayRemoveEventHandler ["KeyUp" COMMA X39_TacticalHud_var_mfdEventHandlerId]; X39_TacticalHud_var_mfdEventHandlerId = -1;}]);
	setControlStructure(1, [[0 COMMA false] COMMA {_this call X39_TacticalHud_fnc_mfdShowPage}]);
	setControlStructure(2, [[0 COMMA true] COMMA {_this call X39_TacticalHud_fnc_mfdShowPage}]);
};
setControlStructure(0, [[] COMMA _helper]);