CC=mads
FLAGS=-l -t

all: clean generate_tiles build	run

clean:
	rm -f *.lab *.lst *.obx

build:
	${CC} ${FLAGS} src/dungeoneer.asm -o:dungeoneer.xex

run:
	atari800 -run dungeoneer.xex

runalt:
	./altirra main.obx > /dev/null 2>&1 &

generate_tiles:
	cd art && ./tile.py
