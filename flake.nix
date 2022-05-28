{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            cmake
            bzip2
            ccache
            dtc
            dfu-util
            libtool
            ninja
            xz
            python3Packages.west
          ];
        };
      });
}
