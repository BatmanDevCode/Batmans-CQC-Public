private _projectiles = player getVariable ["CQC_player_activeProjectiles", []];

private _activeProjectiles = [];

if (count _projectiles > 0) then {
    {
        if (_x inArea "CM_airtank") then {
            _activeProjectiles pushback _x;
        } else {
            deleteVehicle _x;
        }
    } forEach _projectiles;
};

player setVariable ["CQC_player_activeProjectiles", _activeProjectiles];