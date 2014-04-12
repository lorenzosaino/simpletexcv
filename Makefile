SHELL = /bin/sh

CV_NAME    = cv
COVER_NAME = cover
PDFLATEX   = pdflatex

.PHONY: clean cv cover clean deepclean

all: cv cover

cv:
	$(PDFLATEX) $(CV_NAME).tex

cover:
	$(PDFLATEX) $(COVER_NAME).tex

clean:
	find . -name "*.log" | xargs rm -rf
	find . -name "*.aux" | xargs rm -rf
	find . -name "*.out" | xargs rm -rf
	find . -name "*.bbl" | xargs rm -rf
	find . -name "*.synctex.gz" | xargs rm -rf

deepclean: clean
	rm -f $(CV_NAME).pdf
	rm -f $(COVER_NAME).pdf


