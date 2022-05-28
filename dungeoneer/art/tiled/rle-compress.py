#!/usr/bin/python

import sys

def usage():
    print("rle-compress --source=<source-file> --dest=<dest-file>\n")
    print("\tReads in the source assembly file and uses RLE to compress.\n")
    print("\t--source")
    print("\t\tSource (uncompressed) assembly file.")
    print("\t--dest")
    print("\t\tDestination (compressed) asm file.")
    print("\t--help")
    print("\t\tPrints this help message")
    exit(1)

source_file = None
dest_file = None
for i in range(len(sys.argv)):
    argv = sys.argv[i]
    if argv.startswith("--source="):
        source_file = os.path.abspath(argv.split("=").pop())

    if argv.startswith("--dest="):
        dest_file = os.path.abspath(argv.split("=").pop())

    if argv == "--help":
        usage();

if source_file is None or dest_file is None:
    usage()

# Read in the source asm file

# Utilize byte type structure:
#   $ff standard RLE
#   $fe 2 byte repetition RLE
#   example: $ff,$37,$01 - uses standard RLE to encode 55 tiles of tile 1
#   example: $fe,$20,$05,$06 - uses non-standard REL to enocde 32 tiles
#                               of sequence 5,6
