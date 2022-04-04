#!/usr/bin/python

import sys
import png
from os.path import exists

tile_width = 4
tile_height = 8

filename = sys.argv[1]
localname = sys.argv[2]

img = png.Reader(filename=filename)
(width, height, rows, info) = img.read()
frames = int(height / width)

colors = ["00", "11", "01", "10", "11"]

f = open("../src/data/tileset.data", "w")
f.write("\t.local " + localname + "\n")

row_offset = 0

row_list = list(rows)
pixels = list()
for row in row_list:
    pixels.append(list(row))

for frame in range(frames):

    f.write("\torg tileset" + str(frame+1) + "\n")
    char = 0

    for row in range(int(width / tile_height)):

        for col in range(int(width / tile_width)):
            f.write(f"\t; char {char}\n")
            for y in range((row + row_offset) * tile_height, (row + row_offset) * tile_height + tile_height):
                f.write("\t.byte %")
                for x in range(col * tile_width, col * tile_width + tile_width):
                    code = colors[pixels[y][x]]
                    f.write(code)
                f.write("\n")
            char += 1
    row_offset += 8

f.write("\t.endl\n")
f.close()
