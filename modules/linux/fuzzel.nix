{ config, lib, ... }: let
  inherit (lib) mkIf enabled;
in mkIf config.isDesktop {

  home-manager.sharedModules = [{
    services.cliphist = enabled {
      extraOptions = [ "-max-items" "1000" ];
    };

    programs.fuzzel = with config.theme; enabled {
      settings.main = {
        icon-theme = icons.name;
        font       = "${font.mono.name}:size=${toString font.size.small}";
        layer      = "overlay";
        prompt     = ''"❯ "'';
        terminal   = "kitty";
        output     = if config.networking.hostName == "yuzu" then "DP-1" else null;

        horizontal-pad = padding;
        vertical-pad   = padding;
      };
      settings.colors = {
        background = colors.base00 + "FF";

      };
      settings.border = {
        radius = radius;
        width  = border;
      };
    };
  }];
}
