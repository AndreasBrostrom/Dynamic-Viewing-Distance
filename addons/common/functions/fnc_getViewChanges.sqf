#include "script_component.hpp";

if (player iskindof "man" && isNull objectParent player) then {
    call FUNC(handleMan);
};

if (vehicle player iskindof "Air") then {
    call FUNC(handleAircraft);
};