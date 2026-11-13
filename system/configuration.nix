{ config, stable, unstable, ... }:

{
	#boot

	boot.loader = {
		systemd-boot.enable = true;
		efi.canTouchEfiVariables = true;
	};

	#networking

	networking = {
		hostName = "dision";
		networkmanager.enable = true;
		firewall.enable = true;
	};

	#time zone

	time.timeZone = "America/Argentina/Buenos_Aires";

	#sound

	services.pulseaudio.enable = false;

	security.rtkit.enable = true;

	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

	#services, keyboard and drivers

	console.keyMap = "la-latin1";

	services.xserver = {
		enable = true;

		xkb = {
			layout = "latam";
			variant = "";
		};

		videoDrivers = ["nvidia"];
	};

	hardware.nvidia.open = false;

	hardware.graphics = {
		enable = true;
		enable32Bit = true;
	};

	#desktop

	services = {
		displayManager.ly.enable = true;
		xserver.desktopManager.xfce.enable = true;
	};

	#users

	users.users."dision" = {
		isNormalUser = true;
		description = "dision";
		extraGroups = [ "networkmanager" "wheel" ];
  	};

	#programs

	fonts.packages = [stable.jetbrains-mono];

	users.users."dision".packages = [

		#theming
		stable.arc-theme
		stable.elementary-xfce-icon-theme
		stable.kdePackages.breeze

		#apps
		stable.git
		stable.htop
		stable.fastfetch
		stable.aseprite
		stable.blender
		stable.librewolf
		stable.gpu-screen-recorder-gtk

		unstable.gram
	];

	#misc

	nix.settings.experimental-features = ["nix-command" "flakes"];

	nixpkgs.config.allowUnfree = true;

	system.stateVersion = "26.05";
}
