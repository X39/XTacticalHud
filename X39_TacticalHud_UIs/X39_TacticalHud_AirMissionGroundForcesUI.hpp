class RscText_AirMissionGroundForcesUI_Base: RscText
{
	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',1])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',1])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
}
class RscCombo_AirMissionGroundForcesUI_Base: RscCombo
{
	colorBackground[] = {0.5,0.5,0.5,1};
}
class IGUIBack_AirMissionGroundForcesUI_Base: IGUIBack
{
	colorBackground[] = {"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])", "(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])", "(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])", "(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"};
}
class X39_TacticalHud_AirMissionGroundForcesUI
{
	idd = 21125;
	movingEnable = true;
	onLoad = "uiNamespace setVariable[""X39_TacticalHud_AirMissionGroundForcesUI"", _this select 0];";
	onUnload = "uiNamespace setVariable[""X39_TacticalHud_AirMissionGroundForcesUI"", displayNull];";
	duration = 32000;
	fadeIn = 0;
	fadeOut = 0;
	enableSimulation = 1;
	controls[]=
	{
		IGUIBack_2203,
		IGUIBack_2202,
		IGUIBack_2201,
		IGUIBack_2200,
		RscListbox_1500,
		RscText_1050,
		RscText_1012,
		RscText_1011,
		RscText_1008,
		RscText_1007,
		RscText_1006,
		RscText_1005,
		RscText_1004,
		RscText_1003,
		RscText_1002,
		RscText_1001,
		RscText_1000,
		RscEdit_1400_CreateMission_PositionX,
		RscEdit_1401_CreateMission_PositionY,
		RscEdit_1402_CreateMission_PositionZ,
		RscCombo_2103_EditMission_Color,
		RscCombo_2102_EditMission_Icon,
		RscCombo_2101_CreateMission_MissionColor,
		RscCombo_2100_CreateMission_MissionIcon,
		RscButton_1602,
		RscButton_1601,
		RscButton_1600,
		RscButton_1603,
		RscText_1014,
		RscEdit_1406_EditMission_MissionName,
		RscEdit_1407_EditMission_PositionX,
		RscEdit_1403_EditMission_PositionY,
		RscEdit_1404_EditMission_PositionZ,
		RscText_1009,
		RscEdit_1405_CreateMission_MissionName
	};
	class IGUIBack_2203: IGUIBack_AirMissionGroundForcesUI_Base
	{
		idc = 2203;
		x = 0.505156 * safezoneW + safezoneX;
		y = 0.258 * safezoneH + safezoneY;
		w = 0.2475 * safezoneW;
		h = 0.242 * safezoneH;
	};
	class IGUIBack_2202: IGUIBack_AirMissionGroundForcesUI_Base
	{
		idc = 2202;
		x = 0.262812 * safezoneW + safezoneX;
		y = 0.544 * safezoneH + safezoneY;
		w = 0.237187 * safezoneW;
		h = 0.176 * safezoneH;
	};
	class IGUIBack_2201: IGUIBack_AirMissionGroundForcesUI_Base
	{
		idc = 2201;
		x = 0.505156 * safezoneW + safezoneX;
		y = 0.544 * safezoneH + safezoneY;
		w = 0.2475 * safezoneW;
		h = 0.176 * safezoneH;
	};
	class IGUIBack_2200: IGUIBack_AirMissionGroundForcesUI_Base
	{
		idc = 2200;
		x = 0.262812 * safezoneW + safezoneX;
		y = 0.258 * safezoneH + safezoneY;
		w = 0.237187 * safezoneW;
		h = 0.242 * safezoneH;
	};
	class RscListbox_1500: RscListbox
	{
		idc = 1500;
		x = 0.267969 * safezoneW + safezoneX;
		y = 0.269 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.187 * safezoneH;
	};
	class RscText_1050: RscText
	{
		idc = 1050;
		x = 0.510312 * safezoneW + safezoneX;
		y = 0.555 * safezoneH + safezoneY;
		w = 0.237187 * safezoneW;
		h = 0.154 * safezoneH;
	};
	class RscText_1012: RscText
	{
		idc = 1012;
		text = $STR_X39_TacticalHud_AirMissionGroundForcesUI_Color;
		x = 0.510312 * safezoneW + safezoneX;
		y = 0.368 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscText_1011: RscText
	{
		idc = 1011;
		text = $STR_X39_TacticalHud_AirMissionGroundForcesUI_Icon;
		x = 0.510312 * safezoneW + safezoneX;
		y = 0.335 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscText_1008: RscText
	{
		idc = 1008;
		text = $STR_X39_TacticalHud_AirMissionGroundForcesUI_Coordinates;
		x = 0.510312 * safezoneW + safezoneX;
		y = 0.302 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscText_1007: RscText
	{
		idc = 1007;
		text = $STR_X39_TacticalHud_AirMissionGroundForcesUI_Coordinates;
		x = 0.267969 * safezoneW + safezoneX;
		y = 0.654 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscText_1006: RscText
	{
		idc = 1006;
		text = $STR_X39_TacticalHud_AirMissionGroundForcesUI_Color;
		x = 0.267969 * safezoneW + safezoneX;
		y = 0.621 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscText_1005: RscText
	{
		idc = 1005;
		text = $STR_X39_TacticalHud_AirMissionGroundForcesUI_Icon;
		x = 0.267969 * safezoneW + safezoneX;
		y = 0.588 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscText_1004: RscText_AirMissionGroundForcesUI_Base
	{
		idc = 1004;
		text = $STR_X39_TacticalHud_AirMissionGroundForcesUI_TitleEditAirMission;
		x = 0.505156 * safezoneW + safezoneX;
		y = 0.225 * safezoneH + safezoneY;
		w = 0.2475 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscText_1003: RscText_AirMissionGroundForcesUI_Base
	{
		idc = 1003;
		text = $STR_X39_TacticalHud_AirMissionGroundForcesUI_TitleCreateAirMission;
		x = 0.262812 * safezoneW + safezoneX;
		y = 0.511 * safezoneH + safezoneY;
		w = 0.237187 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscText_1002: RscText_AirMissionGroundForcesUI_Base
	{
		idc = 1002;
		text = $STR_X39_TacticalHud_AirMissionGroundForcesUI_TitleInfoBox;
		x = 0.505156 * safezoneW + safezoneX;
		y = 0.511 * safezoneH + safezoneY;
		w = 0.2475 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscText_1001: RscText_AirMissionGroundForcesUI_Base
	{
		idc = 1001;
		text = $STR_X39_TacticalHud_AirMissionGroundForcesUI_TitleMissionList;
		x = 0.262812 * safezoneW + safezoneX;
		y = 0.225 * safezoneH + safezoneY;
		w = 0.237187 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscText_1000: RscText_AirMissionGroundForcesUI_Base
	{
		idc = 1000;
		text = $STR_X39_TacticalHud_AirMissionGroundForcesUI_Headline;
		x = 0.262812 * safezoneW + safezoneX;
		y = 0.192 * safezoneH + safezoneY;
		w = 0.489844 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscEdit_1402_CreateMission_PositionZ: RscEdit
	{
		idc = 1402;
		text = "0"; //--- ToDo: Localize;
		x = 0.443281 * safezoneW + safezoneX;
		y = 0.654 * safezoneH + safezoneY;
		w = 0.0515625 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscEdit_1401_CreateMission_PositionY: RscEdit
	{
		idc = 1401;
		text = "0"; //--- ToDo: Localize;
		x = 0.386562 * safezoneW + safezoneX;
		y = 0.654 * safezoneH + safezoneY;
		w = 0.0515625 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscEdit_1400_CreateMission_PositionX: RscEdit
	{
		idc = 1400;
		text = "0"; //--- ToDo: Localize;
		x = 0.329844 * safezoneW + safezoneX;
		y = 0.654 * safezoneH + safezoneY;
		w = 0.0515625 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscCombo_2103_EditMission_Color: RscCombo_AirMissionGroundForcesUI_Base
	{
		idc = 2103;
		x = 0.572187 * safezoneW + safezoneX;
		y = 0.368 * safezoneH + safezoneY;
		w = 0.175313 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscCombo_2102_EditMission_Icon: RscCombo_AirMissionGroundForcesUI_Base
	{
		idc = 2102;
		x = 0.572187 * safezoneW + safezoneX;
		y = 0.335 * safezoneH + safezoneY;
		w = 0.175313 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscCombo_2101_CreateMission_MissionColor: RscCombo_AirMissionGroundForcesUI_Base
	{
		idc = 2101;
		x = 0.329844 * safezoneW + safezoneX;
		y = 0.621 * safezoneH + safezoneY;
		w = 0.165 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscCombo_2100_CreateMission_MissionIcon: RscCombo_AirMissionGroundForcesUI_Base
	{
		idc = 2100;
		x = 0.329844 * safezoneW + safezoneX;
		y = 0.588 * safezoneH + safezoneY;
		w = 0.165 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscButton_1602: RscButton
	{
		idc = 1602;
		text = $STR_X39_TacticalHud_AirMissionGroundForcesUI_btnUpdateMission;
		x = 0.572186 * safezoneW + safezoneX;
		y = 0.401 * safezoneH + safezoneY;
		w = 0.175313 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscButton_1601: RscButton
	{
		idc = 1601;
		text = $STR_X39_TacticalHud_AirMissionGroundForcesUI_btnCreateMission;
		x = 0.267969 * safezoneW + safezoneX;
		y = 0.687 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscButton_1600: RscButton
	{
		idc = 1600;
		text = $STR_X39_TacticalHud_AirMissionGroundForcesUI_btnDeleteMission;
		x = 0.572187 * safezoneW + safezoneX;
		y = 0.467 * safezoneH + safezoneY;
		w = 0.175313 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscButton_1603: RscButton
	{
		idc = 1603;
		text = $STR_X39_TacticalHud_AirMissionGroundForcesUI_btnRefreshMissionList;
		x = 0.267969 * safezoneW + safezoneX;
		y = 0.467 * safezoneH + safezoneY;
		w = 0.226875 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscText_1014: RscText
	{
		idc = 1014;
		text = $STR_X39_TacticalHud_AirMissionGroundForcesUI_Name;
		x = 0.510312 * safezoneW + safezoneX;
		y = 0.269 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscEdit_1406_EditMission_MissionName: RscEdit
	{
		idc = 1406;
		x = 0.572187 * safezoneW + safezoneX;
		y = 0.269 * safezoneH + safezoneY;
		w = 0.175313 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscEdit_1407_EditMission_PositionX: RscEdit
	{
		idc = 1407;
		text = "0"; //--- ToDo: Localize;
		x = 0.572187 * safezoneW + safezoneX;
		y = 0.302 * safezoneH + safezoneY;
		w = 0.0515625 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscEdit_1403_EditMission_PositionY: RscEdit
	{
		idc = 1403;
		text = "0"; //--- ToDo: Localize;
		x = 0.634062 * safezoneW + safezoneX;
		y = 0.302 * safezoneH + safezoneY;
		w = 0.0515625 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscEdit_1404_EditMission_PositionZ: RscEdit
	{
		idc = 1404;
		text = "0"; //--- ToDo: Localize;
		x = 0.695937 * safezoneW + safezoneX;
		y = 0.302 * safezoneH + safezoneY;
		w = 0.0515625 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscText_1009: RscText
	{
		idc = 1009;
		text = $STR_X39_TacticalHud_AirMissionGroundForcesUI_Name;
		x = 0.267969 * safezoneW + safezoneX;
		y = 0.555 * safezoneH + safezoneY;
		w = 0.0567187 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class RscEdit_1405_CreateMission_MissionName: RscEdit
	{
		idc = 1405;
		x = 0.329844 * safezoneW + safezoneX;
		y = 0.555 * safezoneH + safezoneY;
		w = 0.165 * safezoneW;
		h = 0.022 * safezoneH;
	};
};