#define MISSIONNAMESPACEVAR (format["X39_TacticalHud_var_AllFireMissions_%1", side player])
#define GETMISSIONNAMESPACEVAR (missionNamespace getVariable format["X39_TacticalHud_var_AllFireMissions_%1", side player])
#define SETMISSIONNAMESPACEVAR(VAR) (missionNamespace setVariable[format["X39_TacticalHud_var_AllFireMissions_%1", side player], VAR])
#define display (findDisplay 21125)
#define displayControl(X) (display displayCtrl X)
#ifndef COMMA
	#define COMMA ,
#endif

//FireMission definition: [Position, Texture, Color, Name]