str_trim PROC
        PUSH     {r4,lr}
        MOVS     r4,r0
; R4=s
        BL       strlen        ; strlen() takes "s" value from R0
; R0=str_len
        MOVS     r3,#0
; R3 will always hold 0
        B        |L0.24|
|L0.12|
        CMP      r1,#0xd       ; is loaded byte '\r'?
        BEQ      |L0.20|       
        CMP      r1,#0xa       ; is loaded byte '\n'?
        BNE      |L0.38|       ; jump to exit, if no
|L0.20|
        SUBS     r0,r0,#1      ; R0-- or str_len--
        STRB     r3,[r2,#0x1f] ; store 0 at address R2+0x1F=s+str_len-0x20+0x1F=s+str_len-1
|L0.24|
        CMP      r0,#0         ; str_len==0?
        BEQ      |L0.38|       ; yes? jump to exit
        ADDS     r2,r4,r0      ; R2=R4+R0=s+str_len
        SUBS     r2,r2,#0x20   ; R2=R2-0x20=s+str_len-0x20
        LDRB     r1,[r2,#0x1f] ; load byte at address R2+0x1F=s+str_len-0x20+0x1F=s+str_len-1 to R1
        CMP      r1,#0         ; is loaded byte 0?
        BNE      |L0.12|       ; jump to loop begin, if its not 0
|L0.38|
; return "s"
        MOVS     r0,r4
        POP      {r4,pc}
        ENDP
