.thumb
// infinite game routine here
main_:
    bl main_80004A4
    bl sub_8001514
    bl sub_804050C
    bl main_803E218
loc_80002CC:
    bl main_await_80003D0  // callback routine
    bl main_frame_80003A0
    bl sub_80007BE
    bl loc_80019A0
    bl render_800172C
    bl objRender_8030DC8
    bl objRender_8000A44
    bl getPalleteAndTransition_80023E0
    bl renderPalletes_8001808
    bl renderPalletesAndObjs_8002650
    bl handleObjSprites_800289C
    bl render_80015D0
    bl main_80003E4
    mov r0, r10
    ldr r0, [r0,#0x24]
    ldrh r1, [r0]
    add r1, #1
    strh r1, [r0]
    bl sub_8000E10
    ldr r0, [pc, #0x8000348-0x800030e-2] // =main_jt_subsystem
    mov r1, r10
    ldr r1, [r1]
    ldrb r1, [r1]
    ldr r0, [r0,r1]
    mov lr, pc
    bx r0
    bl sub_800154C
    bl zf_CheckSameSubsystem_800AD1A
    beq loc_800032A
    bl subsystem_triggerTransition_80062FE
loc_800032A:
    bl Chatbox_onUpdate_80410EC
    bl cb_Call_8001994
    bl PET_onUpdate_8001B94
    ldr r0, [pc, #0x8000344-0x8000336-2] // =loc_3006814
    mov lr, pc
    bx r0
    bl main_8000454
    b loc_80002CC
    .balign 4, 0x00
off_8000344:    .word loc_3006814+1
off_8000348:    .word main_jt_subsystem
main_jt_subsystem:    .word Load_cb_80304F4+1
    .word cb_80050BC+1
    .word cb_jack_8035172+1
    .word cb_8039A64+1
    .word cb_803E23A+1
    .word cb_8040D98+1
    .word cb_803A538+1
    .word cb_803DC0E+1
    .word cb_803DD3E+1
    .word reqBBS_cb_draw_jt1+1
    .word loc_81275C8+1
    .word loc_8047D24+1
    .word loc_804A000+1
    .word loc_804BD74+1
    .word loc_8143184+1
    .word 0
    .word loc_804B9F6+1
    .word loc_814A2E4+1
    .word loc_8130460+1
    .word loc_804AE30+1
    .word 0
// end of function main_

.thumb
main_frame_80003A0:
    push {lr}
loc_80003A2:
    ldr r0, [pc, #0x80003cc-0x80003a2-2] // =GeneralLCDStatus_STAT_LYC_
    mov r2, #1
loc_80003A6:
    ldrh r1, [r0]
    tst r1, r2
    beq loc_80003A6
    ldr r0, [pc, #0x80003c4-0x80003ac-4] // =dword_200A870
    ldr r2, [r0]
    ldr r1, [pc, #0x80003c8-0x80003b0-4] // =dword_2009930
    ldr r1, [r1]
    cmp r2, r1
    blt loc_80003A2
    mov r1, #0
    str r1, [r0]
    pop {pc}
    .byte 0, 0
    .word dword_2009CC0
off_80003C4:    .word dword_200A870
off_80003C8:    .word dword_2009930
off_80003CC:    .word GeneralLCDStatus_STAT_LYC_
// end of function main_frame_80003A0

.thumb
main_await_80003D0:
    push {lr}
    ldr r0, [pc, #0x80003e0-0x80003d2-2] // =GeneralLCDStatus_STAT_LYC_
    mov r2, #1
loc_80003D6:
    ldrh r1, [r0]
    tst r1, r2
    bne loc_80003D6
    pop {pc}
    .byte 0, 0
off_80003E0:    .word GeneralLCDStatus_STAT_LYC_
// end of function main_await_80003D0

.thumb
main_80003E4:
    mov r7, r10
    ldr r0, [r7,#4]
    ldrb r7, [r0,#0x13]
    add r7, #1
    cmp r7, #4
    ble loc_80003F2
    mov r7, #0
loc_80003F2:
    strb r7, [r0,#0x13]
    ldr r4, [pc, #0x800044c-0x80003f4-4] // =KeyStatus
    ldrh r4, [r4]
    mvn r4, r4
    ldrh r5, [r0]
    strh r5, [r0,#6]
    ldr r3, [pc, #0x8000450-0x80003fe-2] // =dword_3FC
    strh r4, [r0]
    add r6, r4, #0
    and r6, r5
    mov r1, #8
    mov r3, #0
loc_800040A:
    mov r2, #1
    lsl r2, r3
    and r2, r6
    beq loc_800042A
    ldrb r2, [r0,r1]
    cmp r2, #0x10
    bge loc_8000430
    add r2, #1
    strb r2, [r0,r1]
    cmp r2, #1
    beq loc_8000438
loc_8000420:
    mov r2, #1
    lsl r2, r3
    mvn r2, r2
    and r6, r2
    b loc_8000438
loc_800042A:
    mov r2, #0
    strb r2, [r0,r1]
    b loc_8000438
loc_8000430:
    ldrb r7, [r0,#0x13]
    cmp r7, #0
    beq loc_8000438
    b loc_8000420
loc_8000438:
    add r3, #1
    add r1, #1
    cmp r1, #0x12
    blt loc_800040A
    strh r6, [r0,#4]
    mvn r5, r5
    and r4, r5
    strh r4, [r0,#2]
    mov pc, lr
    .balign 4, 0x00
off_800044C:    .word KeyStatus
dword_8000450:    .word 0x3FF
// end of function main_80003E4

.thumb
main_8000454:
    push {r4-r7,lr}
    bl sub_80062EC
    beq locret_80004A2
    bl sub_81484EC
    bne locret_80004A2
    mov r7, r10
    ldr r0, [r7]
    ldrb r0, [r0]
    cmp r0, #0x10
    beq locret_80004A2
    ldr r0, [r7,#4]
    ldrh r2, [r0,#2]
    ldrh r0, [r0]
    ldr r1, [r7]
    add r1, #4
    ldrb r4, [r1]
    sub r4, #1
    cmp r4, #0
    bgt loc_80004A0
    mov r4, #0
    mov r3, #0xf
    and r0, r3
    cmp r0, r3
    bne loc_80004A0
    and r2, r3
    tst r2, r2
    beq loc_80004A0
    push {r1}
    bl start_800023C
    bl main_80004A4
    bl sub_804050C
    pop {r1}
    mov r4, #0xa
loc_80004A0:
    strb r4, [r1]
locret_80004A2:
    pop {r4-r7,pc}
// end of function main_8000454

.thumb
main_80004A4:
    mov r0, #1
    b loc_80004AA
    mov r0, #0
loc_80004AA:
    push {r5,lr}
    push {r0}
    bl CpuSet_initToolkit
    bl loc_8006C16
    pop {r1}
    ldr r0, [pc, #0x8000564-0x80004b8-4] // =dword_40
    tst r1, r1
    beq loc_80004C0
    ldr r0, [pc, #0x8000568-0x80004be-2] // =dword_C0
loc_80004C0:
    bl sub_8001778
    bl sub_80017EC
    bl render_800172C
    bl sub_8001850
    bl sub_8000570
    bl sub_80007B2
    bl sub_8001974
    bl sub_80024A2
    bl sub_8003946
    bl sub_8003A96
    bl sub_80015B4
    bl sub_800260C
    bl sub_80027C4
    bl sub_8030D6C
    bl sub_8000A3C
    bl sub_8040F48
    bl sub_8030EE8
    bl sub_8004DD4
    bl sub_8004D2C
    bl sub_8037E84
    bl sub_8037ED4
    bl sub_8001AFC
    bl sub_8002368
    bl sub_8001820
    bl sub_800182E
    bl sub_80062E0
    bl sub_8006904
    bl sub_803EEA0
    bl sub_814F114
    bl sub_803FC0C
    bl sub_8148848
    bl sub_80071A8
    bl sub_80475B8
    bl sub_8047814
    ldr r0, [pc, #0x800056c-0x8000548-4] // =dword_2009930
    mov r1, #1
    strh r1, [r0]
    mov r0, r10
    ldr r0, [r0]  // memBlock
    mov r1, #8  // numWords
    bl CpuSet_ZeroFillWord
    bl main_803E218
    bl sub_803F944
    pop {r5,pc}
    .balign 4, 0x00
off_8000564:    .word dword_40
off_8000568:    .word dword_C0
off_800056C:    .word dword_2009930
// end of function main_80004A4
