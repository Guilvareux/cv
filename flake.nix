{
	description = "A flake for cv template builder";

	inputs = {
		nixpkgs.url = "github:/NixOS/nixpkgs";
	};

	outputs = { self, nixpkgs }:
	let
		pkgs = import nixpkgs {
			system = "x86_64-linux";
			config = {
				allowUnfree = true;
			};
		};

		mytexlive = pkgs.texliveSmall.withPackages (ps: [
				ps.appendix
				ps.lipsum
				ps.ly1
				ps.logreq
				ps.dashrule
				ps.ifmtarg
				ps.svg
				ps.transparent 
				ps.trimspaces 
				ps.xkeyval
				ps.textpos 
				ps.clearsans 
				ps.fontaxes 
				ps.titlesec 
				ps.graphbox 
				ps.fontawesome 
				ps.pgf 
				ps.academicons 
				ps.xhfill 
				ps.moresize 
				ps.raleway 
				ps.smartdiagram 
				ps.xstring
		]);

	in {

		#packages.x86_64-linux.default = package;
		devShell.x86_64-linux = pkgs.mkShell {
			buildInputs = [ 
				mytexlive
			];
		};

	};
}
