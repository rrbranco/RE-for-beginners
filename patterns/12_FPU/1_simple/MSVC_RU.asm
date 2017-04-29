CONST    SEGMENT
__real@4010666666666666 DQ 04010666666666666r    ; 4.1
CONST    ENDS
CONST    SEGMENT
__real@40091eb851eb851f DQ 040091eb851eb851fr    ; 3.14
CONST    ENDS
_TEXT    SEGMENT
_a$ = 8           ; size = 8
_b$ = 16          ; size = 8
_f  PROC
    push   ebp
    mov    ebp, esp
    fld    QWORD PTR _a$[ebp]

; текущее состояние стека: ST(0) = _a

    fdiv   QWORD PTR __real@40091eb851eb851f

; текущее состояние стека: ST(0) = результат деления _a на 3.14

    fld    QWORD PTR _b$[ebp]

; текущее состояние стека: ST(0) = _b;
; ST(1) = результат деления _a на 3.14

    fmul   QWORD PTR __real@4010666666666666

; текущее состояние стека: 
; ST(0) = результат умножения _b на 4.1; 
; ST(1) = результат деления _a на 3.14

    faddp  ST(1), ST(0)

; текущее состояние стека: ST(0) = результат сложения

    pop    ebp
    ret    0
_f  ENDP
