.text:0000003E             exit ; CODE XREF: f+16
.text:0000003E 05 B0              ADD     SP, SP, #0x14
.text:00000040 00 BD              POP     {PC}


.text:00000280             f
.text:00000280
.text:00000280             var_18 = -0x18
.text:00000280             a      = -0x14
.text:00000280             b      = -0x10
.text:00000280             c      = -0xC
.text:00000280             d      = -8
.text:00000280
.text:00000280 0F B5              PUSH    {R0-R3,LR}
.text:00000282 81 B0              SUB     SP, SP, #4
.text:00000284 04 98              LDR     R0, [SP,#16]    ; d
.text:00000286 02 9A              LDR     R2, [SP,#8]     ; b
.text:00000288 00 90              STR     R0, [SP]
.text:0000028A 68 46              MOV     R0, SP
.text:0000028C 03 7B              LDRB    R3, [R0,#12]    ; c
.text:0000028E 01 79              LDRB    R1, [R0,#4]     ; a
.text:00000290 59 A0              ADR     R0, aADBDCDDD   ; "a=%d; b=%d; c=%d; d=%d\n"
.text:00000292 05 F0 AD FF        BL      __2printf
.text:00000296 D2 E6              B       exit

