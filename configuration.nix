{
  pkgs,
  ...
}:
{

  nixpkgs.config.allowUnfree = true;

  wsl = {
    enable = true;
    defaultUser = "james";

    startMenuLaunchers = true;
    useWindowsDriver = true;
    docker-desktop.enable = true;

    # usb passthrough
    usbip = {
      enable = true;
      autoAttach = [ ]; # add device IDs like "4-1" to auto-attach USB devices
    };

    wslConf = {
      automount.root = "/mnt";
      automount.options = "metadata,uid=1000,gid=100,noatime";
      boot.systemd = true;
      interop.enabled = true;
      interop.appendWindowsPath = true;
      network.generateHosts = true;
    };
  };

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # user configuration
  users.users.james = {
    isNormalUser = true;
    shell = pkgs.nushell; # nushell as default shell
    extraGroups = [
      "wheel" # sudo access
      "docker" # if using Docker
    ];
  };

  programs = {
  };

  services = {
    openssh.enable = true;
  };

  networking = {
    hostName = "nixos-wsl";
    firewall.enable = true;
  };

  time.timeZone = "Europe/Warsaw";

  i18n.defaultLocale = "en_US.UTF-8";

  # this value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. Don't change this after installation.
  system.stateVersion = "24.11";
}
