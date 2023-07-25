#include "script_component.hpp";

if (player iskindof "man" && isNull objectParent player) then {
    call FUNC(infantry,handle);
};

if (vehicle player iskindof "air") then {
    call EFUNC(aircraft,handle);
};