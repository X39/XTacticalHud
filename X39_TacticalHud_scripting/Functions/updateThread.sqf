#define display (uiNamespace getVariable "X39_TacticalHud_Ui")
#define displayControl(X) (display displayCtrl X)
/**
 *	
 *	Updates the HUD
 *
 *	@ParamsCount 0
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */
if(isDedicated) exitWith {};
if(!hasInterface) exitWith {};
private["_res"];
_res = [] spawn {
	private["_wasVisible", "_isVisible", "_bearing", "_strX", "_strY", "_arr", "_i1", "_i2"];
	waitUntil {alive player};
	("X39_TacticalHud_Ui" call BIS_fnc_rscLayer) cutRsc["X39_TacticalHud_Ui", "PLAIN"];
	_isVisible = false;
	_wasVisible = true;
	_bearing = "";
	while{alive player} do
	{
		[] call X39_TacticalHud_fnc_fireMissions_UpdateThread;
		X39_TacticalHud_var_HasTacticalGlasses = (["G_Tactical_Black", "G_Tactical_Clear"] find (goggles player) != -1);
		X39_TacticalHud_var_HasGps = {if(_x == "ItemGPS" || {configName inheritsFrom (configFile >> "CfgWeapons" >> _x) == "ItemGPS" || {configName inheritsFrom (inheritsFrom (configFile >> "CfgWeapons" >> _x)) == "ItemGPS"} || {configName inheritsFrom (inheritsFrom (inheritsFrom (configFile >> "CfgWeapons" >> _x))) == "ItemGPS"}}) then { true } else { false }} count assignedItems player > 0;
		_isVisible = (vehicle player == player) && {X39_TacticalHud_var_HasTacticalGlasses && {X39_TacticalHud_var_HasGps}};
		if(!_isVisible && _wasVisible || _isVisible && !_wasVisible) then
		{
			if(profileNamespace getVariable "X39_TacticalHud_var_enableAngleDisplay") then
			{
				displayControl(2200) ctrlShow _isVisible;
				displayControl(1000) ctrlShow _isVisible;
				displayControl(1001) ctrlShow _isVisible;
			};
			if(profileNamespace getVariable "X39_TacticalHud_var_enableGridCoordinatesDisplay") then
			{
				displayControl(2201) ctrlShow _isVisible;
				displayControl(1002) ctrlShow _isVisible;
			};
			_wasVisible = _isVisible;
		};
		if(_isVisible) then
		{
			if(profileNamespace getVariable "X39_TacticalHud_var_enableAngleDisplay") then
			{
				_dir = ((eyeDirection player select 0) atan2 (eyeDirection player select 1)) % 360;
				if(_dir < 0) then
				{
					_dir = 360 + _dir;
				};
				_bearing = player call X39_XLib_fnc_getUnitsBearing;
				displayControl(1000) ctrlSetText _bearing;
				displayControl(1001) ctrlSetText str (floor _dir);
			};
			if(profileNamespace getVariable "X39_TacticalHud_var_enableGridCoordinatesDisplay") then
			{
				_strX = toArray str (((abs (position player select 0)) - (abs (position player select 0)) % 10) / 10);
				_arr = [48, 48, 48, 48];
				_i1 = count _strX;
				_i2 = count _arr;
				if(_i1 < _i2) then
				{
					while{_i1 != 0} do
					{
						_i1 = _i1 - 1;
						_i2 = _i2 - 1;
						
						_arr set [_i2, _strX select _i1];
					};
				}
				else
				{
					_arr = _strX;
				};
				_strX = toString _arr;
					
				_strY = toArray str (((abs (position player select 1)) - (abs (position player select 1)) % 10) / 10);
				_arr = [48, 48, 48, 48];
				_i1 = count _strY;
				_i2 = count _arr;
				if(_i1 < _i2) then
				{
					while{_i1 != 0} do
					{
						_i1 = _i1 - 1;
						_i2 = _i2 - 1;
						
						_arr set [_i2, _strY select _i1];
					};
				}
				else
				{
					_arr = _strY;
				};
				_strY = toString _arr;
				
				displayControl(1002) ctrlSetText format["%1-%2", _strX, _strY];
			};
		};
		sleep 0.125;
	};
	("X39_TacticalHud_Ui" call BIS_fnc_rscLayer) cutText ["", "PLAIN", 0, false];
	sleep 1;
	[] call X39_TacticalHud_fnc_updateThread;
};