.PHONY: tangle weave

template := pandoc-bootstrap-template/template.html
style := pandoc-bootstrap-template/template.css
weave_args += -t html5 --filter pandoc-test --filter pandoc-fignos \
	 --template $(template) --css $(style) --toc -s

src/ca.jl: demo.md
	pandoc -t plain --filter pandoc-tangle demo.md

plot.png: src/ca.jl Makefile
	gnuplot -e "set term png size 1200,600; \
	set output 'plot.png'; \
	set xrange [0:512]; set yrange [0:256]; \
	plot '< julia src/ca.jl' matrix w image"

weave: plot.png demo.md
	pandoc $(weave_args) demo.md --output index.html

