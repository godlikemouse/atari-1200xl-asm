#!/usr/bin/python

import sys
import os

def usage():
    print(f"{sys.argv[0]} [options]")
    print()
    print("\tReads in the source assembly file and uses RLE to compress.")
    print()
    print("options:")
    print("\t--source")
    print("\t\tSource tiled csv file.")
    print("\t--dest")
    print("\t\tDestination (compressed) asm file.")
    print("\t--rle")
    print("\t\tRLE Byte length compression, valid values 1 or 2 (default: 0)")
    print("\t --verbose")
    print("\t\tTurns on verbose RLE output")
    print("\t--help")
    print("\t\tDisplays this help message")
    print()
    print("example:")
    print(f"\t{sys.argv[0]} --source=/my/file.csv --dest=/my/file.asm")
    exit(1)

source_file = None
dest_file = None
verbose = False
byte_length = 0

for i in range(len(sys.argv)):
    argv = sys.argv[i]
    if argv.startswith("--source="):
        source_file = os.path.abspath(argv.split("=").pop())

    if argv.startswith("--dest="):
        dest_file = os.path.abspath(argv.split("=").pop())

    if argv.startswith("--rle="):
        byte_length = int(argv.split("=").pop())

    if argv == "--help":
        usage();

    if argv == "--verbose":
        verbose = True

if source_file is None or dest_file is None:
    usage()

# Utilize byte type structure:
#   $ff standard RLE
#   $fe 2 byte RLE
#   example: $ff,$37,$01 - uses standard RLE to encode 55 tiles of tile 1
#   example: $fe,$20,$05,$06 - uses 2 byte RLE to enocde 32 tiles
#                               of sequence 5,6

# format and convert value to hex
def hex(value):
    return "${0:0{1}x}".format(int(value),2)

# print for verbose
def printv( *args ):
    if verbose:
        print(args)

mapname = source_file.split("/").pop().replace(".csv", "")
type = mapname.split(".").pop().strip()

# parse csv file into byte lines
csv = open(source_file, "r")
input_array = []
lines = []
for line in csv:
    # remove newline char
    tiles = line.replace("\n",",")
    lines.append(tiles)

# turn into a single list of all tile entries
input_array = "".join(lines).split(",")[:-1:]

original_size = len(input_array)

index = 0
output_array = []
while index < (len(input_array)):
    value = input_array[index]

    printv("Beginning run from:", index, input_array[index::])
    if index + 1 < len(input_array):
        # determine next byte structure
        next = input_array[index + 1]
        original_index = index

        if value == next and byte_length:
            printv("Use RLE:", value, next)
            count = 0

            # scan until non-same value found
            while value == next and index + 1 < len(input_array) and count < 255:
                index = index + 1
                count = count + 1
                next = input_array[index]

            if count < 3:
                # too short for RLE
                printv("Don't use RLE, too short:", count, value)
                printv(f"Output RAW: {hex(value)}")
                output_array.append(hex(value))
                index = original_index
            else:
                # use RLE
                if index + 1 == len(input_array) and next == value:
                    count = count + 1
                else:
                    index = index - 1

                printv(f"Standard RLE: $ff,{hex(count)},{hex(value)}")
                output_array.append("$ff")
                output_array.append(hex(count))
                output_array.append(hex(value))

        elif index + 2 < len(input_array) and byte_length == 2:
            count = 0
            next = input_array[index + 1]
            v = value
            n = next
            original_index = index

            while value == v and next == n and index + 4 < len(input_array):
                count = count + 1
                index = index + 2
                v = input_array[index]
                n = input_array[index+1]

            if count < 2:
                # too short for non-standard RLE
                printv("Don't use non-standard RLE, too short:", count, value, next)
                printv(f"Output RAW: {hex(value)}")
                output_array.append(hex(value))
                index = original_index + 1
            else:
                # use non-standard RLE
                printv(f"Non-standard RLE: $fe,{hex(count)},{hex(value)},{hex(next)}")
                output_array.append("$fe")
                output_array.append(hex(count))
                output_array.append(hex(value))
                output_array.append(hex(next))

            index = index - 1

        else:
            # end of the road, write out directly
            printv("Non-RLE, write raw:", value, hex(value))
            output_array.append(hex(value))
            index = original_index
    else:
        # end of the road, write out directly
        printv("Non-RLE, write raw:", value, hex(value))
        output_array.append(hex(value))

    index = index + 1

output_bytes = "\t.byte " + ",".join(output_array) + "\n\n"
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

compressed_size = len(output_array)
ratio = "{0:.2f}".format(100-((compressed_size/original_size)*100))
if byte_length:
    print(f"RLE compression: {original_size} to {compressed_size} bytes, ", end="")
    print(f"\tcompression {ratio}%,\t {mapname}")
    
printv(output_bytes)

csv.close()
