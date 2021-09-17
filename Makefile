ifeq ($(OS), Windows_NT)
	remove = del /s
	magick = magick.exe convert
	sep = \\
else
	remove = rm -f
	magick = convert
	sep = /
endif

file = example.tex
out = example
tex_dir = tex


all: presentation


presentation: $(file) 
	latexmk -synctex=1 -bibtex -interaction=nonstopmode -file-line-error -pdf $(basename $(file)) -jobname=$(out)
	$(MAKE) clean


.PHONY: clean
clean:
	$(remove) $(out).blg
	$(remove) $(out).fls
	$(remove) $(out).log
	$(remove) $(out).out
	$(remove) $(out).snm
	$(remove) $(out).synctex.gz


.PHONY: cleanall
cleanall: clean
	@$(remove) $(out).aux
	@$(remove) $(out).fdb_latexmk
	@$(remove) $(out).bbl
	@$(remove) $(out).nav
	@$(remove) $(out).toc
