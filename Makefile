revealjs_url = .
theme = nlesc
source = README.md

.PHONY: all

all: reveal.js/index.html reveal.js/css/theme/source/nlesc.scss reveal.js/img

reveal.js/index.html: reveal.js README.md Makefile
	pandoc -t revealjs -s -o ./reveal.js/index.html \
		$(source) --mathjax \
		-V revealjs-url=$(revealjs_url) \
		-V theme=$(theme)

reveal.js/img: | reveal.js img
	cd reveal.js && ln -s ../img .

reveal.js/css/theme/source/nlesc.scss: reveal.js theme/nlesc.scss
	cp theme/nlesc.scss reveal.js/css/theme/source

reveal.js:
	git clone https://github.com/hakimel/reveal.js.git
	cd reveal.js && npm install
