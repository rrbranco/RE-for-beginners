f PROC
; §comparer la valeur entrée avec 10§
        CMP      r0,#0xa
; §sauter en |L0.8| si égal (EQual )§
        BEQ      |L0.8|
        ADR      r0,|L0.12| ; "it is not ten"
        BX       lr
|L0.8|
        ADR      r0,|L0.28| ; "it is ten"
        BX       lr
        ENDP

|L0.12|
        DCB      "it is not ten",0
|L0.28|
        DCB      "it is ten",0
