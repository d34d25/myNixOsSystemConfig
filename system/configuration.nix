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

	#time zone, locale

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

	#services, drivers & keyboard
	
	console.keyMap = "la-latin1";
	
	services.xserver = {
	
		enable = true;
		
		xkb = {
			layout = "latam";
			variant = "";
		};
		
		autoRepeatDelay = 200;
		autoRepeatInterval = 35;
		
		videoDrivers = ["nvidia"];
	
	};
	
	hardware.nvidia.open = false;
	
	hardware.graphics = {
		enable = true;
		enable32Bit = true;
	};

	#sound
	
	services.pulseaudio.enable = false;
	
	security.rtkit.enable = true;
	
  	services.pipewire = {
    		enable = true;
    		alsa.enable = true;
    		alsa.support32Bit = true;
    		pulse.enable = true;
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
