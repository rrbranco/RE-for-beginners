; R0 = Monat
        LDR      r1,|L0.104|
; R1 = Pointer auf die Tabelle
        ADD      r0,r0,r0,LSL #2
; R0 = R0+R0<<2 = R0+R0*4 = Monat*5
        ADD      r0,r1,r0,LSL #1
; R0 = R1+R0<<2 = Pointer auf die Tabelle + Monat*5*2 = Pointer auf die Tabelle + Monat*10
        BX       lr
