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

		chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable"
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
				chaotic.nixosModules.nyx-cache
        chaotic.nixosModules.nyx-overlay
        chaotic.nixosModules.nyx-registry
			];
		};
		formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
	};
}
