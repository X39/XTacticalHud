class X39_TacticalHud_MFD
{
	idd = 21126;
	movingEnable = true;
	onLoad = "uiNamespace setVariable[""X39_TacticalHud_MFD"", _this select 0];";
	onUnload = "uiNamespace setVariable[""X39_TacticalHud_MFD"", displayNull];";
	duration = 32000;
	fadeIn = 0;
	fadeOut = 0;
	enableSimulation = 1;
	controls[]=
	{
		RscPicture_1200,
		RscText_1000
	};
	class RscPicture_1200: RscPicture
	{
		idc = 1200;
		text = "\X39_TacticalHud_Res\res\uiElemets\MFD\MFD_BlackBack.paa";
		x = 0.005 * safezoneW + safezoneX;
		y = 0.5 * safezoneH + safezoneY;
		w = 0.278437 * safezoneW;
		h = 0.495 * safezoneH;
	};
	class RscText_1000: RscStructuredText
	{
		idc = 1000;
		text = "1"; //--- ToDo: Localize;
		x = 0.0359375 * safezoneW + safezoneX;
		y = 0.544 * safezoneH + safezoneY;
		w = 0.216563 * safezoneW;
		h = 0.396 * safezoneH;
	};
};