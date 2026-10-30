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

	# time zone

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

	#services, drivers and keyboard

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
		desktopManager.gnome.enable = true;
		displayManager.gdm.enable = true;
	};

	#users

	users.users."dision" = {
		isNormalUser = true;
		description = "dision";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = [];
	};

	#programs

	programs.vscode = {
		enable = true;
		package = stable.vscode;
		extensions = [stable.vscode-extensions.ms-vscode.cpptools];
	};

	environment.systemPackages = [

		stable.git
		stable.htop
		stable.fastfetch
		stable.aseprite
		stable.blender
		stable.librewolf

	];

	#misc

	nix.settings.experimental-features = ["nix-command" "flakes"];	

	nixpkgs.config.allowUnfree = true;

	system.stateVersion = "26.05";
}
