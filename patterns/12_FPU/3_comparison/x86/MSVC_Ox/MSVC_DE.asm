_a$ = 8                ; size = 8
_b$ = 16               ; size = 8
_d_max    PROC
    fld    QWORD PTR _b$[esp-4]
    fld    QWORD PTR _a$[esp-4]

; Zustand des Stacks: ST(0) = _a, ST(1) = _b

    fcom    ST(1) ; vergleiche _a und ST(1) = (_b)
    fnstsw  ax
    test    ah, 65 ; 00000041H
    jne     SHORT $LN5@d_max
; kopiere ST(0) nach ST(1) und hole Register vom Stack,
; lasse (_a) oben auf dem Stack
    fstp    ST(1)  

; Zustand des Stacks: ST(0) = _a

    ret    0
$LN5@d_max:
; kopiere ST(0) nach ST(0) und hole Register vom Stack,
; lasse (_b) oben auf dem Stack
    fstp    ST(0)  

; Zustand des Stacks: ST(0) = _b

    ret    0
_d_max    ENDP
