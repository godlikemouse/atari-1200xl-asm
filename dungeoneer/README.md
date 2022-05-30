# Dungeoneer

Dungeoneer is a simple game developed using Atari 6502 assembler [MADS](https://mads.atari8.info/).

![](https://user-images.githubusercontent.com/7003154/168381603-66ec68b3-56f0-4b62-8a17-526e7b7cdcb3.png)
![](https://user-images.githubusercontent.com/7003154/168381620-f1eb6338-57d4-4e44-91bf-e963a10beda1.png)
![](https://user-images.githubusercontent.com/7003154/168381636-a3c4bce0-2703-461f-b03a-36af91085414.png)
![](https://user-images.githubusercontent.com/7003154/168381653-ead3c51f-c99c-4c48-956a-a1ab3e3f364d.png)

## Dependencies

- [MADS](https://mads.atari8.info/) assembler.
- [PyPNG](https://pypi.org/project/pypng/) used for python import imports.
- [Tiled](https://mapeditor.org) map editor.
- [GIMP](https://www.gimp.org/) used for image editing.
- [Makefile](https://www.gnu.org/software/make/manual/make.html) used for building/running Dungeoneer.
- [Atari800](https://atari800.github.io/) emulator.
- [Altirra](https://www.virtualdub.org/altirra.html) emulator.

## Building

To build the executable (xex) program, issue the following make command.

    make build

## Running

To run the executable in an emulator, feel free to use one of the supplied run targets.  The default emulator is atari800.

The following will run the executable in the [atari800](https://atari800.github.io/) emulator.

    make run

The following will run the executable in the Altirra emulator using the [altirra](https://www.virtualdub.org/altirra.html) shell script under wine.

    make runalt

## References

- Based on the original 8bit MADS YouTube tutorial series by Ed Salisbury [Let's Write a Roguelike Game in 6502 Assembly on the Atari 8-Bit!](https://www.youtube.com/playlist?list=PL7IgmhqRiwzEIVAOhZWnby6WPsQ8alFSI)

- Map editing handled by [Tiled](https://www.mapeditor.org/).  Python scripts under `/art/tiled` handle the import and transformation from csv to assembly source code.

- Artwork created using [GIMP](https://www.gimp.org/).  Python scripts under `/art` handle the import and transformation from PNG to assembly source code.

- Memory mapping reference used [Atari Memory Map](https://www.atariarchives.org/mapping/memorymap.php).

- Player Missile Graphics (PMG) reference used [PMG Memory Map](https://www.atariarchives.org/mapping/appendix7.php).

- NTSC Color Palette reference used [Atari Color Palette](https://atariage.com/forums/uploads/monthly_10_2015/post-6369-0-47505700-1443889945.png).

- Code assembled and written for the [MADS Atari Assembler](https://mads.atari8.info/).
