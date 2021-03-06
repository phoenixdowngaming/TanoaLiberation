enableSaving [ false, false ];

pad1cleared = 0;
pad2cleared = 0;
pad3cleared = 0;
pad4cleared = 0;

[] call compileFinal preprocessFileLineNumbers "scripts\shared\atlas_manager.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\liberation_functions.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\init_sectors.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\fetch_params.sqf";
[] call compileFinal preprocessFileLineNUmbers "gameplay_constants.sqf";
[] call compileFinal preprocessFileLineNUmbers "classnames_extension.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\classnames.sqf";

[] execVM "PDG\zlt_fieldrepair.sqf";
[] execVM "scripts\sa_ropes.sqf";
[] execVM "scripts\lawnmower.sqf";

if ( GRLIB_revive > 0 ) then {
	[] execVM "FAR_revive\FAR_revive_init.sqf";
};
[] execVM "GREUH\scripts\GREUH_activate.sqf";
[] call compileFinal preprocessfilelinenumbers "scripts\shared\init_shared.sqf";

if (isServer) then {
	[] call compileFinal preprocessFileLineNumbers "scripts\server\init_server.sqf";
};

if (!hasInterface && isMultiplayer) then {
	[] spawn compileFinal preprocessFileLineNumbers "scripts\server\offloading\hc_manager.sqf";
};

if (!isDedicated && hasInterface) then {
	waitUntil { alive player };
	[] call compileFinal preprocessFileLineNumbers "scripts\client\init_client.sqf";
} else {
	setViewDistance 1600;
};

{
	if (side _x == civilian) then 
	{
		_x addEventHandler ["FiredNear", 
			 {
				_shooter = _this select 1;
				_distance = _this select 2;
				if (_distance < 21) then {[_this select 0,_this select 1] execVM "scripts\concealed_carry.sqf"} else {};
			 } 
		];
	}
} forEach AllUnits;
