my_abs PROC
; очистить бит:
        BIC      r0,r0,#0x80000000
        BX       lr
        ENDP

set_sign PROC
; применить ИЛИ:
        ORR      r0,r0,#0x80000000
        BX       lr
        ENDP

negate PROC
; применить исключающее ИЛИ:
        EOR      r0,r0,#0x80000000
        BX       lr
        ENDP
