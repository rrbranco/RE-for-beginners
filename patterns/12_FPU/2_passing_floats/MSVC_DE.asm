CONST    SEGMENT
__real@40400147ae147ae1 DQ 040400147ae147ae1r    ; 32.01
__real@3ff8a3d70a3d70a4 DQ 03ff8a3d70a3d70a4r    ; 1.54
CONST    ENDS

_main    PROC
    push   ebp
    mov    ebp, esp
    sub    esp, 8  ; reserviere Speicher für erste Variable
    fld    QWORD PTR __real@3ff8a3d70a3d70a4
    fstp   QWORD PTR [esp]
    sub    esp, 8  ; reserviere Speicher für zweite Variable
    fld    QWORD PTR __real@40400147ae147ae1
    fstp   QWORD PTR [esp]
    call   _pow
    add    esp, 8  ; §\IT{gib}§ Platz für eine Variable frei.

; im lokalen Stack sind hier immer noch 8 Byte für uns reserviert.
; Ergebnis jetzt in ST(0)

    fstp   QWORD PTR [esp] ; verschiebe Ergebnis von ST(0) 
    					   ; auf den lokalen Stack für printf()
    push   OFFSET $SG2651
    call   _printf
    add    esp, 12
    xor    eax, eax
    pop    ebp
    ret    0
_main    ENDP
