my_abs PROC
; lösche Bit:
        BIC      r0,r0,#0x80000000
        BX       lr
        ENDP

set_sign PROC
; führe OR aus:
        ORR      r0,r0,#0x80000000
        BX       lr
        ENDP

negate PROC
; führe XOR aus:
        EOR      r0,r0,#0x80000000
        BX       lr
        ENDP
