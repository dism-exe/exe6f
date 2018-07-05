.include "constants/LCDControl.inc"
.include "constants/InterruptEnable.inc"
.include "constants/SIO.inc"
.include "externs/start.inc"

// this section declaration is crucial for linking, otherwise it won't overlay
.section .f__start, "ax"

.arm
start_:
    b loc_80000D0
dword_8000004:    .word 0x51AEFF24, 0x21A29A69, 0xA82843D, 0xAD09E484, 0x988B2411
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
    mov r0, #0x12
    msr cpsr_cf, r0
    ldr sp, [pc, #0x80001ec-0x80000d8-8] // =0x3007F60
    mov r0, #0x13
    msr cpsr_cf, r0
    ldr sp, [pc, #0x80001f0-0x80000e4-8] // =0x3007FE0
    mov r0, #0x1f
    msr cpsr_cf, r0
    ldr sp, [pc, #0x80001f4-0x80000f0-8] // =0x3007E00
    ldr r0, [pc, #0x80001f8-0x80000f4-8] // =loc_3007FFC
    ldr r1, [pc, #0x80001fc-0x80000f8-8] // =0x3005B00
    str r1, [r0]
    ldr r0, [pc, #0x8000200-0x8000100-8] // =GamePakWaitstateControl
    ldr r1, [pc, #0x8000204-0x8000104-8] // =0x45B4
    str r1, [r0]
    mov r0, #0x3000000  // memblock
    mov r1, #0x7e00  // amt
    bl start_clearMemory
    mov r0, #0x2000000  // memblock
    mov r1, #0x40000  // amt
    bl start_clearMemory
    mov r0, #0x6000000  // memblock
    mov r1, #0x18000  // amt
    bl start_clearMemory
    mov r0, #0x7000000  // memblock
    mov r1, #0x400  // amt
    bl start_clearMemory
    mov r0, #0x5000000  // memblock
    mov r1, #0x400  // amt
    bl start_clearMemory
    ldr r0, [pc, #0x8000208-0x8000148-8] // =loc_81D6000
    ldr r1, [pc, #0x800020c-0x800014c-8] // =0x3005B00
    ldr r2, [pc, #0x8000210-0x8000150-8] // =dword_1E78
    bl start_80001D8
    ldr r0, [pc, #0x8000214-0x8000158-8] // =sub_8006BB4
    mov lr, pc
    bx r0
    ldr r0, [pc, #0x8000218-0x8000164-8] // =loc_8006C16
    mov lr, pc
    bx r0
    ldr r0, [pc, #0x800021c-0x8000170-8] // =start_800023C
    mov lr, pc
    bx r0
    ldr r0, [pc, #0x8000220-0x800017c-8] // =byte_20081B0
    mov r1, #0
    strb r1, [r0]
    ldr r0, [pc, #0x8000224-0x8000188-8] // =dword_2009930
    mov r1, #1
    str r1, [r0]
    ldr r0, [pc, #0x8000228-0x8000194-8] // =dword_200A870
    mov r1, #0
    str r1, [r0]
    ldr r0, [pc, #0x800022c-0x80001a0-8] // =GeneralLCDStatus_STAT_LYC_
    mov r1, #8
    strh r1, [r0]
    ldr r0, [pc, #0x8000230-0x80001ac-8] // =KeyInterruptControl
    ldr r1, [pc, #0x8000234-0x80001b0-8] // =0x83FF  // argv
    strh r1, [r0]
    ldr r0, [pc, #0x8000238-0x80001b8-8] // =main_  // argc
    bx r0
    b start_
// end of function start_

.arm
start_clearMemory:
    mov r2, #0
loc_80001C8:
    subs r1, r1, #4
    str r2, [r0,r1]
    bne loc_80001C8
    bx lr
// end of function start_clearMemory

.arm
start_80001D8:
    subs r2, r2, #4
    ldr r3, [r0,r2]
    str r3, [r1,r2]
    bne start_80001D8
    bx lr
dword_80001EC:    .word 0x3007F60
dword_80001F0:    .word 0x3007FE0
dword_80001F4:    .word 0x3007E00
off_80001F8:    .word loc_3007FFC
dword_80001FC:    .word 0x3005B00
off_8000200:    .word GamePakWaitstateControl
dword_8000204:    .word 0x45B4
off_8000208:    .word loc_81D6000
dword_800020C:    .word 0x3005B00
off_8000210:    .word dword_1E78+0x30
off_8000214:    .word sub_8006BB4+1
off_8000218:    .word loc_8006C16+1
off_800021C:    .word start_800023C+1
off_8000220:    .word byte_20081B0
off_8000224:    .word dword_2009930
off_8000228:    .word dword_200A870
off_800022C:    .word GeneralLCDStatus_STAT_LYC_
off_8000230:    .word KeyInterruptControl
argv:    .word 0x83FF
argc:    .word main_+1
// end of function start_80001D8
