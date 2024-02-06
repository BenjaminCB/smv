{
    description = "Flake utils demo";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        flake-utils.url = "github:numtide/flake-utils";
    };

    outputs = { self, nixpkgs, flake-utils }:
        flake-utils.lib.eachDefaultSystem (system:
            let
                pkgs = nixpkgs.legacyPackages.${system};
            in {
                packages = {};

                devShells.default = pkgs.mkShell {
                    nativeBuildInputs = with pkgs; [
                        mermaid-cli
                        mermaid-filter
                        just
                        texlive.combined.scheme-full
                    ];

                    shellHook = ''
                    '';
                };
            }
        );
}

