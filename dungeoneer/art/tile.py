#!/usr/bin/python

import png

tile_width = 4
tile_height = 8

img = png.Reader(filename="charset.png")
(width, height, rows, info) = img.read()
row_list = list(rows)

pixels = list()
for row in row_list:
    pixels.append(list(row))

colors = ["00", "11", "01", "10", "11"]

f = open("../src/data/charset.data", "w")
char = 0
f.write("\t.local gfx\n")
f.write("\torg CHARSET\n")
for row in range(int(height / tile_height)):
    for col in range(int(width / tile_width)):
        f.write(f"\t; char {char}\n")
        for y in range(row * tile_height, row * tile_height + tile_height):
            f.write("\t.byte %")
            for x in range(col * tile_width, col * tile_width + tile_width):
                code = colors[pixels[y][x]]
                f.write(code)
            f.write("\n")
        char += 1
f.write("\t.endl\n")
f.close()
