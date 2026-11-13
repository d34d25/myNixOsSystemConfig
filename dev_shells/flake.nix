#from: https://github.com/raysan5/raylib/wiki/Working-on-GNU-Linux

{
	description = "Raylib development environment";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-26.05";
	};

	outputs = {self, nixpkgs, ...}:
	let
		system = "x86_64-linux";

		pkgs = import nixpkgs {inherit system;};
	in
	{
		devShells."${system}".default = pkgs.mkShell {

			packages = with pkgs; [
		
				#my additions
				raylib
				gcc
				gdb
				python3
				gnumake
				clang-tools
				#-------------
		
				libGL

				# X11 dependencies
				libx11
				libx11.dev
				libxcursor
				libxi
				libxinerama
				libxrandr

				#web support
				emscripten
			];

			# Audio dependencies
			LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [pkgs.alsa-lib];
		};
	};
}
