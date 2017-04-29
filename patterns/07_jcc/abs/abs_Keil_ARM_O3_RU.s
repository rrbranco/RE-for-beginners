my_abs PROC
        CMP      r0,#0
; исполнить инструкцию "Reverse Subtract" только в случае, если входное значение меньше 0:
        RSBLT    r0,r0,#0
        BX       lr
        ENDP
