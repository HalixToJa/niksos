{
	description = "Basic NixOS Flake";
	inputs = {
		nixpkgs.url = "nixpkgs/nixos-26.05";

		hjem = {
			url = "github:feel-co/hjem";
			inputs = {
				nixpkgs.follows = "nixpkgs";
			};
		};
	};

	outputs = { nixpkgs, hjem, ... } @ inputs: let
		system = "x86_64-linux";
	in {
		nixosConfigurations.zenbook = nixpkgs.lib.nixosSystem {
			inherit system;
			pkgs = import nixpkgs {
				system = "x86_64-linux";
				config.allowUnfree = true;
			};
			specialArgs = {inherit inputs;};
			modules = [
				./configuration.nix
				./overlays/default.nix
				hjem.nixosModules.default
			];
		};
		formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
	};
}
