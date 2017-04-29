000000F6                       EXPORT f2
000000F6                   f2
000000F6 10 B5                 PUSH    {R4,LR}
000000F8 03 00                 MOVS    R3, R0
000000FA 06 F0 69 F8           BL      __ARM_common_switch8_thumb ; switch 6 cases

000000FE 05                    DCB 5
000000FF 04 06 08 0A 0C 10     DCB 4, 6, 8, 0xA, 0xC, 0x10 ; jump table for switch statement
00000105 00                    ALIGN 2
00000106
00000106                   zero_case ; CODE XREF: f2+4
00000106 8D A0                 ADR     R0, aZero ; jumptable 000000FA case 0
00000108 06 E0                 B       loc_118

0000010A
0000010A                   one_case ; CODE XREF: f2+4
0000010A 8E A0                 ADR     R0, aOne ; jumptable 000000FA case 1
0000010C 04 E0                 B       loc_118

0000010E
0000010E                   two_case ; CODE XREF: f2+4
0000010E 8F A0                 ADR     R0, aTwo ; jumptable 000000FA case 2
00000110 02 E0                 B       loc_118

00000112
00000112                   three_case ; CODE XREF: f2+4
00000112 90 A0                 ADR     R0, aThree ; jumptable 000000FA case 3
00000114 00 E0                 B       loc_118

00000116
00000116                   four_case ; CODE XREF: f2+4
00000116 91 A0                 ADR     R0, aFour ; jumptable 000000FA case 4
00000118
00000118                   loc_118 ; CODE XREF: f2+12
00000118                           ; f2+16
00000118 06 F0 6A F8           BL      __2printf
0000011C 10 BD                 POP     {R4,PC}

0000011E
0000011E                   default_case ; CODE XREF: f2+4
0000011E 82 A0                 ADR     R0, aSomethingUnkno ; jumptable 000000FA default case
00000120 FA E7                 B       loc_118


000061D0                       EXPORT __ARM_common_switch8_thumb
000061D0                   __ARM_common_switch8_thumb ; CODE XREF: example6_f2+4
000061D0 78 47                 BX      PC

000061D2 00 00                 ALIGN 4
000061D2                   ; End of function __ARM_common_switch8_thumb
000061D2
000061D4                   __32__ARM_common_switch8_thumb ; CODE XREF: __ARM_common_switch8_thumb
000061D4 01 C0 5E E5           LDRB    R12, [LR,#-1]
000061D8 0C 00 53 E1           CMP     R3, R12
000061DC 0C 30 DE 27           LDRCSB  R3, [LR,R12]
000061E0 03 30 DE 37           LDRCCB  R3, [LR,R3]
000061E4 83 C0 8E E0           ADD     R12, LR, R3,LSL#1
000061E8 1C FF 2F E1           BX      R12
000061E8                   ; End of function __32__ARM_common_switch8_thumb
