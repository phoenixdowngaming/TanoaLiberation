hint "lawnmower";
_pos = getpos lawnmower;
_rad = 30;


_objs =  nearestObjects [_pos, [], _rad];

{
	if (_x != player) then {
		deleteCollection _x;
	};
} forEach _objs;
