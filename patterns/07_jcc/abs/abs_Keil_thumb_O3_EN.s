my_abs PROC
        CMP      r0,#0
; is input value equal to zero or greater than zero?
; skip RSBS instruction then
        BGE      |L0.6|
; subtract input value from 0:
        RSBS     r0,r0,#0
|L0.6|
        BX       lr
        ENDP
