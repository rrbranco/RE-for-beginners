my_abs PROC
        CMP      r0,#0
; §ist Eingabewert größer gleich 0?§
; §falls ja, überspringe RSBS Befehl§
        BGE      |L0.6|
; subtrahiere Eingabewert von 0:
        RSBS     r0,r0,#0
|L0.6|
        BX       lr
        ENDP
