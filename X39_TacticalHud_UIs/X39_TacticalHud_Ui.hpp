#define WIDTH 0.025
class X39_TacticalHud_Ui
{
	idd = 21124;
	movingEnable = true;
	onLoad = "uiNamespace setVariable[""X39_TacticalHud_Ui"", _this select 0];";
	onUnload = "uiNamespace setVariable[""X39_TacticalHud_Ui"", displayNull];";
	duration = 32000;
	fadeIn = 0;
	fadeOut = 0;
	enableSimulation = 1;
	controls[]=
	{
		IGUIBack_2200_Angle,
		Direction_Letters,
		Direction_Numeric,
		IGUIBack_2201_GridLocation,
		Grid_Text
	};
	class IGUIBack_2200_Angle: IGUIBack
	{
		idc = 2200;
		//x = 0.473594 * safezoneW + safezoneX;
		x = safeZoneX + (safeZoneW / 2 - ((abs safeZoneX + safeZoneW) * WIDTH));
		y = 0.016 * safezoneH + safezoneY;
		//w = 0.0670312 * safezoneW;
		w = ((abs safeZoneX + safeZoneW) * WIDTH) * 2;
		h = 0.033 * safezoneH;
	};
	class Direction_Letters: RscText
	{
		idc = 1000;
		text = "---";
		//x = 0.47875 * safezoneW + safezoneX;
		x = safeZoneX + (safeZoneW / 2 - ((abs safeZoneX + safeZoneW) * WIDTH));
		y = 0.016 * safezoneH + safezoneY;
		//w = 0.0257812 * safezoneW;
		w = ((abs safeZoneX + safeZoneW) * WIDTH);
		h = 0.033 * safezoneH;
		style = 0x02; //Center text
	};
	class Direction_Numeric: RscText
	{
		idc = 1001;
		text = "---°";
		//x = 0.509687 * safezoneW + safezoneX;
		x = safeZoneX + (safeZoneW / 2);
		y = 0.016 * safezoneH + safezoneY;
		//w = 0.0257812 * safezoneW;
		w = ((abs safeZoneX + safeZoneW) * WIDTH);
		h = 0.033 * safezoneH;
		style = 0x02; //Center text
	};
	class IGUIBack_2201_GridLocation: IGUIBack
	{
		idc = 2201;
		//x = 0.473594 * safezoneW + safezoneX;
		x = safeZoneX + (safeZoneW / 2 - ((abs safeZoneX + safeZoneW) * WIDTH));
		y = (0.016 * safezoneH + safezoneY) + (0.033 * safezoneH);
		//w = 0.0670312 * safezoneW;
		w = ((abs safeZoneX + safeZoneW) * WIDTH) * 2;
		h = 0.033 * safezoneH;
		style = 0x02; //Center text
	};
	class Grid_Text: RscText
	{
		idc = 1002;
		text = "0000 0000";
		//x = 0.47875 * safezoneW + safezoneX;
		x = safeZoneX + (safeZoneW / 2 - ((abs safeZoneX + safeZoneW) * WIDTH));
		y = (0.016 * safezoneH + safezoneY) + (0.033 * safezoneH);
		//w = 0.0257812 * safezoneW;
		w = ((abs safeZoneX + safeZoneW) * WIDTH) * 2;
		h = 0.033 * safezoneH;
		style = 0x02; //Center text
	};
};