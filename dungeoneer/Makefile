CC=mads
NAME=dungeoneer
FLAGS=-l:${NAME}.lst -t:${NAME}.lab
OUTFILE=${NAME}.xex
IMPORT_FLAGS=--rle=2

all: clean generate_tiles generate_player generate_enemy generate_maps build run

clean:
	rm -f *.lab *.lst *.obx

build:
	${CC} ${FLAGS} src/${NAME}.asm -o:${OUTFILE}

run:
	atari800 -vsync -video-accel -run ${OUTFILE}

runalt:
	./altirra ${OUTFILE} > /dev/null 2>&1 &

generate_tiles:
	cd art && ./tileset.py game_tileset tileset_data
	cd art && ./tileset.py menu_tileset menu_data

generate_maps:
	./art/tiled/tiled-import.py --source=./art/tiled/mainmenu.map.csv --dest=./src/display/mainmenu.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/howtoplay.map.csv --dest=./src/display/howtoplay.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/credits.map.csv --dest=./src/display/credits.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/gameover.map.csv --dest=./src/display/gameover.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/level1_map.intro.csv --dest=./src/display/level1.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/level1_map.map.csv --dest=./src/display/level1.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/level2_map.intro.csv --dest=./src/display/level2.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/level2_map.map.csv --dest=./src/display/level2.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/level3_map.intro.csv --dest=./src/display/level3.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/level3_map.map.csv --dest=./src/display/level3.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/level3_map.maps1.csv --dest=./src/display/level3.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/level4_map.intro.csv --dest=./src/display/level4.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/level4_map.map.csv --dest=./src/display/level4.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/level5_map.intro.csv --dest=./src/display/level5.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/level5_map.map.csv --dest=./src/display/level5.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/level5_map.mape1.csv --dest=./src/display/level5.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/level5_map.mapw1.csv --dest=./src/display/level5.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/level5_map.mapn1.csv --dest=./src/display/level5.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/level5_map.maps1.csv --dest=./src/display/level5.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/level5_map.maps1w1.csv --dest=./src/display/level5.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/level6_map.intro.csv --dest=./src/display/level6.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/level6_map.map.csv --dest=./src/display/level6.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/level6_map.mapn1.csv --dest=./src/display/level6.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/level6_map.maps1.csv --dest=./src/display/level6.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/level6_map.maps1w1.csv --dest=./src/display/level6.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/level6_map.maps1e1.csv --dest=./src/display/level6.asm ${IMPORT_FLAGS}
	./art/tiled/tiled-import.py --source=./art/tiled/congratulations.intro.csv --dest=./src/display/congratulations.asm ${IMPORT_FLAGS}

generate_player:
	cd art && ./player.py

generate_enemy:
	cd art && ./enemy.py
