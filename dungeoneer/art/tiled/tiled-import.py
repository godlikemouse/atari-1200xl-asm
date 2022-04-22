#!/usr/bin/python

import sys
import os
from os.path import exists

def usage():
    print("tiled-import --source=<source-file> --dest=<dest-file>\n")
    print("\tImports the csv file as lines of byte code.\n")
    print("\t--source")
    print("\t\tSource tiled csv file.")
    print("\t--dest")
    print("\t\tDestination asm file.")
    print("\t--high-bytes")
    exit(1)

source_file = None
dest_file = None
for i in range(len(sys.argv)):
    argv = sys.argv[i]
    if argv.startswith("--source="):
        source_file = os.path.abspath(argv.split("=").pop())

    if argv.startswith("--dest="):
        dest_file = os.path.abspath(argv.split("=").pop())

if source_file is None or dest_file is None:
    usage()

mapname = source_file.split("/").pop().replace(".csv", "")
type = mapname.split(".").pop().strip()

# parse csv file into byte lines
csv = open(source_file, "r")
output_bytes = ""
for line in csv:
    tiles = line.split(",")
    output_bytes += "\t.byte "

    out_tiles = []
    for tile in tiles:
        out_tiles.append("${0:0{1}x}".format(int(tile), 2))

    output_bytes += ",".join(out_tiles) + "\n"
output_bytes += "\n"
csv.close()

# read in destination file
output = ""
dest = open(dest_file, "r")
in_section = False
i = 0
for line in dest:

    if in_section:
        if line.strip() == "":
            in_section = False
    else:
        output += line

    if line.strip() == type:
        in_section = True
        output += output_bytes

dest.close()

# write to destination file
dest = open(dest_file, "w")
dest.write(output)
dest.close()
