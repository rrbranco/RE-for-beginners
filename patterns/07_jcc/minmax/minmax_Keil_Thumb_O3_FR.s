my_max PROC
; R0=A
; R1=B
; comparer A et B:
        CMP      r0,r1
; §branchement si A est supérieur à B:§
        BGT      |L0.6|
; autrement (A<=B) renvoyer R1 (B):
        MOVS     r0,r1
|L0.6|
; retourner
        BX       lr
        ENDP

my_min PROC
; R0=A
; R1=B
; comparer A et B:
        CMP      r0,r1
; §branchement si A est inférieur à B:§
        BLT      |L0.14|
; autrement (A>=B) renvoyer R1 (B):
        MOVS     r0,r1
|L0.14|
; retourner
        BX       lr
        ENDP
