default:
	just --list

build:
	nix develop --impure --command pdflatex cv.tex
