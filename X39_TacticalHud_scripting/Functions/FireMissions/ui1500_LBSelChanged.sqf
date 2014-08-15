#include "local.hpp"
/**
 *	
 *	UI Function
 *
 *	@Author - X39|Cpt. HM Murdock
 */
//FireMission definition: [Position, Texture, Color, Name]
private["_mission"];
if(_this select 1 == -1) exitWith {};
_missionList = GETMISSIONNAMESPACEVAR;
_missionID = lbValue [1500, _this select 1];
if(count _missionList <= _missionID) exitWith {};
_mission = _missionList select (_missionID);
ctrlSetText[1406, _mission select 3]; //mission name
ctrlSetText[1407, str (_mission select 0 select 0)]; //position X
ctrlSetText[1403, str (_mission select 0 select 1)]; //position Y
ctrlSetText[1404, str (_mission select 0 select 2)]; //position Z

lbSetCurSel[2102, 0]; //Icon
lbSetCurSel[2103, 0]; //Color

lbSetPicture[2102, 0, _mission select 1]; //Icon