f PROC
; §comparer la valeur en entrée avec 10§
        CMP      r0,#0xa
; §si le résultat de la comparaison est égal (EQual), copier le pointeur sur la chaîne "it is ten" dans R0§
        ADREQ    r0,|L0.16| ; "it is ten"
; §si le résultat de la comparaison est non égal (Not EQual), copier le pointeur sur la chaîne "it is not ten" dans R0§
        ADRNE    r0,|L0.28| ; "it is not ten"
        BX       lr
        ENDP

|L0.16|
        DCB      "it is ten",0
|L0.28|
        DCB      "it is not ten",0
