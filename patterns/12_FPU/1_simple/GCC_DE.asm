                public f
f               proc near

arg_0           = qword ptr  8
arg_8           = qword ptr  10h

                push    ebp
                fld     ds:dbl_8048608 ; 3.14

; Stand des Stacks: ST(0) = 3.14

                mov     ebp, esp
                fdivr   [ebp+arg_0]

; Aktueller Stand des Stacks: ST(0) = Ergebnis der Division

                fld     ds:dbl_8048610 ; 4.1

; Aktueller Stand des Stacks: ST(0) = 4.1, ST(1) = Ergebnis der Division

                fmul    [ebp+arg_8]

; Aktueller Stand des Stacks: ST(0) = Ergebnis der Multiplikation, ST(1) =
; Ergebnis der Division

                pop     ebp
                faddp   st(1), st

; Aktueller Stand des Stacks: ST(0) = Ergebnis der Addition

                retn
f               endp
