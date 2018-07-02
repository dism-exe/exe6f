.include "constants/LCDControl.inc"
.include "constants/InterruptEnable.inc"
.include "constants/SIO.inc"
.include "externs/start.inc"

// this section declaration is crucial for linking, otherwise it won't overlay
.section .f__start, "ax"

start:
  B       loc_80000D0
dword_8000004:  .word 0x51AEFF24, 0x21A29A69, 0xA82843D, 0xAD09E484, 0x988B2411
  .word 0x217F81C0, 0x19BE52A3, 0x20CE0993, 0x4A4A4610, 0xEC3127F8
  .word 0x33E8C758, 0xBFCEE382, 0x94DFF485, 0xC1094BCE, 0xC08A5694
  .word 0xFCA77213, 0x734D849F, 0x619ACAA3, 0x27A39758, 0x769803FC
  .word 0x61C71D23, 0x56AE0403, 0x8438BF, 0xFD0EA740, 0x3FE52FF
  .word 0xF130956F, 0x85C0FB97, 0x2580D660, 0x3BE63A9, 0xE2384E01
  .word 0xFF34A2F9, 0x44033EBB, 0xCB900078, 0x943A1188, 0x637CC065
  .word 0xAF3CF087, 0x8BE425D6, 0x72AC0A38, 0x7F8D421, 0x4B434F52
  .word 0x36455845, 0x5858525F, 0x4A365242, 0x963830, 0x0
  .word 0x0
  .word dword_2D00
  .word 0x0, 0x0, 0x0, 0x0
loc_80000D0:
  MOV     R0, #0x12
  MSR     CPSR_cf, R0
  LDR     SP, [PC, #0x80001EC-0x80000D8-8] // =0x3007F60
  MOV     R0, #0x13
  MSR     CPSR_cf, R0
  LDR     SP, [PC, #0x80001F0-0x80000E4-8] // =0x3007FE0
  MOV     R0, #0x1F
  MSR     CPSR_cf, R0
  LDR     SP, [PC, #0x80001F4-0x80000F0-8] // =0x3007E00
  LDR     R0, [PC, #0x80001F8-0x80000F4-8] // =loc_3007FFC
  LDR     R1, [PC, #0x80001FC-0x80000F8-8] // =0x3005B00
  STR     R1, [R0]
  LDR     R0, [PC, #0x8000200-0x8000100-8] // =GamePakWaitstateControl
  LDR     R1, [PC, #0x8000204-0x8000104-8] // =0x45B4
  STR     R1, [R0]
  MOV     R0, #0x3000000  // memblock

  MOV     R1, #0x7E00  // amt

  BL      clear_memory
  MOV     R0, #0x2000000  // memblock

  MOV     R1, #0x40000  // amt

  BL      clear_memory
  MOV     R0, #0x6000000  // memblock

  MOV     R1, #0x18000  // amt

  BL      clear_memory
  MOV     R0, #0x7000000  // memblock

  MOV     R1, #0x400  // amt

  BL      clear_memory
  MOV     R0, #0x5000000  // memblock

  MOV     R1, #0x400  // amt

  BL      clear_memory
  LDR     R0, [PC, #0x8000208-0x8000148-8] // =sub_81D6000
  LDR     R1, [PC, #0x800020C-0x800014C-8] // =0x3005B00
  LDR     R2, [PC, #0x8000210-0x8000150-8] // =dword_1E78
  BL      sub_80001D8
  LDR     R0, [PC, #0x8000214-0x8000158-8] // =sub_8006BB4
  MOV     LR, PC
  BX      R0
  LDR     R0, [PC, #0x8000218-0x8000164-8] // =loc_8006C16
  MOV     LR, PC
  BX      R0
  LDR     R0, [PC, #0x800021C-0x8000170-8] // =sub_800023C
  MOV     LR, PC
  BX      R0
  LDR     R0, [PC, #0x8000220-0x800017C-8] // =byte_20081B0
  MOV     R1, #0
  STRB    R1, [R0]
  LDR     R0, [PC, #0x8000224-0x8000188-8] // =dword_2009930
  MOV     R1, #1
  STR     R1, [R0]
  LDR     R0, [PC, #0x8000228-0x8000194-8] // =dword_200A870
  MOV     R1, #0
  STR     R1, [R0]
  LDR     R0, [PC, #0x800022C-0x80001A0-8] // =GeneralLCDStatus_STAT_LYC_
  MOV     R1, #8
  STRH    R1, [R0]
  LDR     R0, [PC, #0x8000230-0x80001AC-8] // =KeyInterruptControl
  LDR     R1, [PC, #0x8000234-0x80001B0-8] // =0x83FF  // argv

  STRH    R1, [R0]
  LDR     R0, [PC, #0x8000238-0x80001B8-8] // =main  // argc

  BX      R0
  B       start
// end of function start

clear_memory:
  MOV     R2, #0
loc_80001C8:
  SUBS    R1, R1, #4
  STR     R2, [R0,R1]
  BNE     loc_80001C8
  BX      LR
// end of function clear_memory

sub_80001D8:
  SUBS    R2, R2, #4
  LDR     R3, [R0,R2]
  STR     R3, [R1,R2]
  BNE     sub_80001D8
  BX      LR
dword_80001EC:  .word 0x3007F60
dword_80001F0:  .word 0x3007FE0
dword_80001F4:  .word 0x3007E00
off_80001F8:  .word loc_3007FFC
dword_80001FC:  .word 0x3005B00
off_8000200:  .word GamePakWaitstateControl
dword_8000204:  .word 0x45B4
off_8000208:  .word sub_81D6000
dword_800020C:  .word 0x3005B00
off_8000210:  .word dword_1E78+0x30
off_8000214:  .word sub_8006BB4+1
off_8000218:  .word loc_8006C16+1
off_800021C:  .word sub_800023C+1
off_8000220:  .word byte_20081B0
off_8000224:  .word dword_2009930
off_8000228:  .word dword_200A870
off_800022C:  .word GeneralLCDStatus_STAT_LYC_
off_8000230:  .word KeyInterruptControl
argv:  .word 0x83FF
argc:  .word main+1
// end of function sub_80001D8
