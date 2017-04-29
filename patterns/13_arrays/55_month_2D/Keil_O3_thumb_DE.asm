; R0 = Monat
        MOVS     r1,#0xa
; R1 = 10
        MULS     r0,r1,r0
; R0 = R1*R0 = 10*Monat
        LDR      r1,|L0.68|
; R1 = Pointer auf die Tabelle
        ADDS     r0,r0,r1
; R0 = R0+R1 = 10*Monat + Pointer auf die Tabelle
        BX       lr
