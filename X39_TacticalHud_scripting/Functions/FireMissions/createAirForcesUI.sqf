#include "local.hpp"
#include "\X39_TacticalHud_scripting\keyList.hpp"
#define rscDisplayMFD (uiNamespace getVariable "X39_TacticalHud_MFD")
#define rscDisplayControl(X) (rscDisplayMFD displayCtrl X)
#define resetControlStructure X39_TacticalHud_var_MFD_UiControlStructure = [[false, nil], [false, nil], [false, nil], [false, nil], [false, nil], [false, nil], [false, nil], [false, nil], [false, nil], [false, nil]]
#define setControlStructure(X,Y) X39_TacticalHud_var_MFD_UiControlStructure set[X, [true, Y]]
/**
 *	X39_TacticalHud_fnc_createAirForcesUI
 *	Creates the UI for AirVehicles
 *	@ParamsCount 0
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */
[] spawn {
	if(X39_TacticalHud_var_mfdEventHandlerId != -1) exitWith {};
	("X39_TacticalHud_MFD" call BIS_fnc_rscLayer) cutRsc ["X39_TacticalHud_MFD", "PLAIN"];




	resetControlStructure;
	rscDisplayControl(1000) ctrlSetStructuredText formatText["%1          %2%1 1. %3%1 2. %4%1%1%1 0. %5", lineBreak, toUpper localize "STR_X39_TacticalHud_scripting_AirMission_MainMenu", toUpper localize "STR_X39_TacticalHud_scripting_AirMission_ListAssignedMissions", toUpper localize "STR_X39_TacticalHud_scripting_AirMission_ListAvailableMissions", toUpper localize "STR_X39_TacticalHud_scripting_AirMission_ExitMfd"];
	setControlStructure(0, [[] COMMA {("X39_TacticalHud_MFD" call BIS_fnc_rscLayer) cutText ["" COMMA "PLAIN"]; (findDisplay 46) displayRemoveEventHandler ["KeyUp" COMMA X39_TacticalHud_var_mfdEventHandlerId]; X39_TacticalHud_var_mfdEventHandlerId = -1;}]);
	setControlStructure(1, [[0 COMMA false] COMMA {_this call X39_TacticalHud_fnc_mfdShowPage}]);
	setControlStructure(2, [[0 COMMA true] COMMA {_this call X39_TacticalHud_fnc_mfdShowPage}]);


	X39_TacticalHud_var_mfdEventHandlerId = (findDisplay 46) displayAddEventHandler ["KeyUp", {
		private["_keyCode", "_currentStructure"];
		//_display	= _this select 0;
		_keyCode	= _this select 1;
		//_shift	= _this select 2;
		//_ctrl		= _this select 3;
		//_alt		= _this select 4;
		if(_keyCode == DIK_NUMPAD0 || _keyCode == DIK_0) exitWith
		{
			_currentStructure = X39_TacticalHud_var_MFD_UiControlStructure select 0;
			if(_currentStructure select 0) then
			{
				if(!isNil {(_currentStructure select 1)}) then
				{
					(_currentStructure select 1 select 0) call (_currentStructure select 1 select 1);
				};
			};
			true
		};
		if(_keyCode == DIK_NUMPAD1 || _keyCode == DIK_1) exitWith
		{
			_currentStructure = X39_TacticalHud_var_MFD_UiControlStructure select 1;
			if(_currentStructure select 0) then
			{
				if(!isNil {(_currentStructure select 1)}) then
				{
					(_currentStructure select 1 select 0) call (_currentStructure select 1 select 1);
				};
			};
			true
		};
		if(_keyCode == DIK_NUMPAD2 || _keyCode == DIK_2) exitWith
		{
			_currentStructure = X39_TacticalHud_var_MFD_UiControlStructure select 2;
			if(_currentStructure select 0) then
			{
				if(!isNil {(_currentStructure select 1)}) then
				{
					(_currentStructure select 1 select 0) call (_currentStructure select 1 select 1);
				};
			};
			true
		};
		if(_keyCode == DIK_NUMPAD3 || _keyCode == DIK_3) exitWith
		{
			_currentStructure = X39_TacticalHud_var_MFD_UiControlStructure select 3;
			if(_currentStructure select 0) then
			{
				if(!isNil {(_currentStructure select 1)}) then
				{
					(_currentStructure select 1 select 0) call (_currentStructure select 1 select 1);
				};
			};
			true
		};
		if(_keyCode == DIK_NUMPAD4 || _keyCode == DIK_4) exitWith
		{
			_currentStructure = X39_TacticalHud_var_MFD_UiControlStructure select 4;
			if(_currentStructure select 0) then
			{
				if(!isNil {(_currentStructure select 1)}) then
				{
					(_currentStructure select 1 select 0) call (_currentStructure select 1 select 1);
				};
			};
			true
		};
		if(_keyCode == DIK_NUMPAD5 || _keyCode == DIK_5) exitWith
		{
			_currentStructure = X39_TacticalHud_var_MFD_UiControlStructure select 5;
			if(_currentStructure select 0) then
			{
				if(!isNil {(_currentStructure select 1)}) then
				{
					(_currentStructure select 1 select 0) call (_currentStructure select 1 select 1);
				};
			};
			true
		};
		if(_keyCode == DIK_NUMPAD6 || _keyCode == DIK_6) exitWith
		{
			_currentStructure = X39_TacticalHud_var_MFD_UiControlStructure select 6;
			if(_currentStructure select 0) then
			{
				if(!isNil {(_currentStructure select 1)}) then
				{
					(_currentStructure select 1 select 0) call (_currentStructure select 1 select 1);
				};
			};
			true
		};
		if(_keyCode == DIK_NUMPAD7 || _keyCode == DIK_7) exitWith
		{
			_currentStructure = X39_TacticalHud_var_MFD_UiControlStructure select 7;
			if(_currentStructure select 0) then
			{
				if(!isNil {(_currentStructure select 1)}) then
				{
					(_currentStructure select 1 select 0) call (_currentStructure select 1 select 1);
				};
			};
			true
		};
		if(_keyCode == DIK_NUMPAD8 || _keyCode == DIK_8) exitWith
		{
			_currentStructure = X39_TacticalHud_var_MFD_UiControlStructure select 8;
			if(_currentStructure select 0) then
			{
				if(!isNil {(_currentStructure select 1)}) then
				{
					(_currentStructure select 1 select 0) call (_currentStructure select 1 select 1);
				};
			};
			true
		};
		if(_keyCode == DIK_NUMPAD9 || _keyCode == DIK_9) exitWith
		{
			_currentStructure = X39_TacticalHud_var_MFD_UiControlStructure select 9;
			if(_currentStructure select 0) then
			{
				if(!isNil {(_currentStructure select 1)}) then
				{
					(_currentStructure select 1 select 0) call (_currentStructure select 1 select 1);
				};
			};
			true
		};
		false
	}];
	waitUntil{sleep 0.001; isNull rscDisplayMFD || vehicle player == player};
	if(!isNull rscDisplayMFD) then
	{
		("X39_TacticalHud_MFD" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
		(findDisplay 46) displayRemoveEventHandler ["KeyUp", X39_TacticalHud_var_mfdEventHandlerId];
		X39_TacticalHud_var_mfdEventHandlerId = -1;
	};
};