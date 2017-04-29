str_trim PROC
        PUSH     {r4,lr}
        MOVS     r4,r0
; R4=s
        BL       strlen        ; strlen() берет значение "s" из R0
; R0=str_len
        MOVS     r3,#0
; R3 всегда будет содержать 0
        B        |L0.24|
|L0.12|
        CMP      r1,#0xd       ; загруженный байт - это '\r'?
        BEQ      |L0.20|       
        CMP      r1,#0xa       ; загруженный байт - это '\n'?
        BNE      |L0.38|       ; перейти на выход, если нет
|L0.20|
        SUBS     r0,r0,#1      ; R0-- или str_len--
        STRB     r3,[r2,#0x1f] ; записать 0 по адресу R2+0x1F=s+str_len-0x20+0x1F=s+str_len-1
|L0.24|
        CMP      r0,#0         ; str_len==0?
        BEQ      |L0.38|       ; да? тогда перейти на выход
        ADDS     r2,r4,r0      ; R2=R4+R0=s+str_len
        SUBS     r2,r2,#0x20   ; R2=R2-0x20=s+str_len-0x20
        LDRB     r1,[r2,#0x1f] ; загрузить байт по адресу R2+0x1F=s+str_len-0x20+0x1F=s+str_len-1 в R1
        CMP      r1,#0         ; загруженный байт - это 0?
        BNE      |L0.12|       ; перейти на начало цикла, если это не 0
|L0.38|
; возврат "s"
        MOVS     r0,r4
        POP      {r4,pc}
        ENDP
