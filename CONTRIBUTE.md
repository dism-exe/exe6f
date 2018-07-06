# The process
1. Reverse, Document, and Disassemble code into .s files, and data into binary formats.
2. Include the .s file into `_link.s`
3. If the file is to be included to a specified section (continuing from the last end address), or a new range:
  - If it belongs to a new range, create a section for that range according to the format `.r__firstFile`. (Ex: the first range is `.r__start` since start.s is the first file in that section.)
  - Set the section flag to "ax" to ensure it's loaded. (Eg: `.section .r__start, "ax"`)
  - include the range, and its start address into `ld_script.x`
  - Set the section of the file: `.section .filename, "ax"`
4. there may be *external symbols* declared within. Those are symbols that are used, but not declared anywhere in
  the file. For that, create a filename.inc file inside the externs directory
  to specify all external symbols for each file.
  - .equ define each symbol as such: `.equ symbolname, symbol_val`
  - Include the external inc file to the start of `_link.s`.
5. If using IDA, https://github.com/LanHikari22/GBA-IDA-Pseudo-Terminal contains tools that speed up this process by generating
  the disassembly and external symbols automatically.
6. **make rom**; Build the rom and make sure it's successful
7. **make checksum**; Make sure that the output ROM has an identical checksum to the input binary.
8. if (!complete) goto 1; // good luck!
