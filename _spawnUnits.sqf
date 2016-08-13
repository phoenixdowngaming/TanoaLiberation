_posINF = getMarkerPos "PatrolINF";
_cfgGroup = configfile >> "CfgGroups" >> "East" >> "OPF_T_F" >> "SpecOps" >> "O_T_ViperTeam";
_group = [_posINF, EAST, _cfgGroup] call BIS_fnc_spawnGroup;
[_group,_posINF, 1000] call BIS_fnc_taskPatrol;
_diag_INF = "XIAN'S VIPER PATROL SPAWNED";
diag_log _diag_INF;
