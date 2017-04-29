my_max PROC
; R0=A
; R1=B
; vergleiche A und B:
        CMP      r0,r1
; §verzweige, falls A größer B:§
        BGT      |L0.6|
; §ansonsten (A<=B) liefere R1 (B) zurück:§
        MOVS     r0,r1
|L0.6|
; return
        BX       lr
        ENDP

my_min PROC
; R0=A
; R1=B
; vergleiche A und B:
        CMP      r0,r1
; verzweige, falls A kleiner B:
        BLT      |L0.14|
; §ansonsten (A>=B) liefere R1 (B) zurück:§
        MOVS     r0,r1
|L0.14|
; §Rückgabe§
        BX       lr
        ENDP
