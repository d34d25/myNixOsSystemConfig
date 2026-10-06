{
	description = "docker flake file";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
	};

	outputs = {self, nixpkgs}:
	let
		system = "x86_64-linux";

		pkgs = import nixpkgs {inherit system;};
	in
	{
		packages."${system}".default = pkgs.dockerTools.buildLayeredImage {

			name = "name";
			tag = "tag";
			contents = [];

		};
	};
}
