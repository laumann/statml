
PLOTS=$(patsubst %.eps, %.pdf,$(wildcard src/*.eps))

handin2.pdf: handin2.tex $(PLOTS)
	@pdflatex handin2.tex 
	@pdflatex handin2.tex

$(PLOTS): %.pdf: %.eps
	@echo $< -> $@
	@epstopdf $<

clean:
	@rm -rfv $(PLOTS) handin2.pdf handin2.aux handin2.log
