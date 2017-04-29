my_max PROC
; R0=A
; R1=B
; сравнить A и B:
        CMP      r0,r1
; переход, если A больше B:
        BGT      |L0.6|
; в противном случае (A<=B) возврат R1 (B):
        MOVS     r0,r1
|L0.6|
; возврат
        BX       lr
        ENDP

my_min PROC
; R0=A
; R1=B
; сравнить A и B:
        CMP      r0,r1
; переход, если A меньше B:
        BLT      |L0.14|
; в противном случае (A>=B) возврат R1 (B):
        MOVS     r0,r1
|L0.14|
; возврат
        BX       lr
        ENDP
