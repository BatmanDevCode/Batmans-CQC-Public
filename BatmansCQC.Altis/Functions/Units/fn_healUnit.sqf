/*
 File: fn_healUnit.sqf
 Author: FragS 
 Description: Heals local unit
*/

for "_i" from (GetDammage player) to -0.01 step -0.01 do {
    player setDamage _i;
};