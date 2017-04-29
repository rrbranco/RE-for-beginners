f PROC
; vergleiche Eingabewert mit 10
        CMP      r0,#0xa
; falls Operanden gleich, kopiere Pointer auf den "it is ten" String nach R0
        ADREQ    r0,|L0.16| ; "it is ten"
; falls Operanden ungleich, kopiere Pointer auf den "it is not ten" String nach R0
        ADRNE    r0,|L0.28| ; "it is not ten"
        BX       lr
        ENDP

|L0.16|
        DCB      "it is ten",0
|L0.28|
        DCB      "it is not ten",0
