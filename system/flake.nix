{
	description = "flake for the system config";
	
	inputs = {
		nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";
		
		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
	};
	
	outputs = {self, nixpkgs-stable, nixpkgs-unstable, ...} @inputs:
	let
		system = "x86_64-linux";
		
		stable = import nixpkgs-stable {inherit system; config.allowUnfree = true;};
		
		unstable = import nixpkgs-unstable {inherit system; config.allowUnfree = true;};
	in
	{
		nixosConfigurations.dev = nixpkgs-unstable.lib.nixosSystem {
			
			specialArgs = {inherit inputs stable unstable;};
			
			modules = [./hardware-configuration.nix ./configuration.nix];
		};
	};

}
