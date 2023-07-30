{
  description = "A very basic flake";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/";

  outputs = { self, nixpkgs, ... }@inputs: with inputs;
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};

    in {

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

    devShells.default = pkgs.mkShell {
      packages = [
        pkgs.nodePackages.npm
        pkgs.nodePackages.rollup
        pkgs.direnv
        pkgs.nodePackages.http-server
      ];
    };

    });
}
