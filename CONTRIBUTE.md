# The process
1. Disassemble code into .s files, and data into other formats that are binary linked.
2. For each .s file:
  - Set the section of the file according to this format: `f__filename.`
  - Set the section flag to "ax" to ensure it's loaded. (Eg: .section .f__filename, "ax")
  - there may be *external symbols* declared within. Those are symbols that are used, but not declared anywhere in
  the file. For that, create a filename.inc file inside the externs directory
  to specify all external symbols for each file.
  - .equ define each symbol as such: `.equ symbolname, symbol_val`
  - Include `f__filename` into ld_script.x
  - Check out the IDA tools that generate converted disassembly and externs
  to make the process faster when using IDA
3. **make rom**; Build the rom and make sure it's successful
4. **make checksum**; Make sure that the output ROM has an identical checksum to the input binary.
5. if (!complete) goto 1; // good luck!
