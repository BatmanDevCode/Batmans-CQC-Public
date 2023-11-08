params [["_excludeDisplays", [], [[]]]];

private _excludedDisplays = [0, 8, 18, 12, 46, 70];

if (count _excludeDisplays > 0) then {
	{
		_excludedDisplays pushBackUnique _x;
	} forEach _excludeDisplays;
};

{
	if !(ctrlIDD _x in _excludedDisplays) then {
		_x closeDisplay 2;
	};
} forEach allDisplays;