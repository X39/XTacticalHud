/**
 *	
 *	Initialize the mod
 *
 *	@ParamsCount 0
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */
if(isDedicated) exitWith {};
if(!hasInterface) exitWith {};
private["_res", "_fnc_getKey"];
_fnc_getKey = 
{
	_keycode = getNumber (_this >> "key");
	_bool1 = (getNumber (_this >> "press_ctrl")) call X39_XLib_fnc_IntToBool;
	_bool2 = (getNumber (_this >> "press_alt")) call X39_XLib_fnc_IntToBool;
	_bool3 = (getNumber (_this >> "press_shift")) call X39_XLib_fnc_IntToBool;
	_useActionKey = (getNumber (_this >> "useActionKey")) call X39_XLib_fnc_IntToBool;
	_actionKey = getText (_this >> "actionKey");
	[_useActionKey, _keycode, _bool1, _bool2, _bool3, _actionKey]
};


_res = [] spawn {
	waitUntil {sleep 0.0001;!isNull player};
	waitUntil {sleep 0.0001;alive player};
	sleep 1;
	[] call X39_TacticalHud_fnc_updateThread;
};

X39_TacticalHud_var_OwnMissionNamespaceString = format["X39_TacticalHud_var_AllFireMissions_%1", WEST];
X39_TacticalHud_var_OwnFireMissions = [];
X39_TacticalHud_var_HasAirMissionDevice = false;
X39_TacticalHud_var_HasTacticalGlasses = false;
X39_TacticalHud_var_hasPilotHelmet = false;
X39_TacticalHud_var_HasGps = false;
X39_TacticalHud_var_isInCompatibleVehicle = false;
X39_TacticalHud_var_lockUiControls = false;
X39_TacticalHud_var_enableGridCoordinatesDisplay = (getNumber (configFile >> "CfgSettings" >> "X39" >> "x39_tacticalHud" >> "options" >> "enableGridCoordinatesDisplay")) call X39_XLib_fnc_IntToBool;
X39_TacticalHud_var_enableAngleDisplay = (getNumber (configFile >> "CfgSettings" >> "X39" >> "x39_tacticalHud" >> "options" >> "enableAngleDisplay")) call X39_XLib_fnc_IntToBool;
X39_TacticalHud_var_mfdEventHandlerId = -1;
X39_TacticalHud_var_MFD_UiControlStructure = [[false, nil], [false, nil], [false, nil], [false, nil], [false, nil], [false, nil], [false, nil], [false, nil], [false, nil], [false, nil]];
X39_TacticalHud_var_Colors = [
	getArray (configFile >> "CfgSettings" >> "X39" >> "x39_tacticalHud" >> "colors" >> "UnknownTarget" >> "color"),
	getArray (configFile >> "CfgSettings" >> "X39" >> "x39_tacticalHud" >> "colors" >> "HostileTarget" >> "color"),
	getArray (configFile >> "CfgSettings" >> "X39" >> "x39_tacticalHud" >> "colors" >> "FriendlyTarget" >> "color"),
	getArray (configFile >> "CfgSettings" >> "X39" >> "x39_tacticalHud" >> "colors" >> "NeutralTarget" >> "color")
];
X39_TacticalHud_var_Keys = [
	[(configFile >> "CfgSettings" >> "X39" >> "x39_tacticalHud" >> "keys" >> "Key1") call _fnc_getKey,
	{
		if(X39_TacticalHud_var_HasAirMissionDevice) exitWith {[] call X39_TacticalHud_fnc_createGroundForcesUI;};
	}],
	[(configFile >> "CfgSettings" >> "X39" >> "x39_tacticalHud" >> "keys" >> "Key2") call _fnc_getKey,
	{
		if(vehicle player isKindOf "air" && (driver vehicle player == player || gunner vehicle player == player)) exitWith {[] call X39_TacticalHud_fnc_createAirForcesUI;};
	}]
];

if(isNil format["X39_TacticalHud_var_AllFireMissions_%1", WEST]) then		{ missionNamespace setVariable[format["X39_TacticalHud_var_AllFireMissions_%1", WEST], []];			};
if(isNil format["X39_TacticalHud_var_AllFireMissions_%1", EAST]) then		{ missionNamespace setVariable[format["X39_TacticalHud_var_AllFireMissions_%1", EAST], []];			};
if(isNil format["X39_TacticalHud_var_AllFireMissions_%1", RESISTANCE]) then	{ missionNamespace setVariable[format["X39_TacticalHud_var_AllFireMissions_%1", RESISTANCE], []];	};
if(isNil format["X39_TacticalHud_var_AllFireMissions_%1", CIVILIAN]) then	{ missionNamespace setVariable[format["X39_TacticalHud_var_AllFireMissions_%1", CIVILIAN], []];		};

addMissionEventHandler ["Draw3D", {
	if(vehicle player == player) then
	{
		if(X39_TacticalHud_var_HasAirMissionDevice) then
		{
			if(X39_TacticalHud_var_HasTacticalGlasses) then
			{
				{
					if(typeName _x != "SCALAR") then
					{
						_distance = _x select 0 distance player;
						if(_distance < viewDistance) then
						{
							drawIcon3D [_x select 1, _x select 2, (_x select 0), 1, 1, 360, (_x select 3), 0, 0.03, "TahomaB"];
						};
					};
					false
				}count (missionNamespace getvariable X39_TacticalHud_var_OwnMissionNamespaceString);
			};
		};
	}
	else
	{
		if(X39_TacticalHud_var_isInCompatibleVehicle) then
		{
			if(X39_TacticalHud_var_hasPilotHelmet) then
			{
				{
					_mission = (missionNamespace getvariable X39_TacticalHud_var_OwnMissionNamespaceString) select _x;
					drawIcon3D [_mission select 1, _mission select 2, (_mission select 0), 1, 1, 360, (_mission select 3), 0, 0.03, "TahomaB"];
					false
				}count X39_TacticalHud_var_OwnFireMissions;
			};
		};
	};
}];
[] spawn {
	waituntil {!isNull (findDisplay 46)};
	(findDisplay 46) displayAddEventHandler ["KeyDown", "(_this call X39_TacticalHud_fnc_handleKeyPress)"];
};