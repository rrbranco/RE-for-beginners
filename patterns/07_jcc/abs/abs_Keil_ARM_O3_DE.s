my_abs PROC
        CMP      r0,#0
; §führe "Reverse Subtract" Befehl nur aus, falls Eingabewert kleiner als 0 ist:§
        RSBLT    r0,r0,#0
        BX       lr
        ENDP
