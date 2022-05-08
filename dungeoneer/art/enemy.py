#!/usr/bin/python

import sys
import png
from os.path import exists

tile_width = 8
tile_height = 8

img = png.Reader(filename="enemy.png")
(width, height, rows, info) = img.read()
frames = int(height / width)

f = open("../src/data/enemy.asm", "w")

row_list = list(rows)

pixels = list()
for row in row_list:
    pixels.append(list(row))

f.write("enemy_data\n")

# iterate each vertical frame
for frame in range(int(height / tile_height)):

    # generate empty zero filled output frames
    # 1 color1, 1 output frames per input frame
    output_frames = list()
    for fi in range(0, 1):
        fr = list()
        for fy in range(0, 8):
            row = list()
            for fx in range(0, 8):
                row.append("0")
            fr.append(row)
        output_frames.append(fr)

    y_offset = frame * tile_height

    for y in range(y_offset, frame * tile_height + tile_height):

        for x in range(0, 8):
            # skip 0, output_frame is already 0 filled
            px = pixels[y][x]
            if px == 0:
                continue

            # select correct output frame [0, 1, 2] and store "1"
            output_frame = output_frames[px-1]
            output_frame[y - y_offset][x] = "1"

    # iterate generated output frames and write to file
    frame_count = 0
    for of in output_frames:
        f.write(f"\t; frame {frame}, {frame_count}\n")
        for y in of:
            f.write("\t.byte %" + "".join(y) + "\n")
        frame_count += 1

f.close()
