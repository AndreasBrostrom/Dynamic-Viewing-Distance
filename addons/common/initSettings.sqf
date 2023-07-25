private _category = LSTRING(Category);

[
    QGVAR(debug), "CHECKBOX",
    LSTRING(DebugMode),
    _category,
    true,
    0
] call CBA_fnc_addSetting;