# The process
1. Disassemble code into *.s files, and data into other formats that are binary linked.
2. For each *.s file: 
  - Set the section of the file according to this format: `f__filename.`
  - Set the section flag to "ax" to ensure it's loaded. (Ex: .section .f__filename, "ax")
  - there may be *external symbols* declared within. Those are symbols that are used, but not declared anywhere in
  the file. For that, create a filename.inc file and a filename.x file inside the externs directory 
  to specify all external symbols for each file.
  - For each external symbol, create a segment that follows the format `x__symbolname` in the filename.inc file, 
  and an empty label of the symbol.
  - Map the segment symbol to the output elf, and set its logical address accordingly in filename.x
  - (See `start.inc` and `start.x` in the externs folder for a concrete example of this)
  - Include filename.x to externs.x 
  - Include filename.inc to filename.s
  - Include `f__filename` into ld_script.x
5. **make rom**; Build the rom and make sure it's successful
6. **make checksum**; Make sure that the output ROM has an identical checksum to the input binary.
7. if (!complete) goto 1; // good luck!
