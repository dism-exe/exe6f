OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")
OUTPUT_ARCH(arm)

SECTIONS
{
    /* first linking ROM bin; this is overlayed on. MUST LINK FIRST!*/
    . = 0x08000000;
    .f__rom (COPY): {KEEP(*.o(.f__rom))}

    /* linking *.s files into place */
    . = 0x08000000;
    .f__start : {*.o(.f__start)}
}
