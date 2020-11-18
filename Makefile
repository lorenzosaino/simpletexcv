SHELL = /bin/bash -euo pipefail

CV_NAME    = cv
COVER_NAME = cover
LATEXMK    = latexmk

DOCKER_IMAGE = blang/latex:ubuntu

.PHONY: all cv cover clean deepclean docker-%

all: cv cover

cv:
	$(LATEXMK) -dvi- -pdf -file-line-error -interaction=nonstopmode $(CV_NAME).tex

cover:
	$(LATEXMK) -dvi- -pdf -file-line-error -interaction=nonstopmode $(COVER_NAME).tex

clean:
	find . -name "*.log" -o -name "*.aux" -o -name "*.dvi" -o -name "*.bbl" -o -name "*.blg" -o -name "*.out" -o -name "*.toc" -o -name "*.lof" -o -name "*.brf" -o -name "*.lot" -o -name "*.ent" -o -name "*.fls" -o -name "*.fdb_latexmk" -o -name "*.synctex.gz" -o -name "*.*~" | xargs rm -rf

deepclean: clean
	rm -f {$(CV_NAME),$(COVER_NAME)}.pdf

# Execute any target inside a Docker container
docker-%:
	docker run --rm -i --user $(shell id -u):$(shell id -g) --network none -v "$(PWD)":/data $(DOCKER_IMAGE) make $*
