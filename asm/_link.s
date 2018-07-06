/*
This file specifies how all of the asm files link together into the ROM.
This is the only compiled file that is overlaid over the binary
*/

// to prevent duplicate symbols, expose file external symbols
// range .r__start
.include "externs/start.inc"
.include "externs/main.inc"

/* Range [8000000, 80005ac) */
.section .r__start, "ax"
// [8000000, 80002BC)
.section .start, "ax"
.include "asm/start.s"
// [80002BC, 80005ac)
.section .main, "ax"
.include "asm/main.s"
