Add the file fn_markers.sqf into a3_infiSTAR_Exile_customApps\apps

Add

class markers {};

into class apps in config.cpp

Add

class customapp_1 {
	submenu = 0;
	toggleable = 1;
	text = "3d trader markers";
	tooltip = "Turn trader zone 3d markers on or off";
	fnc = "call apps_fnc_markers;";
	pic = "\exile_assets\texture\insignia\exile_co.paa";
};

into app_defines.hpp (change app number if req)