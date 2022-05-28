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
            gcc-arm-embedded
            cmake
            bzip2
            ccache
            dtc
            dfu-util
            libtool
            ninja
            gperf
            xz
            (python3.withPackages (p: with p; [
              pyelftools
              pyyaml
              pykwalify
              canopen
              packaging
              progress
              psutil
              #pylink-square
              intelhex
              west
            ]))
            qemu
          ];
        };
      });
}
