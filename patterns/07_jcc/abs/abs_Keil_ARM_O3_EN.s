my_abs PROC
        CMP      r0,#0
; execute "Reverse Subtract" instruction only if input value is less than 0:
        RSBLT    r0,r0,#0
        BX       lr
        ENDP
