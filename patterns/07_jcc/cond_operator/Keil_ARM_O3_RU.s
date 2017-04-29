f PROC
; сравнить входное значение с 10
        CMP      r0,#0xa
; если результат сравнения EQual §(равно)§, скопировать указатель на строку "it is ten" в R0
        ADREQ    r0,|L0.16| ; "it is ten"
; если результат сравнения Not Equal (§не§ §равно§), скопировать указатель на строку "it is not ten" в R0
        ADRNE    r0,|L0.28| ; "it is not ten"
        BX       lr
        ENDP

|L0.16|
        DCB      "it is ten",0
|L0.28|
        DCB      "it is not ten",0
