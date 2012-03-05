
PLOTS=$(patsubst %.eps, %.pdf,$(wildcard src/*.eps))

handin2.pdf: handin2.tex $(PLOTS)
	@pdflatex handin2.tex 
	@pdflatex handin2.tex

$(PLOTS): %.pdf: %.eps
	epstopdf $<


clean:
	@rm -rfv handin2.aux handin2.log

clean-all: clean
	@rm -rfv $(PLOTS) handin2.pdf 

.PHONY: clean clean-all
