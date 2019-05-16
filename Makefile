revealjs_url = .
theme = nlesc
source = README.md

.PHONY: all

all: reveal.js/index.html reveal.js/css/theme/source/nlesc.scss reveal.js/img

pages: docs docs/img docs/index.html docs/nlesc.css

reveal.js/index.html: reveal.js $(source) Makefile
	pandoc -t revealjs -s -o ./reveal.js/index.html \
		$(source) --mathjax \
		-V revealjs-url=$(revealjs_url) \
		-V theme=$(theme)

reveal.js/img: | reveal.js img
	cd reveal.js && ln -s ../img .

reveal.js/css/theme/source/nlesc.scss: reveal.js theme/nlesc.scss
	cp theme/nlesc.scss reveal.js/css/theme/source

reveal.js/css/theme/nlesc.css: reveal.js/css/theme/source/nlesc.scss
	cd reveal.js && npm run build -- css-themes

reveal.js:
	git clone https://github.com/hakimel/reveal.js.git
	cd reveal.js && npm install

docs:
	mkdir docs
	touch docs/.nojekyll

docs/img: img
	cp -r img docs

docs/nlesc.css: reveal.js/css/theme/nlesc.css docs
	cp reveal.js/css/theme/nlesc.css docs

docs/index.html: $(source) Makefile reveal.js/css/theme/nlesc.css docs
	pandoc -t revealjs -s -o ./docs/index.html \
		$(source) --mathjax \
		-V revealjs-url=https://revealjs.com \
		--css nlesc.css
