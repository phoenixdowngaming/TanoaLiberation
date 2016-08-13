private ["_veh"];
_veh = _this select 0;
_dist = 10;

if (vehicle player==player) exitWith {};

if ((_veh distance pad1) < 5) then 
	{
		{_x setObjectTexture [0,"#(rgb,8,8,3)color(0,1,0,1)"];} foreach pad_spheres1;
		sleep 0.2;
		{_x setObjectTexture [0,"#(rgb,8,8,3)color(0,0,1,1)"];} foreach pad_spheres1;
		sleep 0.2;
		{_x setObjectTexture [0,"#(rgb,8,8,3)color(0,1,0,1)"];} foreach pad_spheres1;
		sleep 0.2;
		{_x setObjectTexture [0,"#(rgb,8,8,3)color(1,1,0,1)"];} foreach pad_spheres1;
		sleep 1;
		{_x setObjectTexture [0,"#(rgb,8,8,3)color(1,0,0,1)"];} foreach pad_spheres1;			
		if (_veh isKindOf "ParachuteBase" || !alive _veh) exitWith {};
		if (!(_veh isKindOf "helicopter")) exitWith 
			{ 
				_veh vehicleChat "This pad is for helicopter service only"; 
			};
		_veh vehicleChat "Servicing aircraft, please wait ...";
		_veh setFuel 0;
		//---------- RE-ARMING
		sleep 10;
		_veh vehicleChat "Re-arming ...";
		//---------- REPAIRING
		sleep 10;
		_veh vehicleChat "Repairing ...";
		//---------- REFUELING
		sleep 10;
		_veh vehicleChat "Refueling ...";
		//---------- FINISHED
		sleep 10;
		_veh setDamage 0;
		_veh vehicleChat "Repaired (100%).";
		_veh setVehicleAmmo 1;
		_veh vehicleChat "Re-armed (100%).";
		_veh setFuel 1;
		_veh vehicleChat "Refuelled (100%).";
		{_x setObjectTexture [0,"#(rgb,8,8,3)color(1,1,0,1)"];} foreach pad_spheres1;
		sleep 2;
		_veh vehicleChat "Service complete.";		
		{_x setObjectTexture [0,"#(rgb,8,8,3)color(0,1,0,1)"];} foreach pad_spheres1;
		sleep 2;
		{deleteVehicle _x} forEach pad_spheres1;	
	};



	
	
	
	
	
	