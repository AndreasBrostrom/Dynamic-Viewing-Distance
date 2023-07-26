private _category = LSTRING(Category);

[
    QEGVAR(setting,debug), "CHECKBOX",
    [LSTRING(Debug), LSTRING(Debug_Desc)],
    [_category, LSTRING(development)],
    true,
    0
] call CBA_fnc_addSetting;

[
    QEGVAR(setting,fps), "CHECKBOX",
    [LSTRING(Fps), LSTRING(Fps_Desc)],
    [_category, LSTRING(performence)],
    false,
    0
] call CBA_fnc_addSetting;