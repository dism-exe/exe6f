Install DevkitARM and make the bin folder containing arm-none-eabi binaries available in the path.

Use the following make rules to build the ROM:
- **make rom**: Builds the output ROM `exe6f.gba` by compiling the disassembled asm files 
and overlaying the object files on the binary image of the ROM in the bin folder: `bin/exe6f.bin`
- **make checksum**: displays the sha1 checksum of both `bin/exe6f.bin` and `exe6f.gba`. They must always be identical for `exe6f.gba` 
to be considered valid
- **make clean**: removes intermediate build files

