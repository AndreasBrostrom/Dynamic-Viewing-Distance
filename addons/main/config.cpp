#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "cba_ui",
            "cba_xeh",
            "cba_jr"
        };
        author = CSTRING(Team);
        authors[] = {"Brostrom.A (Evul)"};
        url = CSTRING(Url);
        VERSION_CONFIG;
    };
};

class CfgMods {
    class PREFIX {
        dir = "@DynamicViewingDistance";
        name = "Dynamic Viewing Distance System";
        picture = "A3\Ui_f\data\Logos\arma3_expansion_alpha_ca";
        hidePicture = "true";
        hideName = "true";
        actionName = "Website";
        action = CSTRING(Url);
        description = "";
    };
};

#include "CfgSettings.hpp"
