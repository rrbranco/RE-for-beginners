my_max PROC
; R0=A
; R1=B
; vergleiche A und B:
        CMP      r0,r1
; §gib B anstatt A zurück, indem B nach R0 geschrieben wird§
; §dieser Befehl wird nur ausgeführt, falls A<=B (deshalb, LE - Less or Equal)§
; §wenn der Befehl nicht ausgeführt wird (im Falle von A>B), ist A immer noch im R0 Register§
        MOVLE    r0,r1
        BX       lr
        ENDP

my_min PROC
; R0=A
; R1=B
; vergleiche A und B:
        CMP      r0,r1
; §gib B anstatt A zurück, indem B nach R0 geschrieben wird§
; §dieser Befehl wird nur ausgeführt, falls A>=B (deshalb, GE - Greater or Equal)§
; §wenn der Befehl nicht ausgeführt wird (im Falle von A<B), ist A immer noch im R0 Register§
        MOVGE    r0,r1
        BX       lr
        ENDP
