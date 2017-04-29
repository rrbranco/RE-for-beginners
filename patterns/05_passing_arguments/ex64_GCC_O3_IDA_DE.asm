f       proc near
        imul    rsi, rdi
        lea     rax, [rdx+rsi]
        retn
f       endp

main    proc near
        sub     rsp, 8
        mov     rdx, 3333333344444444h ; drittes Argument
        mov     rsi, 1111111122222222h ; zweites Argument
        mov     rdi, 1122334455667788h ; erstes Argument
        call    f
        mov     edi, offset format ; "%lld\n"
        mov     rsi, rax
        xor     eax, eax ; §Anzahl der Vector Register wird übergeben§
        call    _printf
        xor     eax, eax
        add     rsp, 8
        retn
main    endp
