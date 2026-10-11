{config, stable, unstable, ...}:
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

	#users

	users.users."dision" = {
		isNormalUser = true;
		description = "dision";
		extraGroups = [ "networkmanager" "wheel"];
		packages = [];
	};

	#time zone / locale

	time.timeZone = "America/Argentina/Buenos_Aires";

	i18n.defaultLocale = "en_US.UTF-8";

  	i18n.extraLocaleSettings = {
    		LC_ADDRESS = "en_US.UTF-8";
    		LC_IDENTIFICATION = "en_US.UTF-8";
    		LC_MEASUREMENT = "en_US.UTF-8";
    		LC_MONETARY = "en_US.UTF-8";
    		LC_NAME = "en_US.UTF-8";
    		LC_NUMERIC = "en_US.UTF-8";
    		LC_PAPER = "en_US.UTF-8";
    		LC_TELEPHONE = "en_US.UTF-8";
    		LC_TIME = "en_US.UTF-8";
  	};

	#sound
	
	security.rtkit.enable = true;

	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

	#services & drivers & keyboard

	console.keyMap = "la-latin1";

	services.xserver = {
	
		enable = true;
		videoDrivers = ["nvidia"];
		
		autoRepeatDelay = 200;
		autoRepeatInterval = 35;

		xkb = {
			layout = "latam";
    			variant = "";
		};
		
	};

	hardware.nvidia = {
		open = true;
		package = config.boot.kernelPackages.nvidiaPackages.production;
	};

	services = {
		desktopManager.gnome.enable = true;

		displayManager.gdm.enable = true;
	};

	programs.dconf.enable = true;

	programs.dconf.profiles.user.databases = [

		{
			settings = {
				"org/gnome/desktop/wm/preferences" = {
					button-layout = "appmenu:minimize,maximize,close"; #adds minimize, maximize and close buttons to windows in gnome
				};
			};
		}	

	];

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

		stable.gpu-screen-recorder-gtk

	];

	#misc

	nixpkgs.config.allowUnfree = true;

	nix.settings.experimental-features = ["nix-command" "flakes"];

	system.stateVersion = "26.05";

}
