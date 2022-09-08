0 setFog 0;
0 setOvercast 0;

skipTime 1;

_date = date;
_date set [3, (_date select 3) - 1];
setDate _date;

[] spawn {
	while {true} do {
		0 setOvercast 0;
		
		if (sunormoon < 0) then {
			SkipTime 6;
		};

		sleep 1;
	};
};