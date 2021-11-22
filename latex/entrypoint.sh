#!/bin/sh

pdflatex -halt-on-error expose.tex # generate first time without bib
bibtex expose
pdflatex -halt-on-error expose.tex # generate with bib references
pdflatex -halt-on-error -output-directory out expose.tex # just in case if references broke page numbering

latexdiff old_expose.tex expose.tex > diff.tex
pdflatex -halt-on-error diff.tex # generate first time without bib
bibtex diff
pdflatex -halt-on-error -output-directory out diff.tex # generate with bib references