# Dungeoneer

Dungeoneer is a simple game developed using Atari 6502 assembler [MADS](https://mads.atari8.info/).

## Building

To build the executable (xex) program, issue the following make command.

    make build

## Running

To run the executable in an emulator, feel free to use one of the supplied run targets.  The default emulator is atari800.

    make run

This will run the executable in the [atari800](https://atari800.github.io/) emulator.

    make runalt

This will run the executable in the Altirra emulator using the [altirra](https://www.virtualdub.org/altirra.html) shell script under wine.
