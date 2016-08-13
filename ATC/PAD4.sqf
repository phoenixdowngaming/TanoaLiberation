{deleteVehicle _x} forEach pad_spheres4;	
pad_spheres4 = [];
_dist = 10;
_lightcheck = time + 90;

while { count pad_spheres4 < 42 } do 
{
	pad_spheres4 pushback ( "Sign_Sphere100cm_F" createVehicleLocal [0,0,0]);
};

{ _x setObjectTexture [0,"#(rgb,8,8,3)color(0,0.1,1,1)"];} foreach pad_spheres4;

while {true} do 
	{
		_sphere_idx = 0;
		{
			_x setpos ([pad4,_dist,_sphere_idx * 10 ] call BIS_fnc_relPos );
			_sphere_idx = _sphere_idx + 1;
		} foreach pad_spheres4;
		if (time >= _lightcheck) exitWith {{deleteVehicle _x} forEach pad_spheres4;};
	};