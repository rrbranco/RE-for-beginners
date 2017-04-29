d_max proc near

b               = qword ptr -10h
a               = qword ptr -8
a_first_half    = dword ptr  8
a_second_half   = dword ptr  0Ch
b_first_half    = dword ptr  10h
b_second_half   = dword ptr  14h

    push    ebp
    mov     ebp, esp
    sub     esp, 10h

; lege a und b auf den lokalen Stack:

    mov     eax, [ebp+a_first_half]
    mov     dword ptr [ebp+a], eax
    mov     eax, [ebp+a_second_half]
    mov     dword ptr [ebp+a+4], eax
    mov     eax, [ebp+b_first_half]
    mov     dword ptr [ebp+b], eax
    mov     eax, [ebp+b_second_half]
    mov     dword ptr [ebp+b+4], eax

; lade a und b auf den FPU Stack:

    fld     [ebp+a]
    fld     [ebp+b]

; aktueller Stand des Stacks: ST(0) - b; ST(1) - a

    fxch    st(1) ; dieser Befehl vertauscht ST(1) und ST(0)

; aktueller Stand des Stacks: ST(0) - a; ST(1) - b

    fucompp    ; vergleichee a und b und nimm zwei Werte (d.h. a und b) vom
    ; Stack
    fnstsw  ax ; speichere FPU Status in AX
    sahf       ; lade SF, ZF, AF, PF, und CF Flags aus AH
    setnbe  al ; speichere 1 in AL, falls CF=0 und ZF=0
    test    al, al            ; AL==0 ?
    jz      short loc_8048453 ; ja
    fld     [ebp+a]
    jmp     short locret_8048456

loc_8048453:
    fld     [ebp+b]

locret_8048456:
    leave
    retn
d_max endp
