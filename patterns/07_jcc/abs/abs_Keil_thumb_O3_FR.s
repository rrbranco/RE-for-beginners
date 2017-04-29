my_abs PROC
        CMP      r0,#0
; §est-ce que la valeur en entrée est égale ou plus grande que zéro?§
; si oui, sauter l'instruction RSBS
        BGE      |L0.6|
; §soustraire la valeur en entrée de 0:§
        RSBS     r0,r0,#0
|L0.6|
        BX       lr
        ENDP
