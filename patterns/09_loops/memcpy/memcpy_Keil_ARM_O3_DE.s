my_memcpy PROC
; R0 = Zieladresse
; R1 = Quelladresse
; R2 = Blockgröße

; §initialisiere Zähler (i) mit 0§
        MOV      r3,#0
|L0.4|
; alles kopiert?
        CMP      r3,r2
; §der folgende Codeblock wird nur ausgeführt, falls die \IT{less than}§
; Bedingung, ; d.h., falls R2<R3 oder i<size wahr ist.
; lade Byte von R1+i:
        LDRBCC   r12,[r1,r3]
; speichere Byte an der Stelle R0+i:
        STRBCC   r12,[r0,r3]
; i++
        ADDCC    r3,r3,#1
; §der letzte Befehl des \IT{conditional block}.§
; springe zum Anfang der Schleife, falls i<size
; andernfalls tue nichts (d.h., falls i>=size)
        BCC      |L0.4|
; return
        BX       lr
        ENDP
