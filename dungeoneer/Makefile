CC=mads
FLAGS=-l -t

all: clean generate_tiles build	run

clean:
	rm -f *.lab *.lst *.obx

build:
	${CC} ${FLAGS} main.asm

run:
	atari800 -run main.obx

runalt:
	./altirra main.obx > /dev/null 2>&1 &

generate_tiles:
	cd art && ./tile.py
