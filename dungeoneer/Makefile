CC=mads
FLAGS=-l -t
OUTFILE=dungeoneer.xex

all: clean generate_tiles build	run

clean:
	rm -f *.lab *.lst *.obx

build:
	${CC} ${FLAGS} src/dungeoneer.asm -o:${OUTFILE}

run:
	atari800 -vsync -run ${OUTFILE}

runalt:
	./altirra ${OUTFILE} > /dev/null 2>&1 &

generate_tiles:
	cd art && ./tileset.py tileset.png tile_gfx
