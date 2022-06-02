{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nix-zmk.url = "github:eraserhd/nix-zmk";
    nix-zmk.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, flake-utils, nixpkgs, nix-zmk }:
    flake-utils.lib.eachDefaultSystem (system: {
      devShells.default = nix-zmk.lib.devShell { inherit system; };
      packages.default = nix-zmk.lib.firmwarePackage {
        inherit system;
        name = "corne-firmware";
        board = "nice_nano";
        shields = [ "corne_left" "corne_right" ];
        config = ./config;
        zmk = ./.;
      };
    });
}
