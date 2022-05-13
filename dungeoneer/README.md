# Dungeoneer

Dungeoneer is a simple game developed using Atari 6502 assembler [MADS](https://mads.atari8.info/).

![](https://user-images.githubusercontent.com/7003154/168381603-66ec68b3-56f0-4b62-8a17-526e7b7cdcb3.png)
![](https://user-images.githubusercontent.com/7003154/168381620-f1eb6338-57d4-4e44-91bf-e963a10beda1.png)
![](https://user-images.githubusercontent.com/7003154/168381636-a3c4bce0-2703-461f-b03a-36af91085414.png)
![](https://user-images.githubusercontent.com/7003154/168381653-ead3c51f-c99c-4c48-956a-a1ab3e3f364d.png)

## Building

To build the executable (xex) program, issue the following make command.

    make build

## Running

To run the executable in an emulator, feel free to use one of the supplied run targets.  The default emulator is atari800.

The following will run the executable in the [atari800](https://atari800.github.io/) emulator.

    make run
    
The following will run the executable in the Altirra emulator using the [altirra](https://www.virtualdub.org/altirra.html) shell script under wine.

    make runalt
