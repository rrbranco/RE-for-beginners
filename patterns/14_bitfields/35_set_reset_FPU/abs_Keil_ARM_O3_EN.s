my_abs PROC
; clear bit:
        BIC      r0,r0,#0x80000000
        BX       lr
        ENDP

set_sign PROC
; do OR:
        ORR      r0,r0,#0x80000000
        BX       lr
        ENDP

negate PROC
; do XOR:
        EOR      r0,r0,#0x80000000
        BX       lr
        ENDP
