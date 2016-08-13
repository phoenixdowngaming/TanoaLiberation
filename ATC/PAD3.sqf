{deleteVehicle _x} forEach pad_spheres3;	
pad_spheres3 = [];
_dist = 10;
_lightcheck = time + 90;

while { count pad_spheres3 < 42 } do 
{
	pad_spheres3 pushback ( "Sign_Sphere100cm_F" createVehicleLocal [0,0,0]);
};

{ _x setObjectTexture [0,"#(rgb,8,8,3)color(0,0.1,1,1)"];} foreach pad_spheres3;

while {true} do 
	{
		_sphere_idx = 0;
		{
			_x setpos ([pad3,_dist,_sphere_idx * 10 ] call BIS_fnc_relPos );
			_sphere_idx = _sphere_idx + 1;
		} foreach pad_spheres3;
		if (time >= _lightcheck) exitWith {{deleteVehicle _x} forEach pad_spheres3;};
	};