my_abs PROC
        CMP      r0,#0
; §exécuter l'instruction "Reverse Subtract" seulement si la valeur en entrée§
; est plus petite que 0:
        RSBLT    r0,r0,#0
        BX       lr
        ENDP
