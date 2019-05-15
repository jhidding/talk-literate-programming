while true
do
	inotifywait -e close_write README.md Makefile theme/*; make
done
