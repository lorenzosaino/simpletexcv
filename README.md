# Simple TeX CV
Simple yet tasteful LaTeX templates of CV and cover letter with matching styles.

These templates are based on the `letter` class and all code is included in the `cover.tex` and `cv.tex` files. Although the lack of a dedicated `.cls` file is not a prime example of good LaTeX coding practices, these templates provide anyway good decoupling between formatting and content and they are easy to understand.

## Build
This project provides a `Makefile` to build CV and cover letter using `pdflatex`. The supported targets are:

 * `all`: build CV and cover letter
 * `cv`: build CV
 * `cover`: build cover letter
 * `clean`: remove temporary files created by `pdflatex` (i.e. `*.out`, `*.log` and so on)
 * `deepclean`: remove all files removed by `clean` as well as the compiled PDF files of CV and cover letter

## License
These templates are released under the terms of the MIT license. See `LICENSE.txt`