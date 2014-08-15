#define display (uiNamespace getVariable "X39_TacticalHud_Ui")
#define displayControl(X) ((uiNamespace getVariable "X39_TacticalHud_Ui") displayCtrl X)
/**
 *	
 *	Updates the HUD (callen by main updateThread function!)
 *
 *	@ParamsCount 0
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */

X39_TacticalHud_var_OwnMissionNamespaceString = (format["X39_TacticalHud_var_AllFireMissions_%1", side player]);
X39_TacticalHud_var_HasAirMissionDevice = (assignedItems player find "X39_TacticalHud_AirMissionControlDevice" != -1);
X39_TacticalHud_var_isInCompatibleVehicle = (vehicle player isKindOf "Air");
//H_PilotHelmetFighter_B, H_PilotHelmetHeli_B
X39_TacticalHud_var_hasPilotHelmet = (headgear player == "H_PilotHelmetFighter_B" || {headgear player == "H_PilotHelmetHeli_B" || {headgear player isKindOf "H_PilotHelmetFighter_B" || {headgear player isKindOf "H_PilotHelmetHeli_B"}}});