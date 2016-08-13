_unit = _this select 0;
_dist = _unit distance ATC_Controller;
_rnded_dist = floor _dist;
_all_pads = [pad1,pad2,pad3,pad4];
_openpads = selectRandom _all_pads;

hint parseText format ["<t size='1.25' color='#ff0000'>ATC Controller</t><br/><br/><t size='1.10'>Roger %1, <br/>Standby...</t>",name _unit];
sleep 5;
if (_rnded_dist > 500) exitWith 
{
	hintSilent parseText format ["<t size='1.25' color='#ff0000'>ATC Controller</t><br/><br/><t size='1.10'>%1, You are currently %2 meters from the field. <br/>Report less than 500 meters.</t>",name _unit, _rnded_dist];
	
};

padclearance1 = count nearestObjects [pad1, ["AIR"],10];
padclearance2 = count nearestObjects [pad2, ["AIR"],10];
padclearance3 = count nearestObjects [pad3, ["AIR"],10];
padclearance4 = count nearestObjects [pad4, ["AIR"],10];

if (padclearance1 == 0) exitWith {hint parseText format ["<t size='1.25' color='#ff0000'>ATC Controller</t><br/><br/><t size='1.10'>%1<br/>Cleared to Pad #1 at your own risk. <br/>Look for the blue lights</t>",name _unit];pad1cleared=1; 0 = [_this] execVM "ATC\PAD1.sqf"};
if (padclearance2 == 0) exitWith {hint parseText format ["<t size='1.25' color='#ff0000'>ATC Controller</t><br/><br/><t size='1.10'>%1<br/>Cleared to Pad #2 at your own risk.<br/>Look for the blue lights</t>",name _unit];pad2cleared=1; 0 = [_this] execVM "ATC\PAD2.sqf"};
if (padclearance3 == 0) exitWith {hint parseText format ["<t size='1.25' color='#ff0000'>ATC Controller</t><br/><br/><t size='1.10'>%1<br/>Cleared to Pad #3 at your own risk.<br/>Look for the blue lights</t>",name _unit];pad3cleared=1; 0 = [_this] execVM "ATC\PAD3.sqf"};
if (padclearance4 == 0) exitWith {hint parseText format ["<t size='1.25' color='#ff0000'>ATC Controller</t><br/><br/><t size='1.10'>%1<br/>Cleared to Pad #4 at your own risk.<br/>Look for the blue lights</t>",name _unit];pad4cleared=1; 0 = [_this] execVM "ATC\PAD4.sqf"};

hint parseText format ["<t size='1.25' color='#ff0000'>ATC Controller</t><br/><br/><t size='1.10'>%1<br/>Request denied at this time, all the pads are full.</t>",name _unit];
